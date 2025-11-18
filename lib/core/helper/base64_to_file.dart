import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

extension Base64ToFile on File {
  Future<File?> base64ToTempFile(String base64String, String fileName) async {
    try {
      base64String = base64String
          .replaceAll('\n', '')
          .replaceAll('\r', '')
          .replaceAll(' ', '')
          .trim();

      final bytes = base64Decode(base64String);

      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/$fileName.png');

      await file.writeAsBytes(bytes);
      return file;
    } catch (e) {
      return null;
    }
  }
}
