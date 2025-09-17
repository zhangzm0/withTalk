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

import "input.dart";
import "message.dart";
import "current.dart";
import "settings.dart";
import "../util.dart";
import "../config.dart";
import "../gen/l10n.dart";
import "../settings/api.dart";

import "dart:io";
import "package:flutter/material.dart";
import "package:screenshot/screenshot.dart";
import "package:animate_do/animate_do.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final chatProvider =
    NotifierProvider.autoDispose<ChatNotifier, void>(ChatNotifier.new);

final chatsProvider =
    NotifierProvider.autoDispose<ChatsNotifier, void>(ChatsNotifier.new);

final messagesProvider =
    NotifierProvider.autoDispose<MessagesNotifier, void>(MessagesNotifier.new);

class ChatNotifier extends AutoDisposeNotifier<void> {
  @override
  void build() => ref.listen(apisProvider, (p, n) => notify());
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

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final List<ChatConfig> _chats = Config.chats;
  final List<Message> _messages = Current.messages;
  final ScrollController _scrollCtrl = ScrollController();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: SafeArea(child: _buildDrawer()),
      ),
      body: _buildBody(),
    );
  }

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
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: ChatSettings(),
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          onOpened: () => InputWidget.unFocus(),
          color: Theme.of(context).colorScheme.surfaceContainerLow,
          itemBuilder: (context) => <PopupMenuItem>[
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
                  content: Text(S.of(context).cloned_successfully),
                );
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

                final result = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(S.of(context).clear_chat),
                    content: Text(S.of(context).ensure_clear_chat),
                    actions: [
                      TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text(S.of(context).cancel),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text(S.of(context).clear),
                      ),
                    ],
                  ),
                );
                if (!(result ?? false)) return;

                _messages.clear();
                Current.save();

                ref.read(messagesProvider.notifier).notify();
              },
            ),
            PopupMenuItem(
              height: 1,
              padding: EdgeInsets.zero,
              child: const Divider(height: 1),
            ),
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
          title: Text(
            "ChatBot",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.of(context).pushNamed("/settings"),
          ),
          contentPadding: const EdgeInsets.only(left: 16, right: 8),
        ),
        Divider(),
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 8, right: 8),
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
          child: Text(
            S.of(context).all_chats,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              ref.watch(chatsProvider);

              return ListView.builder(
                itemCount: _chats.length,
                itemBuilder: (context, index) => _buildChatItem(index),
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
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
      margin: EdgeInsets.only(top: 4),
      child: ListTile(
        dense: true,
        minTileHeight: 48,
        shape: const StadiumBorder(),
        leading: const Icon(Icons.article),
        selected: Current.chat == chat,
        contentPadding: const EdgeInsets.only(left: 16, right: 8),
        title: Text(
          chat.title,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
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
            File(Config.chatFilePath(chat.fileName)).delete();

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
                builder: (context, ref, child) {
                  ref.watch(messagesProvider);

                  final length = _messages.length;
                  return ListView.separated(
                    reverse: true,
                    shrinkWrap: true,
                    controller: _scrollCtrl,
                    padding: const EdgeInsets.all(16),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: length,
                    itemBuilder: (context, index) {
                      final message = _messages[length - index - 1];
                      return MessageWidget(
                        key: ValueKey(message),
                        message: message,
                      );
                    },
                  );
                },
              ),
              Positioned(
                bottom: 8,
                child: Consumer(
                  builder: (context, ref, child) {
                    final show = ref.watch(_toBottomProvider);

                    final child = ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(8),
                      ),
                      onPressed: () => _scrollCtrl.jumpTo(0),
                      child: Icon(Icons.arrow_downward_rounded, size: 20),
                    );

                    return show ? ZoomIn(child: child) : ZoomOut(child: child);
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 8, right: 8, bottom: 8),
          child: const InputWidget(),
        ),
      ],
    );
  }

  Future<void> _exportChatAsImage() async {
    InputWidget.unFocus();
    if (Current.messages.isEmpty) return;

    try {
      Dialogs.loading(
        context: context,
        hint: S.of(context).exporting,
      );

      final width = MediaQuery.of(context).size.width;
      final page = Container(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
        constraints: BoxConstraints(maxWidth: width),
        child: MediaQuery(
          data: MediaQueryData.fromView(View.of(context)).copyWith(
            size: Size(width, double.infinity),
          ),
          child: Column(
            children: [
              for (final message in _messages) ...[
                MessageView(message: message),
                const SizedBox(height: 16),
              ]
            ],
          ),
        ),
      );

      final png = await ScreenshotController().captureFromLongWidget(
        InheritedTheme.captureAll(
          context,
          Material(child: page),
        ),
        context: context,
        pixelRatio: MediaQuery.of(context).devicePixelRatio,
      );

      final time = DateTime.now().millisecondsSinceEpoch.toString();
      final path = Config.cacheFilePath("$time.png");

      final file = File(path);
      await file.writeAsBytes(png.toList());

      if (!mounted) return;
      Navigator.of(context).pop();

      Dialogs.handleImage(context: context, path: path);
    } catch (e) {
      Navigator.of(context).pop();
      Dialogs.error(context: context, error: e);
    }
  }
}

final _toBottomProvider =
    AutoDisposeNotifierProvider<_ToBottomNotifier, bool>(_ToBottomNotifier.new);

class _ToBottomNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    ref.listen(messagesProvider, (prev, next) {
      if (state) hide();
    });
    return false;
  }

  void show() => state = true;
  void hide() => state = false;
}
