import 'dart:convert';
import 'dart:io' as io;
import 'dart:typed_data';

extension StringExtensions on String {
  String get castImageToBase64 {
    List<int> imageBytes = io.File(this).readAsBytesSync();

    return base64Encode(imageBytes);
  }

  Uint8List get imageFromBase64String => base64Decode(this);
}

extension NullabeStringExtensions on String? {
  bool get nullOrEmpty => this == "" || this == null;
}
