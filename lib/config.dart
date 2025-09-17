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

import "dart:io";
import "dart:convert";
import "dart:isolate";
import "package:http/http.dart";
import "package:flutter/material.dart";
import "package:archive/archive_io.dart";
import "package:path_provider/path_provider.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:shared_preferences/shared_preferences.dart";

class Config {
  static late final TtsConfig tts;
  static late final CicConfig cic;
  static late final CoreConfig core;
  static late final ImageConfig image;
  static late final TitleConfig title;
  static late final SearchConfig search;
  static late final VectorConfig vector;
  static late final DocumentConfig document;

  static final List<ChatConfig> chats = [];
  static final Map<String, BotConfig> bots = {};
  static final Map<String, ApiConfig> apis = {};
  static final Map<String, ModelConfig> models = {};

  static late final File _file;
  static late final String _dir;
  static late final String _sep;
  static late final String _cache;

  static const String _chatDir = "chat";
  static const String _audioDir = "audio";
  static const String _imageDir = "image";
  static const String _settingsFile = "settings.json";

  static Future<void> init() async {
    _sep = Platform.pathSeparator;
    _cache = (await getTemporaryDirectory()).path;
    if (Platform.isAndroid) {
      _dir = (await getExternalStorageDirectory())!.path;
    } else {
      _dir = (await getApplicationSupportDirectory()).path;
    }

    _initDir();
    _initFile();
    _fixChatFile();

    await Preferences.init();
  }

  static Future<void> save() async {
    await _file.writeAsString(jsonEncode(toJson()));
  }

  static String chatFilePath(String fileName) =>
      "$_dir$_sep$_chatDir$_sep$fileName";
  static String audioFilePath(String fileName) =>
      "$_dir$_sep$_audioDir$_sep$fileName";
  static String imageFilePath(String fileName) =>
      "$_dir$_sep$_imageDir$_sep$fileName";
  static String cacheFilePath(String fileName) => "$_cache$_sep$fileName";

  static Map toJson() => {
        "tts": tts,
        "cic": cic,
        "core": core,
        "bots": bots,
        "apis": apis,
        "chats": chats,
        "image": image,
        "title": title,
        "search": search,
        "vector": vector,
        "models": models,
        "document": document,
      };

  static void fromJson(Map json) {
    final ttsJson = json["tts"] ?? {};
    final imgJson = json["cic"] ?? {};
    final coreJson = json["core"] ?? {};
    final botsJson = json["bots"] ?? {};
    final apisJson = json["apis"] ?? {};
    final chatsJson = json["chats"] ?? [];
    final imageJson = json["image"] ?? {};
    final titleJson = json["title"] ?? {};
    final searchJson = json["search"] ?? {};
    final vectorJson = json["vector"] ?? {};
    final modelsJson = json["models"] ?? {};
    final documentJson = json["document"] ?? {};

    tts = TtsConfig.fromJson(ttsJson);
    cic = CicConfig.fromJson(imgJson);
    core = CoreConfig.fromJson(coreJson);
    image = ImageConfig.fromJson(imageJson);
    title = TitleConfig.fromJson(titleJson);
    search = SearchConfig.fromJson(searchJson);
    vector = VectorConfig.fromJson(vectorJson);
    document = DocumentConfig.fromJson(documentJson);

    for (final chat in chatsJson) {
      chats.add(ChatConfig.fromJson(chat));
    }
    for (final pair in botsJson.entries) {
      bots[pair.key] = BotConfig.fromJson(pair.value);
    }
    for (final pair in apisJson.entries) {
      apis[pair.key] = ApiConfig.fromJson(pair.value);
    }
    for (final pair in modelsJson.entries) {
      models[pair.key] = ModelConfig.fromJson(pair.value);
    }
  }

  static void _initDir() {
    final chatPath = "$_dir$_sep$_chatDir";
    final chatDir = Directory(chatPath);
    if (!(chatDir.existsSync())) {
      chatDir.createSync();
    }

    final imagePath = "$_dir$_sep$_imageDir";
    final imageDir = Directory(imagePath);
    if (!(imageDir.existsSync())) {
      imageDir.createSync();
    }

    final audioPath = "$_dir$_sep$_audioDir";
    final audioDir = Directory(audioPath);
    if (!(audioDir.existsSync())) {
      audioDir.createSync();
    }
  }

  static void _initFile() {
    final path = "$_dir$_sep$_settingsFile";
    _file = File(path);

    if (_file.existsSync()) {
      final data = _file.readAsStringSync();
      fromJson(jsonDecode(data));
    } else {
      fromJson({});
    }
  }

  static void _fixChatFile() {
    for (final chat in chats) {
      final fileName = chat.fileName;
      final oldPath = "$_dir$_sep$fileName";
      final newPath = chatFilePath(fileName);

      final file = File(oldPath);
      if (file.existsSync()) {
        file.renameSync(newPath);
      }
    }
  }
}

class Backup {
  static Future<void> exportConfig(String to) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final path = "$to${Config._sep}chatbot-backup-$time.zip";
    final root = Directory(Config._dir);

    await Isolate.run(() async {
      final encoder = ZipFileEncoder();
      encoder.create(path);

      await for (final entity in root.list()) {
        if (entity is File) {
          encoder.addFile(entity);
        } else if (entity is Directory) {
          encoder.addDirectory(entity);
        }
      }
      await encoder.close();
    });
  }

  static Future<void> importConfig(String from) async {
    final root = Config._dir;

    await Isolate.run(() async {
      await extractFileToDisk(from, root);
    });
  }

  static Future<void> clearData(List<String> dirs) async {
    final root = Config._dir;
    final sep = Config._sep;

    await Isolate.run(() async {
      for (final dir in dirs) {
        final directory = Directory("$root$sep$dir");
        if (!directory.existsSync()) continue;
        directory.deleteSync(recursive: true);
      }
    });

    Config._initDir();
  }
}

class Updater {
  static List<int>? versionCode;
  static const String latestUrl =
      "https://github.com/fanenr/flutter-chatbot/releases/latest";
  static const String apiEndPoint =
      "https://api.github.com/repos/fanenr/flutter-chatbot/releases/latest";

  static Future<Map?> check() async {
    if (versionCode == null) {
      final version = (await PackageInfo.fromPlatform()).version;
      versionCode = version.split('.').map(int.parse).toList();
    }

    final client = Client();
    final response = await client.get(Uri.parse(apiEndPoint));

    if (response.statusCode != 200) {
      throw "${response.statusCode} ${response.body}";
    }

    final json = jsonDecode(response.body);
    return _isNewer(json["tag_name"]) ? json : null;
  }

  static bool _isNewer(String latest) {
    final latestCode = latest.substring(1).split('.').map(int.parse).toList();
    for (int i = 0; i < 3; i++) {
      if (latestCode[i] < versionCode![i]) return false;
      if (latestCode[i] > versionCode![i]) return true;
    }
    return false;
  }
}

class Preferences {
  static late bool _search;
  static late bool _googleSearch;
  static late SharedPreferencesAsync _prefs;

  static Future<void> init() async {
    SharedPreferences.setPrefix("chatbot");
    _prefs = SharedPreferencesAsync();
    await _init();
  }

  static bool get search => _search;
  static bool get googleSearch => _googleSearch;

  static set search(bool value) {
    _search = value;
    _prefs.setBool("search", value);
  }

  static set googleSearch(bool value) {
    _googleSearch = value;
    _prefs.setBool("googleSearch", value);
  }

  static Future<void> _init() async {
    _search = await _prefs.getBool("search") ?? false;
    _googleSearch = await _prefs.getBool("googleSearch") ?? false;
  }
}

class BotConfig {
  bool? stream;
  int? maxTokens;
  double? temperature;
  String? systemPrompts;

  BotConfig({
    this.stream,
    this.maxTokens,
    this.temperature,
    this.systemPrompts,
  });

  Map toJson() => {
        "stream": stream,
        "maxTokens": maxTokens,
        "temperature": temperature,
        "systemPrompts": systemPrompts,
      };

  factory BotConfig.fromJson(Map json) => BotConfig(
        stream: json["stream"],
        maxTokens: json["maxTokens"],
        temperature: json["temperature"],
        systemPrompts: json["systemPrompts"],
      );
}

class ApiConfig {
  String url;
  String key;
  String? type;
  List<String> models;

  ApiConfig({
    required this.url,
    required this.key,
    required this.models,
    this.type,
  });

  Map toJson() => {
        "url": url,
        "key": key,
        "type": type,
        "models": models,
      };

  factory ApiConfig.fromJson(Map json) => ApiConfig(
        url: json["url"],
        key: json["key"],
        type: json["type"],
        models: json["models"].cast<String>(),
      );
}

class CoreConfig {
  String? _bot;
  String? _api;
  String? _model;

  CoreConfig({
    String? bot,
    String? api,
    String? model,
  })  : _bot = bot,
        _api = api,
        _model = model;

  String? get bot => Config.bots.containsKey(_bot) ? _bot : null;
  String? get api => Config.apis.containsKey(_api) ? _api : null;
  String? get model =>
      (Config.apis[_api]?.models.contains(_model) ?? false) ? _model : null;

  set bot(String? value) => _bot = value;
  set api(String? value) => _api = value;
  set model(String? value) => _model = value;

  Map toJson() => {
        "bot": bot,
        "api": api,
        "model": model,
      };

  factory CoreConfig.fromJson(Map json) => CoreConfig(
        bot: json["bot"],
        api: json["api"],
        model: json["model"],
      );
}

class ChatConfig {
  String time;
  String title;
  String fileName;

  ChatConfig({
    required this.time,
    required this.title,
    required this.fileName,
  });

  Map toJson() => {
        "time": time,
        "title": title,
        "fileName": fileName,
      };

  factory ChatConfig.fromJson(Map json) => ChatConfig(
        time: json["time"],
        title: json["title"],
        fileName: json["fileName"],
      );
}

class TtsConfig {
  String? _api;
  String? _model;
  String? voice;

  TtsConfig({
    String? api,
    String? model,
    this.voice,
  })  : _api = api,
        _model = model;

  String? get api => Config.apis.containsKey(_api) ? _api : null;
  String? get model =>
      (Config.apis[_api]?.models.contains(_model) ?? false) ? _model : null;

  set api(String? value) => _api = value;
  set model(String? value) => _model = value;

  Map toJson() => {
        "api": api,
        "model": model,
        "voice": voice,
      };

  factory TtsConfig.fromJson(Map json) => TtsConfig(
        api: json["api"],
        model: json["model"],
        voice: json["voice"],
      );
}

class CicConfig {
  bool? enable;
  int? quality;
  int? minWidth;
  int? minHeight;

  CicConfig({
    this.enable,
    this.quality,
    this.minWidth,
    this.minHeight,
  });

  Map toJson() => {
        "enable": enable,
        "quality": quality,
        "minWidth": minWidth,
        "minHeight": minHeight,
      };

  factory CicConfig.fromJson(Map json) => CicConfig(
        enable: json["enable"],
        quality: json["quality"],
        minWidth: json["minWidth"],
        minHeight: json["minHeight"],
      );
}

class ImageConfig {
  String? _api;
  String? _model;
  String? size;
  String? style;
  String? quality;

  ImageConfig({
    String? api,
    String? model,
    this.size,
    this.style,
    this.quality,
  })  : _api = api,
        _model = model;

  String? get api => Config.apis.containsKey(_api) ? _api : null;
  String? get model =>
      (Config.apis[_api]?.models.contains(_model) ?? false) ? _model : null;

  set api(String? value) => _api = value;
  set model(String? value) => _model = value;

  Map toJson() => {
        "api": api,
        "model": model,
        "size": size,
        "style": style,
        "quality": quality,
      };

  factory ImageConfig.fromJson(Map json) => ImageConfig(
        api: json["api"],
        size: json["size"],
        model: json["model"],
        style: json["style"],
        quality: json["quality"],
      );
}

class ModelConfig {
  bool chat;
  String name;

  ModelConfig({
    required this.chat,
    required this.name,
  });

  Map toJson() => {
        "chat": chat,
        "name": name,
      };

  factory ModelConfig.fromJson(Map json) => ModelConfig(
        chat: json["chat"],
        name: json["name"],
      );
}

class TitleConfig {
  bool? enable;
  String? _api;
  String? _model;
  String? prompt;

  TitleConfig({
    String? api,
    String? model,
    this.enable,
    this.prompt,
  })  : _api = api,
        _model = model;

  String? get api => Config.apis.containsKey(_api) ? _api : null;
  String? get model =>
      (Config.apis[_api]?.models.contains(_model) ?? false) ? _model : null;

  set api(String? value) => _api = value;
  set model(String? value) => _model = value;

  Map toJson() => {
        "api": api,
        "model": model,
        "prompt": prompt,
        "enable": enable,
      };

  factory TitleConfig.fromJson(Map json) => TitleConfig(
        api: json["api"],
        model: json["model"],
        prompt: json["prompt"],
        enable: json["enable"],
      );
}

class SearchConfig {
  int? n;
  bool? vector;
  int? queryTime;
  int? fetchTime;
  String? prompt;
  String? searxng;

  SearchConfig({
    this.n,
    this.vector,
    this.prompt,
    this.searxng,
    this.queryTime,
    this.fetchTime,
  });

  Map toJson() => {
        "n": n,
        "vector": vector,
        "prompt": prompt,
        "query": queryTime,
        "fetch": fetchTime,
        "searxng": searxng,
      };

  factory SearchConfig.fromJson(Map json) => SearchConfig(
        n: json["n"],
        vector: json["vector"],
        prompt: json["prompt"],
        queryTime: json["query"],
        fetchTime: json["fetch"],
        searxng: json["searxng"],
      );
}

class VectorConfig {
  String? _api;
  String? _model;
  int? batchSize;
  int? dimensions;

  VectorConfig({
    String? api,
    String? model,
    this.batchSize,
    this.dimensions,
  })  : _api = api,
        _model = model;

  String? get api => Config.apis.containsKey(_api) ? _api : null;
  String? get model =>
      (Config.apis[_api]?.models.contains(_model) ?? false) ? _model : null;

  set api(String? value) => _api = value;
  set model(String? value) => _model = value;

  factory VectorConfig.fromJson(Map json) => VectorConfig(
        api: json["api"],
        model: json["model"],
        batchSize: json["batchSize"],
        dimensions: json["dimensions"],
      );

  Map toJson() => {
        "api": api,
        "model": model,
        "batchSize": batchSize,
        "dimensions": dimensions,
      };
}

class DocumentConfig {
  int? n;
  int? size;
  int? overlap;

  DocumentConfig({
    this.n,
    this.size,
    this.overlap,
  });

  Map toJson() => {
        "n": n,
        "size": size,
        "overlap": overlap,
      };

  factory DocumentConfig.fromJson(Map json) => DocumentConfig(
        n: json["n"],
        size: json["size"],
        overlap: json["overlap"],
      );
}

const _baseColor = Colors.indigo;

final ColorScheme darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: _baseColor,
);

final ColorScheme lightColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: _baseColor,
);

final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  colorScheme: darkColorScheme,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: darkColorScheme.surface,
  ),
  appBarTheme: AppBarTheme(color: darkColorScheme.primaryContainer),
);

final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: lightColorScheme,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: lightColorScheme.surface,
  ),
  appBarTheme: AppBarTheme(color: lightColorScheme.primaryContainer),
);
