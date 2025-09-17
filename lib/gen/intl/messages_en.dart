// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(pages, text) =>
      "In the prompt template, the ${pages} placeholder will be replaced with web page content, and the ${text} placeholder will be replaced with the user message. If unsure, leave it empty to use the built-in template.";

  static String m1(text) =>
      "In the prompt template, The ${text} placeholder will be replaced with the user\'s message. If unsure, leave empty to use the built-in template.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "all_chats": MessageLookupByLibrary.simpleMessage("All Chats"),
        "api": MessageLookupByLibrary.simpleMessage("API"),
        "api_key": MessageLookupByLibrary.simpleMessage("API Key"),
        "api_type": MessageLookupByLibrary.simpleMessage("API Type"),
        "api_url": MessageLookupByLibrary.simpleMessage("API Url"),
        "apis": MessageLookupByLibrary.simpleMessage("APIs"),
        "base_config": MessageLookupByLibrary.simpleMessage("Base Config"),
        "bot": MessageLookupByLibrary.simpleMessage("Bot"),
        "bots": MessageLookupByLibrary.simpleMessage("Bots"),
        "camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cannot_open": MessageLookupByLibrary.simpleMessage("Cannot Open"),
        "chat_image_compress":
            MessageLookupByLibrary.simpleMessage("Chat Image Compress"),
        "chat_model": MessageLookupByLibrary.simpleMessage("Chat Model"),
        "chat_model_hint":
            MessageLookupByLibrary.simpleMessage("Is it a Chat Model?"),
        "chat_settings": MessageLookupByLibrary.simpleMessage("Chat Settings"),
        "chat_title": MessageLookupByLibrary.simpleMessage("Chat Title"),
        "check_for_updates":
            MessageLookupByLibrary.simpleMessage("Check for Updates"),
        "choose_api": MessageLookupByLibrary.simpleMessage("Choose API"),
        "choose_bot": MessageLookupByLibrary.simpleMessage("Choose Bot"),
        "choose_model": MessageLookupByLibrary.simpleMessage("Choose Model"),
        "chunk_n": MessageLookupByLibrary.simpleMessage("Number of Chunks"),
        "chunk_n_hint": MessageLookupByLibrary.simpleMessage(
            "Number of chunks to be integrated into the context"),
        "chunk_overlap": MessageLookupByLibrary.simpleMessage("Chunk Overlap"),
        "chunk_overlap_hint": MessageLookupByLibrary.simpleMessage(
            "Size of the overlapping portion with the previous chunk"),
        "chunk_size": MessageLookupByLibrary.simpleMessage("Chunk Size"),
        "chunk_size_hint": MessageLookupByLibrary.simpleMessage(
            "Maximum number of characters a single chunk can contain"),
        "citations": MessageLookupByLibrary.simpleMessage("Citations"),
        "clear": MessageLookupByLibrary.simpleMessage("Clear"),
        "clear_chat": MessageLookupByLibrary.simpleMessage("Clear Chat"),
        "clear_data": MessageLookupByLibrary.simpleMessage("Clear Data"),
        "clear_data_audio":
            MessageLookupByLibrary.simpleMessage("All TTS cache files"),
        "clear_data_chat":
            MessageLookupByLibrary.simpleMessage("All chat history"),
        "clear_data_image":
            MessageLookupByLibrary.simpleMessage("All generated images"),
        "cleared_successfully":
            MessageLookupByLibrary.simpleMessage("Cleared Successfully"),
        "clearing": MessageLookupByLibrary.simpleMessage("Clearing..."),
        "clone_chat": MessageLookupByLibrary.simpleMessage("Clone Chat"),
        "cloned_successfully":
            MessageLookupByLibrary.simpleMessage("Cloned Successfully"),
        "complete_all_fields":
            MessageLookupByLibrary.simpleMessage("Please complete all fields"),
        "config": MessageLookupByLibrary.simpleMessage("Config"),
        "config_hint": MessageLookupByLibrary.simpleMessage(
            "To avoid export failures, it\'s recommended to export the configuration to the Documents directory, or create a ChatBot subdirectory within your Downloads folder."),
        "config_import_export":
            MessageLookupByLibrary.simpleMessage("Config Import and Export"),
        "copied_successfully":
            MessageLookupByLibrary.simpleMessage("Copied Successfully"),
        "copy": MessageLookupByLibrary.simpleMessage("Copy"),
        "default_config":
            MessageLookupByLibrary.simpleMessage("Default Config"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "delete_image": MessageLookupByLibrary.simpleMessage("Delete image"),
        "document": MessageLookupByLibrary.simpleMessage("Document"),
        "document_config":
            MessageLookupByLibrary.simpleMessage("Document Config"),
        "document_config_hint": MessageLookupByLibrary.simpleMessage(
            "Documents are divided into multiple chunks. After search and comparison, the most relevant chunks will be added to the context."),
        "download": MessageLookupByLibrary.simpleMessage("Download"),
        "duplicate_api_name":
            MessageLookupByLibrary.simpleMessage("Duplicate API name"),
        "duplicate_bot_name":
            MessageLookupByLibrary.simpleMessage("Duplicate Bot name"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "embedding_vector":
            MessageLookupByLibrary.simpleMessage("Embedding Vector"),
        "embedding_vector_info": MessageLookupByLibrary.simpleMessage(
            "Batch size is limited by the API service provider. It\'s recommended to check and modify accordingly. Vector dimension is an advanced option and should only be filled if necessary."),
        "empty": MessageLookupByLibrary.simpleMessage("Empty"),
        "empty_link": MessageLookupByLibrary.simpleMessage("Empty Link"),
        "enable": MessageLookupByLibrary.simpleMessage("Enable"),
        "ensure_clear_chat": MessageLookupByLibrary.simpleMessage(
            "Are you sure to clear the chat?"),
        "ensure_delete_image": MessageLookupByLibrary.simpleMessage(
            "Are you sure to delete the image?"),
        "enter_a_name":
            MessageLookupByLibrary.simpleMessage("Please enter a name"),
        "enter_a_title":
            MessageLookupByLibrary.simpleMessage("Please enter a title"),
        "enter_message":
            MessageLookupByLibrary.simpleMessage("Enter your message"),
        "enter_prompts":
            MessageLookupByLibrary.simpleMessage("Enter your prompts"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "export_chat_as_image":
            MessageLookupByLibrary.simpleMessage("Export Image"),
        "export_config": MessageLookupByLibrary.simpleMessage("Export Config"),
        "exported_successfully":
            MessageLookupByLibrary.simpleMessage("Exported Successfully"),
        "exporting": MessageLookupByLibrary.simpleMessage("Exporting..."),
        "failed_to_export": MessageLookupByLibrary.simpleMessage(
            "Can\'t write to that directory."),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "generate": MessageLookupByLibrary.simpleMessage("Generate"),
        "image_compress_failed":
            MessageLookupByLibrary.simpleMessage("Failed to comprese image"),
        "image_enable_hint": MessageLookupByLibrary.simpleMessage(
            "The original image will be used if compression fails"),
        "image_generation":
            MessageLookupByLibrary.simpleMessage("Image Generation"),
        "image_hint": MessageLookupByLibrary.simpleMessage(
            "The Quality should be between 1 and 100, with lower values resulting in higher compression. Minimum Width and Minimum Height restrict image resizing. Leave these fields empty if you\'re unsure."),
        "image_quality": MessageLookupByLibrary.simpleMessage("Image Quality"),
        "image_size": MessageLookupByLibrary.simpleMessage("Image Size"),
        "image_style": MessageLookupByLibrary.simpleMessage("Image Style"),
        "images": MessageLookupByLibrary.simpleMessage("Images"),
        "import_config": MessageLookupByLibrary.simpleMessage("Import Config"),
        "imported_successfully":
            MessageLookupByLibrary.simpleMessage("Imported Successfully"),
        "importing": MessageLookupByLibrary.simpleMessage("Importing..."),
        "invalid_max_tokens":
            MessageLookupByLibrary.simpleMessage("Invalid Max Tokens"),
        "invalid_temperature":
            MessageLookupByLibrary.simpleMessage("Invalid Temperature"),
        "link": MessageLookupByLibrary.simpleMessage("Link"),
        "max_tokens": MessageLookupByLibrary.simpleMessage("Max Tokens"),
        "min_height": MessageLookupByLibrary.simpleMessage("Minimal Height"),
        "min_width": MessageLookupByLibrary.simpleMessage("Minimal Width"),
        "min_width_height":
            MessageLookupByLibrary.simpleMessage("Minimal Size"),
        "model": MessageLookupByLibrary.simpleMessage("Model"),
        "model_avatar": MessageLookupByLibrary.simpleMessage("Model Avatar"),
        "model_list": MessageLookupByLibrary.simpleMessage("Model List"),
        "model_name": MessageLookupByLibrary.simpleMessage("Model Name"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "new_api": MessageLookupByLibrary.simpleMessage("New API"),
        "new_bot": MessageLookupByLibrary.simpleMessage("New Bot"),
        "new_chat": MessageLookupByLibrary.simpleMessage("New Chat"),
        "no_model": MessageLookupByLibrary.simpleMessage("no model"),
        "not_implemented_yet":
            MessageLookupByLibrary.simpleMessage("Not implemented yet"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "open": MessageLookupByLibrary.simpleMessage("Open"),
        "optional_config":
            MessageLookupByLibrary.simpleMessage("Optional Config"),
        "other": MessageLookupByLibrary.simpleMessage("Other"),
        "play": MessageLookupByLibrary.simpleMessage("Play"),
        "please_input": MessageLookupByLibrary.simpleMessage("Please Input"),
        "quality": MessageLookupByLibrary.simpleMessage("Quality"),
        "reanswer": MessageLookupByLibrary.simpleMessage("Reanswer"),
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "restart_app": MessageLookupByLibrary.simpleMessage(
            "Please restart App to load the new settings."),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "saved_successfully":
            MessageLookupByLibrary.simpleMessage("Saved Successfully"),
        "search_gemini_mode":
            MessageLookupByLibrary.simpleMessage("Google Search Mode"),
        "search_general_mode":
            MessageLookupByLibrary.simpleMessage("General Mode"),
        "search_n": MessageLookupByLibrary.simpleMessage("Number of Pages"),
        "search_n_hint": MessageLookupByLibrary.simpleMessage(
            "Maximum number of web pages to retrieve"),
        "search_prompt": MessageLookupByLibrary.simpleMessage("Prompt"),
        "search_prompt_hint": MessageLookupByLibrary.simpleMessage(
            "Template for context synthesis"),
        "search_prompt_info": m0,
        "search_searxng": MessageLookupByLibrary.simpleMessage("SearXNG"),
        "search_searxng_base": MessageLookupByLibrary.simpleMessage("Base URL"),
        "search_searxng_extra":
            MessageLookupByLibrary.simpleMessage("Additional Parameters"),
        "search_searxng_extra_help": MessageLookupByLibrary.simpleMessage(
            "For example: engines=google&language=en"),
        "search_searxng_hint":
            MessageLookupByLibrary.simpleMessage("SearXNG instance"),
        "search_timeout": MessageLookupByLibrary.simpleMessage("Timeout"),
        "search_timeout_fetch":
            MessageLookupByLibrary.simpleMessage("Fetch Timeout"),
        "search_timeout_fetch_help": MessageLookupByLibrary.simpleMessage(
            "Timeout duration for fetching web page content"),
        "search_timeout_hint": MessageLookupByLibrary.simpleMessage(
            "Retrieval timeout in milliseconds"),
        "search_timeout_query":
            MessageLookupByLibrary.simpleMessage("Query Timeout"),
        "search_timeout_query_help": MessageLookupByLibrary.simpleMessage(
            "Timeout duration for SearXNG requests"),
        "search_vector":
            MessageLookupByLibrary.simpleMessage("Embedding Vector"),
        "search_vector_hint":
            MessageLookupByLibrary.simpleMessage("Recommended to enable"),
        "select_models": MessageLookupByLibrary.simpleMessage("Select Models"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "setup_api_model_first": MessageLookupByLibrary.simpleMessage(
            "Set up the API and Model first"),
        "setup_searxng_first":
            MessageLookupByLibrary.simpleMessage("Set up the SearXNG first"),
        "setup_tts_first":
            MessageLookupByLibrary.simpleMessage("Set up the TTS first"),
        "setup_vector_first": MessageLookupByLibrary.simpleMessage(
            "Set up the embedding vector API and model first"),
        "share": MessageLookupByLibrary.simpleMessage("Share"),
        "source": MessageLookupByLibrary.simpleMessage("Source"),
        "streaming_response":
            MessageLookupByLibrary.simpleMessage("Streaming Response"),
        "system_prompts":
            MessageLookupByLibrary.simpleMessage("System Prompts"),
        "task": MessageLookupByLibrary.simpleMessage("Task"),
        "temperature": MessageLookupByLibrary.simpleMessage("Temperature"),
        "text_to_speech":
            MessageLookupByLibrary.simpleMessage("Text To Speech"),
        "title": MessageLookupByLibrary.simpleMessage("ChatBot"),
        "title_enable_hint": MessageLookupByLibrary.simpleMessage(
            "If disabled, the user\'s message will be used as the title"),
        "title_generation":
            MessageLookupByLibrary.simpleMessage("Title Generation"),
        "title_generation_hint": m1,
        "title_prompt": MessageLookupByLibrary.simpleMessage("Prompt"),
        "title_prompt_hint": MessageLookupByLibrary.simpleMessage(
            "Template for the title generation prompt"),
        "up_to_date":
            MessageLookupByLibrary.simpleMessage("You are up to date"),
        "vector_batch_size": MessageLookupByLibrary.simpleMessage("Batch Size"),
        "vector_batch_size_hint": MessageLookupByLibrary.simpleMessage(
            "Maximum number of chunks that can be submitted in a single request"),
        "vector_dimensions":
            MessageLookupByLibrary.simpleMessage("Vector Dimensions"),
        "vector_dimensions_hint": MessageLookupByLibrary.simpleMessage(
            "Output dimension of the embedding vector model"),
        "voice": MessageLookupByLibrary.simpleMessage("Voice"),
        "web_search": MessageLookupByLibrary.simpleMessage("Web Search"),
        "workspace": MessageLookupByLibrary.simpleMessage("Workspace")
      };
}
