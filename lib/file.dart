import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileHelper{
  FileHelper._();
  static final fileHelper=  FileHelper._();

  write(String name,String text) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    String path=directory.path+"/$name.text";
    final File file = File(path);
    await file.writeAsString(text);
  }

  Future<String> read(name) async {
    String text;
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      String path=directory.path+"/$name.text";
      final File file = File(path);
      text = await file.readAsString();
    } catch (e) {
      print("Couldn't read file");
    }
    return text;
  }
}