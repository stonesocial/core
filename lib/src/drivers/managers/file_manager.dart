import 'dart:convert';
import 'dart:io';

import 'package:dependencies/dependencies.dart';

class FileManager {
  final String? extension;

  FileManager({this.extension = '.json'});

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> setPath() async {
    final path = await _localPath;

    return File('$path/data$extension');
  }

  Future<String> read() async {
    try {
      final file = await setPath();

      return await file.readAsString();
    } catch (e) {
      return Strings.empty;
    }
  }

  Future<File> write({String? data, Map<String, dynamic>? map}) async {
    final file = await setPath();
    final contents = data ?? jsonEncode(map!);

    return file.writeAsString(contents);
  }
}