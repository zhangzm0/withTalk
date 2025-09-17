// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ChatBot`
  String get title {
    return Intl.message(
      'ChatBot',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Play`
  String get play {
    return Intl.message(
      'Play',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `Source`
  String get source {
    return Intl.message(
      'Source',
      name: 'source',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Images`
  String get images {
    return Intl.message(
      'Images',
      name: 'images',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Bot`
  String get bot {
    return Intl.message(
      'Bot',
      name: 'bot',
      desc: '',
      args: [],
    );
  }

  /// `Bots`
  String get bots {
    return Intl.message(
      'Bots',
      name: 'bots',
      desc: '',
      args: [],
    );
  }

  /// `APIs`
  String get apis {
    return Intl.message(
      'APIs',
      name: 'apis',
      desc: '',
      args: [],
    );
  }

  /// `Config`
  String get config {
    return Intl.message(
      'Config',
      name: 'config',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Reanswer`
  String get reanswer {
    return Intl.message(
      'Reanswer',
      name: 'reanswer',
      desc: '',
      args: [],
    );
  }

  /// `Citations`
  String get citations {
    return Intl.message(
      'Citations',
      name: 'citations',
      desc: '',
      args: [],
    );
  }

  /// `API`
  String get api {
    return Intl.message(
      'API',
      name: 'api',
      desc: '',
      args: [],
    );
  }

  /// `Model`
  String get model {
    return Intl.message(
      'Model',
      name: 'model',
      desc: '',
      args: [],
    );
  }

  /// `Voice`
  String get voice {
    return Intl.message(
      'Voice',
      name: 'voice',
      desc: '',
      args: [],
    );
  }

  /// `Max Tokens`
  String get max_tokens {
    return Intl.message(
      'Max Tokens',
      name: 'max_tokens',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get temperature {
    return Intl.message(
      'Temperature',
      name: 'temperature',
      desc: '',
      args: [],
    );
  }

  /// `System Prompts`
  String get system_prompts {
    return Intl.message(
      'System Prompts',
      name: 'system_prompts',
      desc: '',
      args: [],
    );
  }

  /// `Streaming Response`
  String get streaming_response {
    return Intl.message(
      'Streaming Response',
      name: 'streaming_response',
      desc: '',
      args: [],
    );
  }

  /// `Link`
  String get link {
    return Intl.message(
      'Link',
      name: 'link',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `New Bot`
  String get new_bot {
    return Intl.message(
      'New Bot',
      name: 'new_bot',
      desc: '',
      args: [],
    );
  }

  /// `New API`
  String get new_api {
    return Intl.message(
      'New API',
      name: 'new_api',
      desc: '',
      args: [],
    );
  }

  /// `New Chat`
  String get new_chat {
    return Intl.message(
      'New Chat',
      name: 'new_chat',
      desc: '',
      args: [],
    );
  }

  /// `API Url`
  String get api_url {
    return Intl.message(
      'API Url',
      name: 'api_url',
      desc: '',
      args: [],
    );
  }

  /// `API Key`
  String get api_key {
    return Intl.message(
      'API Key',
      name: 'api_key',
      desc: '',
      args: [],
    );
  }

  /// `API Type`
  String get api_type {
    return Intl.message(
      'API Type',
      name: 'api_type',
      desc: '',
      args: [],
    );
  }

  /// `Model List`
  String get model_list {
    return Intl.message(
      'Model List',
      name: 'model_list',
      desc: '',
      args: [],
    );
  }

  /// `Select Models`
  String get select_models {
    return Intl.message(
      'Select Models',
      name: 'select_models',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a name`
  String get enter_a_name {
    return Intl.message(
      'Please enter a name',
      name: 'enter_a_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a title`
  String get enter_a_title {
    return Intl.message(
      'Please enter a title',
      name: 'enter_a_title',
      desc: '',
      args: [],
    );
  }

  /// `Duplicate Bot name`
  String get duplicate_bot_name {
    return Intl.message(
      'Duplicate Bot name',
      name: 'duplicate_bot_name',
      desc: '',
      args: [],
    );
  }

  /// `Duplicate API name`
  String get duplicate_api_name {
    return Intl.message(
      'Duplicate API name',
      name: 'duplicate_api_name',
      desc: '',
      args: [],
    );
  }

  /// `Please complete all fields`
  String get complete_all_fields {
    return Intl.message(
      'Please complete all fields',
      name: 'complete_all_fields',
      desc: '',
      args: [],
    );
  }

  /// `no model`
  String get no_model {
    return Intl.message(
      'no model',
      name: 'no_model',
      desc: '',
      args: [],
    );
  }

  /// `All Chats`
  String get all_chats {
    return Intl.message(
      'All Chats',
      name: 'all_chats',
      desc: '',
      args: [],
    );
  }

  /// `Chat Title`
  String get chat_title {
    return Intl.message(
      'Chat Title',
      name: 'chat_title',
      desc: '',
      args: [],
    );
  }

  /// `Default Config`
  String get default_config {
    return Intl.message(
      'Default Config',
      name: 'default_config',
      desc: '',
      args: [],
    );
  }

  /// `Text To Speech`
  String get text_to_speech {
    return Intl.message(
      'Text To Speech',
      name: 'text_to_speech',
      desc: '',
      args: [],
    );
  }

  /// `Chat Image Compress`
  String get chat_image_compress {
    return Intl.message(
      'Chat Image Compress',
      name: 'chat_image_compress',
      desc: '',
      args: [],
    );
  }

  /// `Config Import and Export`
  String get config_import_export {
    return Intl.message(
      'Config Import and Export',
      name: 'config_import_export',
      desc: '',
      args: [],
    );
  }

  /// `Choose Bot`
  String get choose_bot {
    return Intl.message(
      'Choose Bot',
      name: 'choose_bot',
      desc: '',
      args: [],
    );
  }

  /// `Choose API`
  String get choose_api {
    return Intl.message(
      'Choose API',
      name: 'choose_api',
      desc: '',
      args: [],
    );
  }

  /// `Choose Model`
  String get choose_model {
    return Intl.message(
      'Choose Model',
      name: 'choose_model',
      desc: '',
      args: [],
    );
  }

  /// `Quality`
  String get quality {
    return Intl.message(
      'Quality',
      name: 'quality',
      desc: '',
      args: [],
    );
  }

  /// `Minimal Width`
  String get min_width {
    return Intl.message(
      'Minimal Width',
      name: 'min_width',
      desc: '',
      args: [],
    );
  }

  /// `Minimal Height`
  String get min_height {
    return Intl.message(
      'Minimal Height',
      name: 'min_height',
      desc: '',
      args: [],
    );
  }

  /// `Minimal Size`
  String get min_width_height {
    return Intl.message(
      'Minimal Size',
      name: 'min_width_height',
      desc: '',
      args: [],
    );
  }

  /// `Export Config`
  String get export_config {
    return Intl.message(
      'Export Config',
      name: 'export_config',
      desc: '',
      args: [],
    );
  }

  /// `Import Config`
  String get import_config {
    return Intl.message(
      'Import Config',
      name: 'import_config',
      desc: '',
      args: [],
    );
  }

  /// `Exporting...`
  String get exporting {
    return Intl.message(
      'Exporting...',
      name: 'exporting',
      desc: '',
      args: [],
    );
  }

  /// `Importing...`
  String get importing {
    return Intl.message(
      'Importing...',
      name: 'importing',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Enable`
  String get enable {
    return Intl.message(
      'Enable',
      name: 'enable',
      desc: '',
      args: [],
    );
  }

  /// `Please Input`
  String get please_input {
    return Intl.message(
      'Please Input',
      name: 'please_input',
      desc: '',
      args: [],
    );
  }

  /// `The original image will be used if compression fails`
  String get image_enable_hint {
    return Intl.message(
      'The original image will be used if compression fails',
      name: 'image_enable_hint',
      desc: '',
      args: [],
    );
  }

  /// `The Quality should be between 1 and 100, with lower values resulting in higher compression. Minimum Width and Minimum Height restrict image resizing. Leave these fields empty if you're unsure.`
  String get image_hint {
    return Intl.message(
      'The Quality should be between 1 and 100, with lower values resulting in higher compression. Minimum Width and Minimum Height restrict image resizing. Leave these fields empty if you\'re unsure.',
      name: 'image_hint',
      desc: '',
      args: [],
    );
  }

  /// `To avoid export failures, it's recommended to export the configuration to the Documents directory, or create a ChatBot subdirectory within your Downloads folder.`
  String get config_hint {
    return Intl.message(
      'To avoid export failures, it\'s recommended to export the configuration to the Documents directory, or create a ChatBot subdirectory within your Downloads folder.',
      name: 'config_hint',
      desc: '',
      args: [],
    );
  }

  /// `Exported Successfully`
  String get exported_successfully {
    return Intl.message(
      'Exported Successfully',
      name: 'exported_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Imported Successfully`
  String get imported_successfully {
    return Intl.message(
      'Imported Successfully',
      name: 'imported_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Please restart App to load the new settings.`
  String get restart_app {
    return Intl.message(
      'Please restart App to load the new settings.',
      name: 'restart_app',
      desc: '',
      args: [],
    );
  }

  /// `Can't write to that directory.`
  String get failed_to_export {
    return Intl.message(
      'Can\'t write to that directory.',
      name: 'failed_to_export',
      desc: '',
      args: [],
    );
  }

  /// `Generate`
  String get generate {
    return Intl.message(
      'Generate',
      name: 'generate',
      desc: '',
      args: [],
    );
  }

  /// `Image Size`
  String get image_size {
    return Intl.message(
      'Image Size',
      name: 'image_size',
      desc: '',
      args: [],
    );
  }

  /// `Image Style`
  String get image_style {
    return Intl.message(
      'Image Style',
      name: 'image_style',
      desc: '',
      args: [],
    );
  }

  /// `Image Quality`
  String get image_quality {
    return Intl.message(
      'Image Quality',
      name: 'image_quality',
      desc: '',
      args: [],
    );
  }

  /// `Base Config`
  String get base_config {
    return Intl.message(
      'Base Config',
      name: 'base_config',
      desc: '',
      args: [],
    );
  }

  /// `Optional Config`
  String get optional_config {
    return Intl.message(
      'Optional Config',
      name: 'optional_config',
      desc: '',
      args: [],
    );
  }

  /// `Image Generation`
  String get image_generation {
    return Intl.message(
      'Image Generation',
      name: 'image_generation',
      desc: '',
      args: [],
    );
  }

  /// `Enter your prompts`
  String get enter_prompts {
    return Intl.message(
      'Enter your prompts',
      name: 'enter_prompts',
      desc: '',
      args: [],
    );
  }

  /// `Clone Chat`
  String get clone_chat {
    return Intl.message(
      'Clone Chat',
      name: 'clone_chat',
      desc: '',
      args: [],
    );
  }

  /// `Clear Chat`
  String get clear_chat {
    return Intl.message(
      'Clear Chat',
      name: 'clear_chat',
      desc: '',
      args: [],
    );
  }

  /// `Chat Settings`
  String get chat_settings {
    return Intl.message(
      'Chat Settings',
      name: 'chat_settings',
      desc: '',
      args: [],
    );
  }

  /// `Export Image`
  String get export_chat_as_image {
    return Intl.message(
      'Export Image',
      name: 'export_chat_as_image',
      desc: '',
      args: [],
    );
  }

  /// `Cloned Successfully`
  String get cloned_successfully {
    return Intl.message(
      'Cloned Successfully',
      name: 'cloned_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to clear the chat?`
  String get ensure_clear_chat {
    return Intl.message(
      'Are you sure to clear the chat?',
      name: 'ensure_clear_chat',
      desc: '',
      args: [],
    );
  }

  /// `Saved Successfully`
  String get saved_successfully {
    return Intl.message(
      'Saved Successfully',
      name: 'saved_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Copied Successfully`
  String get copied_successfully {
    return Intl.message(
      'Copied Successfully',
      name: 'copied_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Not implemented yet`
  String get not_implemented_yet {
    return Intl.message(
      'Not implemented yet',
      name: 'not_implemented_yet',
      desc: '',
      args: [],
    );
  }

  /// `Empty Link`
  String get empty_link {
    return Intl.message(
      'Empty Link',
      name: 'empty_link',
      desc: '',
      args: [],
    );
  }

  /// `Cannot Open`
  String get cannot_open {
    return Intl.message(
      'Cannot Open',
      name: 'cannot_open',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Max Tokens`
  String get invalid_max_tokens {
    return Intl.message(
      'Invalid Max Tokens',
      name: 'invalid_max_tokens',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Temperature`
  String get invalid_temperature {
    return Intl.message(
      'Invalid Temperature',
      name: 'invalid_temperature',
      desc: '',
      args: [],
    );
  }

  /// `Enter your message`
  String get enter_message {
    return Intl.message(
      'Enter your message',
      name: 'enter_message',
      desc: '',
      args: [],
    );
  }

  /// `Failed to comprese image`
  String get image_compress_failed {
    return Intl.message(
      'Failed to comprese image',
      name: 'image_compress_failed',
      desc: '',
      args: [],
    );
  }

  /// `Set up the TTS first`
  String get setup_tts_first {
    return Intl.message(
      'Set up the TTS first',
      name: 'setup_tts_first',
      desc: '',
      args: [],
    );
  }

  /// `Set up the API and Model first`
  String get setup_api_model_first {
    return Intl.message(
      'Set up the API and Model first',
      name: 'setup_api_model_first',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `You are up to date`
  String get up_to_date {
    return Intl.message(
      'You are up to date',
      name: 'up_to_date',
      desc: '',
      args: [],
    );
  }

  /// `Check for Updates`
  String get check_for_updates {
    return Intl.message(
      'Check for Updates',
      name: 'check_for_updates',
      desc: '',
      args: [],
    );
  }

  /// `Delete image`
  String get delete_image {
    return Intl.message(
      'Delete image',
      name: 'delete_image',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete the image?`
  String get ensure_delete_image {
    return Intl.message(
      'Are you sure to delete the image?',
      name: 'ensure_delete_image',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get task {
    return Intl.message(
      'Task',
      name: 'task',
      desc: '',
      args: [],
    );
  }

  /// `Document`
  String get document {
    return Intl.message(
      'Document',
      name: 'document',
      desc: '',
      args: [],
    );
  }

  /// `Workspace`
  String get workspace {
    return Intl.message(
      'Workspace',
      name: 'workspace',
      desc: '',
      args: [],
    );
  }

  /// `Chat Model`
  String get chat_model {
    return Intl.message(
      'Chat Model',
      name: 'chat_model',
      desc: '',
      args: [],
    );
  }

  /// `Model Name`
  String get model_name {
    return Intl.message(
      'Model Name',
      name: 'model_name',
      desc: '',
      args: [],
    );
  }

  /// `Model Avatar`
  String get model_avatar {
    return Intl.message(
      'Model Avatar',
      name: 'model_avatar',
      desc: '',
      args: [],
    );
  }

  /// `Is it a Chat Model?`
  String get chat_model_hint {
    return Intl.message(
      'Is it a Chat Model?',
      name: 'chat_model_hint',
      desc: '',
      args: [],
    );
  }

  /// `Title Generation`
  String get title_generation {
    return Intl.message(
      'Title Generation',
      name: 'title_generation',
      desc: '',
      args: [],
    );
  }

  /// `If disabled, the user's message will be used as the title`
  String get title_enable_hint {
    return Intl.message(
      'If disabled, the user\'s message will be used as the title',
      name: 'title_enable_hint',
      desc: '',
      args: [],
    );
  }

  /// `Prompt`
  String get title_prompt {
    return Intl.message(
      'Prompt',
      name: 'title_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Template for the title generation prompt`
  String get title_prompt_hint {
    return Intl.message(
      'Template for the title generation prompt',
      name: 'title_prompt_hint',
      desc: '',
      args: [],
    );
  }

  /// `In the prompt template, The {text} placeholder will be replaced with the user's message. If unsure, leave empty to use the built-in template.`
  String title_generation_hint(Object text) {
    return Intl.message(
      'In the prompt template, The $text placeholder will be replaced with the user\'s message. If unsure, leave empty to use the built-in template.',
      name: 'title_generation_hint',
      desc: '',
      args: [text],
    );
  }

  /// `Clearing...`
  String get clearing {
    return Intl.message(
      'Clearing...',
      name: 'clearing',
      desc: '',
      args: [],
    );
  }

  /// `Clear Data`
  String get clear_data {
    return Intl.message(
      'Clear Data',
      name: 'clear_data',
      desc: '',
      args: [],
    );
  }

  /// `Cleared Successfully`
  String get cleared_successfully {
    return Intl.message(
      'Cleared Successfully',
      name: 'cleared_successfully',
      desc: '',
      args: [],
    );
  }

  /// `All chat history`
  String get clear_data_chat {
    return Intl.message(
      'All chat history',
      name: 'clear_data_chat',
      desc: '',
      args: [],
    );
  }

  /// `All TTS cache files`
  String get clear_data_audio {
    return Intl.message(
      'All TTS cache files',
      name: 'clear_data_audio',
      desc: '',
      args: [],
    );
  }

  /// `All generated images`
  String get clear_data_image {
    return Intl.message(
      'All generated images',
      name: 'clear_data_image',
      desc: '',
      args: [],
    );
  }

  /// `Set up the embedding vector API and model first`
  String get setup_vector_first {
    return Intl.message(
      'Set up the embedding vector API and model first',
      name: 'setup_vector_first',
      desc: '',
      args: [],
    );
  }

  /// `Embedding Vector`
  String get search_vector {
    return Intl.message(
      'Embedding Vector',
      name: 'search_vector',
      desc: '',
      args: [],
    );
  }

  /// `Recommended to enable`
  String get search_vector_hint {
    return Intl.message(
      'Recommended to enable',
      name: 'search_vector_hint',
      desc: '',
      args: [],
    );
  }

  /// `Timeout`
  String get search_timeout {
    return Intl.message(
      'Timeout',
      name: 'search_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Retrieval timeout in milliseconds`
  String get search_timeout_hint {
    return Intl.message(
      'Retrieval timeout in milliseconds',
      name: 'search_timeout_hint',
      desc: '',
      args: [],
    );
  }

  /// `Base URL`
  String get search_searxng_base {
    return Intl.message(
      'Base URL',
      name: 'search_searxng_base',
      desc: '',
      args: [],
    );
  }

  /// `Additional Parameters`
  String get search_searxng_extra {
    return Intl.message(
      'Additional Parameters',
      name: 'search_searxng_extra',
      desc: '',
      args: [],
    );
  }

  /// `For example: engines=google&language=en`
  String get search_searxng_extra_help {
    return Intl.message(
      'For example: engines=google&language=en',
      name: 'search_searxng_extra_help',
      desc: '',
      args: [],
    );
  }

  /// `Query Timeout`
  String get search_timeout_query {
    return Intl.message(
      'Query Timeout',
      name: 'search_timeout_query',
      desc: '',
      args: [],
    );
  }

  /// `Timeout duration for SearXNG requests`
  String get search_timeout_query_help {
    return Intl.message(
      'Timeout duration for SearXNG requests',
      name: 'search_timeout_query_help',
      desc: '',
      args: [],
    );
  }

  /// `Fetch Timeout`
  String get search_timeout_fetch {
    return Intl.message(
      'Fetch Timeout',
      name: 'search_timeout_fetch',
      desc: '',
      args: [],
    );
  }

  /// `Timeout duration for fetching web page content`
  String get search_timeout_fetch_help {
    return Intl.message(
      'Timeout duration for fetching web page content',
      name: 'search_timeout_fetch_help',
      desc: '',
      args: [],
    );
  }

  /// `Embedding Vector`
  String get embedding_vector {
    return Intl.message(
      'Embedding Vector',
      name: 'embedding_vector',
      desc: '',
      args: [],
    );
  }

  /// `Batch Size`
  String get vector_batch_size {
    return Intl.message(
      'Batch Size',
      name: 'vector_batch_size',
      desc: '',
      args: [],
    );
  }

  /// `Maximum number of chunks that can be submitted in a single request`
  String get vector_batch_size_hint {
    return Intl.message(
      'Maximum number of chunks that can be submitted in a single request',
      name: 'vector_batch_size_hint',
      desc: '',
      args: [],
    );
  }

  /// `Vector Dimensions`
  String get vector_dimensions {
    return Intl.message(
      'Vector Dimensions',
      name: 'vector_dimensions',
      desc: '',
      args: [],
    );
  }

  /// `Output dimension of the embedding vector model`
  String get vector_dimensions_hint {
    return Intl.message(
      'Output dimension of the embedding vector model',
      name: 'vector_dimensions_hint',
      desc: '',
      args: [],
    );
  }

  /// `Batch size is limited by the API service provider. It's recommended to check and modify accordingly. Vector dimension is an advanced option and should only be filled if necessary.`
  String get embedding_vector_info {
    return Intl.message(
      'Batch size is limited by the API service provider. It\'s recommended to check and modify accordingly. Vector dimension is an advanced option and should only be filled if necessary.',
      name: 'embedding_vector_info',
      desc: '',
      args: [],
    );
  }

  /// `Document Config`
  String get document_config {
    return Intl.message(
      'Document Config',
      name: 'document_config',
      desc: '',
      args: [],
    );
  }

  /// `Number of Chunks`
  String get chunk_n {
    return Intl.message(
      'Number of Chunks',
      name: 'chunk_n',
      desc: '',
      args: [],
    );
  }

  /// `Number of chunks to be integrated into the context`
  String get chunk_n_hint {
    return Intl.message(
      'Number of chunks to be integrated into the context',
      name: 'chunk_n_hint',
      desc: '',
      args: [],
    );
  }

  /// `Chunk Size`
  String get chunk_size {
    return Intl.message(
      'Chunk Size',
      name: 'chunk_size',
      desc: '',
      args: [],
    );
  }

  /// `Maximum number of characters a single chunk can contain`
  String get chunk_size_hint {
    return Intl.message(
      'Maximum number of characters a single chunk can contain',
      name: 'chunk_size_hint',
      desc: '',
      args: [],
    );
  }

  /// `Chunk Overlap`
  String get chunk_overlap {
    return Intl.message(
      'Chunk Overlap',
      name: 'chunk_overlap',
      desc: '',
      args: [],
    );
  }

  /// `Size of the overlapping portion with the previous chunk`
  String get chunk_overlap_hint {
    return Intl.message(
      'Size of the overlapping portion with the previous chunk',
      name: 'chunk_overlap_hint',
      desc: '',
      args: [],
    );
  }

  /// `Documents are divided into multiple chunks. After search and comparison, the most relevant chunks will be added to the context.`
  String get document_config_hint {
    return Intl.message(
      'Documents are divided into multiple chunks. After search and comparison, the most relevant chunks will be added to the context.',
      name: 'document_config_hint',
      desc: '',
      args: [],
    );
  }

  /// `Set up the SearXNG first`
  String get setup_searxng_first {
    return Intl.message(
      'Set up the SearXNG first',
      name: 'setup_searxng_first',
      desc: '',
      args: [],
    );
  }

  /// `Google Search Mode`
  String get search_gemini_mode {
    return Intl.message(
      'Google Search Mode',
      name: 'search_gemini_mode',
      desc: '',
      args: [],
    );
  }

  /// `General Mode`
  String get search_general_mode {
    return Intl.message(
      'General Mode',
      name: 'search_general_mode',
      desc: '',
      args: [],
    );
  }

  /// `Web Search`
  String get web_search {
    return Intl.message(
      'Web Search',
      name: 'web_search',
      desc: '',
      args: [],
    );
  }

  /// `SearXNG`
  String get search_searxng {
    return Intl.message(
      'SearXNG',
      name: 'search_searxng',
      desc: '',
      args: [],
    );
  }

  /// `SearXNG instance`
  String get search_searxng_hint {
    return Intl.message(
      'SearXNG instance',
      name: 'search_searxng_hint',
      desc: '',
      args: [],
    );
  }

  /// `Number of Pages`
  String get search_n {
    return Intl.message(
      'Number of Pages',
      name: 'search_n',
      desc: '',
      args: [],
    );
  }

  /// `Maximum number of web pages to retrieve`
  String get search_n_hint {
    return Intl.message(
      'Maximum number of web pages to retrieve',
      name: 'search_n_hint',
      desc: '',
      args: [],
    );
  }

  /// `Prompt`
  String get search_prompt {
    return Intl.message(
      'Prompt',
      name: 'search_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Template for context synthesis`
  String get search_prompt_hint {
    return Intl.message(
      'Template for context synthesis',
      name: 'search_prompt_hint',
      desc: '',
      args: [],
    );
  }

  /// `In the prompt template, the {pages} placeholder will be replaced with web page content, and the {text} placeholder will be replaced with the user message. If unsure, leave it empty to use the built-in template.`
  String search_prompt_info(Object pages, Object text) {
    return Intl.message(
      'In the prompt template, the $pages placeholder will be replaced with web page content, and the $text placeholder will be replaced with the user message. If unsure, leave it empty to use the built-in template.',
      name: 'search_prompt_info',
      desc: '',
      args: [pages, text],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
