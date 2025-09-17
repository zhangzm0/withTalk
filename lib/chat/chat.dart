// This file is part of ChatBot.
//
// ChatBot is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// ChatBot is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with ChatBot. If not, see <https://www.gnu.org/licenses/>.

// 顶部版权注释与原文件一致，此处省略
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screenshot/screenshot.dart';
import 'package:animate_do/animate_do.dart';

import 'input.dart';
import 'message.dart';
import 'current.dart';
import 'settings.dart';
import '../util.dart';
import '../config.dart';
import '../gen/l10n.dart';
import '../settings/api.dart';
import 'input_page.dart'; // 新增

/* ========== 原有 Provider 完全不变 ========== */
final chatProvider =
    NotifierProvider.autoDispose<ChatNotifier, void>(ChatNotifier.new);
final chatsProvider =
    NotifierProvider.autoDispose<ChatsNotifier, void>(ChatsNotifier.new);
final messagesProvider =
    NotifierProvider.autoDispose<MessagesNotifier, void>(MessagesNotifier.new);

class ChatNotifier extends AutoDisposeNotifier<void> {
  @override
  void build() => ref.listen(apisProvider, (_, __) => notify());
  void notify() => ref.notifyListeners();
}

class ChatsNotifier extends AutoDisposeNotifier<void> {
  @override
  void build() {}
  void notify() => ref.notifyListeners();
}

class MessagesNotifier extends AutoDisposeNotifier<void> {
  @override
  void build() {}
  void notify() => ref.notifyListeners();
}
/* =========================================== */

/// 全局 Key，用于从 InputWidget 调用 _focusInput
final GlobalKey<_ChatPageState> chatPageKey = GlobalKey();

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  /* 原有成员全部保留 */
  final List<ChatConfig> _chats = Config.chats;
  final List<Message> _messages = Current.messages;
  final ScrollController _scrollCtrl = ScrollController();

  /* 新增：PageView 控制器 */
  final PageController _pageController = PageController();

  /* 小屏判定 */
  bool get _isNarrow => MediaQuery.of(context).size.width < 600;

  /* 供 InputWidget 调用，自动滑到输入页 */
  void _focusInput() {
    if (_isNarrow && (_pageController.page ?? 0) < 0.5) {
      _pageController.animateToPage(1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Util.checkUpdate(context: context, notify: false);
    });
    _scrollCtrl.addListener(() {
      final show = ref.read(_toBottomProvider);
      if (_scrollCtrl.position.pixels < 200) {
        if (show) ref.read(_toBottomProvider.notifier).hide();
      } else {
        if (!show) ref.read(_toBottomProvider.notifier).show();
      }
    });
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    _pageController.dispose();
    super.dispose();
  }

  /* ========== 原有 AppBar、Drawer、body 逻辑全部搬进来，不加修改 ========== */
  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        children: [
          Flexible(
            child: Consumer(
              builder: (context, ref, child) {
                ref.watch(chatProvider);
                final id = Current.model;
                final config = Config.models[id];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Current.title ?? S.of(context).new_chat,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      config?.name ?? id ?? S.of(context).no_model,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          SizedBox.square(
            dimension: 32,
            child: IconButton(
              icon: const Icon(Icons.edit, size: 16),
              padding: EdgeInsets.zero,
              onPressed: () {
                InputWidget.unFocus();
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (_) => Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const ChatSettings(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            InputWidget.unFocus();
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_horiz),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onOpened: () => InputWidget.unFocus(),
          color: Theme.of(context).colorScheme.surfaceContainerLow,
          itemBuilder: (_) => [
            PopupMenuItem(
              padding: EdgeInsets.zero,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                leading: const Icon(Icons.file_copy, size: 20),
                title: Text(S.of(context).clone_chat),
                minTileHeight: 0,
              ),
              onTap: () {
                InputWidget.unFocus();
                if (!Current.hasChat) return;
                Current.newChat(Current.title!);
                Current.save();
                Util.showSnackBar(
                    context: context,
                    content: Text(S.of(context).cloned_successfully));
                ref.read(chatsProvider.notifier).notify();
              },
            ),
            PopupMenuItem(
              padding: EdgeInsets.zero,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                leading: const Icon(Icons.delete, size: 24),
                title: Text(S.of(context).clear_chat),
                minTileHeight: 0,
              ),
              onTap: () async {
                InputWidget.unFocus();
                if (_messages.isEmpty) return;
                final ok = await showDialog<bool>(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(S.of(context).clear_chat),
                    content: Text(S.of(context).ensure_clear_chat),
                    actions: [
                      TextButton(
                          onPressed: Navigator.of(context).pop,
                          child: Text(S.of(context).cancel)),
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text(S.of(context).clear)),
                    ],
                  ),
                );
                if (!(ok ?? false)) return;
                _messages.clear();
                Current.save();
                ref.read(messagesProvider.notifier).notify();
              },
            ),
            const PopupMenuItem(height: 1, child: Divider(height: 1)),
            PopupMenuItem(
              padding: EdgeInsets.zero,
              onTap: _exportChatAsImage,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                leading: const Icon(Icons.photo_library, size: 20),
                title: Text(S.of(context).export_chat_as_image),
                minTileHeight: 0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDrawer() {
    return Column(
      children: [
        ListTile(
          title: Text("ChatBot", style: Theme.of(context).textTheme.titleLarge),
          trailing: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Navigator.of(context).pushNamed("/settings")),
          contentPadding: const EdgeInsets.only(left: 16, right: 8),
        ),
        const Divider(),
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          children: [
            ListTile(
              minTileHeight: 48,
              shape: const StadiumBorder(),
              title: Text(S.of(context).new_chat),
              leading: const Icon(Icons.article_outlined),
              onTap: () {
                if (Current.chatStatus.isResponding) return;
                Current.clear();
                ref.read(chatProvider.notifier).notify();
                ref.read(chatsProvider.notifier).notify();
                ref.read(messagesProvider.notifier).notify();
              },
            ),
            ListTile(
              minTileHeight: 48,
              shape: const StadiumBorder(),
              title: Text(S.of(context).workspace),
              leading: const Icon(Icons.workspaces_outlined),
              onTap: () => Navigator.of(context).pushNamed("/workspace"),
            ),
            ListTile(
              minTileHeight: 48,
              shape: const StadiumBorder(),
              title: Text(S.of(context).image_generation),
              leading: const Icon(Icons.image_outlined),
              onTap: () => Navigator.of(context).pushNamed("/image"),
            ),
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 4),
          child: Text(S.of(context).all_chats,
              style: Theme.of(context).textTheme.labelSmall),
        ),
        Expanded(
          child: Consumer(
            builder: (_, ref, __) {
              ref.watch(chatsProvider);
              return ListView.builder(
                itemCount: _chats.length,
                itemBuilder: (_, i) => _buildChatItem(i),
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildChatItem(int index) {
    final chat = _chats[index];
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: ListTile(
        dense: true,
        minTileHeight: 48,
        shape: const StadiumBorder(),
        leading: const Icon(Icons.article),
        selected: Current.chat == chat,
        contentPadding: const EdgeInsets.only(left: 16, right: 8),
        title: Text(chat.title,
            maxLines: 1, softWrap: false, overflow: TextOverflow.ellipsis),
        subtitle: Text(chat.time),
        onTap: () async {
          if (Current.chat == chat) return;
          Current.chat = chat;
          ref.read(chatsProvider.notifier).notify();
          await Current.load(chat);
          ref.read(chatProvider.notifier).notify();
          ref.read(messagesProvider.notifier).notify();
        },
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            _chats.removeAt(index);
            ref.read(chatsProvider.notifier).notify();
            Config.save();
            File(Config.chatFilePath(chat.fileName)).deleteSync();
            if (Current.chat == chat) {
              Current.clear();
              ref.read(chatProvider.notifier).notify();
              ref.read(messagesProvider.notifier).notify();
            }
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Consumer(
                builder: (_, ref, __) {
                  ref.watch(messagesProvider);
                  final len = _messages.length;
                  return ListView.separated(
                    reverse: true,
                    shrinkWrap: true,
                    controller: _scrollCtrl,
                    padding: const EdgeInsets.all(16),
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemCount: len,
                    itemBuilder: (_, i) {
                      final m = _messages[len - i - 1];
                      return MessageWidget(key: ValueKey(m), message: m);
                    },
                  );
                },
              ),
              Positioned(
                bottom: 8,
                child: Consumer(
                  builder: (_, ref, __) {
                    final show = ref.watch(_toBottomProvider);
                    final btn = ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(8),
                      ),
                      onPressed: () => _scrollCtrl.jumpTo(0),
                      child: const Icon(Icons.arrow_downward_rounded, size: 20),
                    );
                    return show ? ZoomIn(child: btn) : ZoomOut(child: btn);
                  },
                ),
              ),
            ],
          ),
        ),
        /* 大屏才在底部直接显示 InputWidget */
        if (!_isNarrow)
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: InputWidget(),
          ),
      ],
    );
  }

  /* 原有 export 逻辑不动 */
  Future<void> _exportChatAsImage() async {
    InputWidget.unFocus();
    if (_messages.isEmpty) return;
    try {
      Dialogs.loading(context: context, hint: S.of(context).exporting);
      final width = MediaQuery.of(context).size.width;
      final page = Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        constraints: BoxConstraints(maxWidth: width),
        child: MediaQuery(
          data: MediaQueryData.fromView(View.of(context))
              .copyWith(size: Size(width, double.infinity)),
          child: Column(
            children: [
              for (final m in _messages) ...[
                MessageView(message: m),
                const SizedBox(height: 16),
              ]
            ],
          ),
        ),
      );
      final png = await ScreenshotController().captureFromLongWidget(
        InheritedTheme.captureAll(context, Material(child: page)),
        context: context,
        pixelRatio: MediaQuery.of(context).devicePixelRatio,
      );
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      final path = Config.cacheFilePath('$time.png');
      await File(path).writeAsBytes(png);
      if (!mounted) return;
      Navigator.of(context).pop();
      Dialogs.handleImage(context: context, path: path);
    } catch (e) {
      Navigator.of(context).pop();
      Dialogs.error(context: context, error: e);
    }
  }

  /* ===================== 核心布局改造 ===================== */
  @override
  Widget build(BuildContext context) {
    /* 先构建完整的旧 Scaffold（包含 AppBar+Drawer+body） */
    final chatScaffold = Scaffold(
      appBar: _buildAppBar(),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: SafeArea(child: _buildDrawer()),
      ),
      body: _buildBody(),
    );

    /* 宽屏直接返回旧布局 */
    if (!_isNarrow) return chatScaffold;

    /* 窄屏用 PageView 左右滑动 */
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        children: [
          chatScaffold,   // 0: 聊天
          const InputPage(), // 1: 输入（无 AppBar）
        ],
      ),
    );
  }
}

/* ========== 原有 _toBottomProvider 完全不变 ========== */
final _toBottomProvider = AutoDisposeNotifierProvider<_ToBottomNotifier, bool>(
    _ToBottomNotifier.new);

class _ToBottomNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    ref.listen(messagesProvider, (_, __) => hide());
    return false;
  }

  void show() => state = true;
  void hide() => state = false;
}
