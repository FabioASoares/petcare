import 'dart:convert';
import 'dart:io';

import 'package:exif/exif.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class ImageFile {
  final File file;
  final String name;
  final double latitude;
  final double longitude;
  bool favorite;

  ImageFile({
    required this.file,
    required this.name,
    required this.latitude,
    required this.longitude,
    this.favorite = false,
  });
}

abstract class ImageHelper {
  static File base64ToImageFile(String base64String) {
    Uint8List bytes = base64.decode(base64String);
    String tempPath = Directory.systemTemp.path;
    String fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    File file = File('$tempPath/$fileName');
    file.writeAsBytesSync(bytes);
    return file;
  }

  static Future<ImageFile?> abrirGaleriaComLocalizacao() async {
    return await _obterImagemComLocalizacao(ImageSource.gallery);
  }

  static Future<ImageFile?> abrirCameraComLocalizacao() async {
    return await _obterImagemComLocalizacao(ImageSource.camera);
  }

  static Future<ImageFile?> _obterImagemComLocalizacao(
      ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    XFile? picked = await picker.pickImage(
      source: source,
      imageQuality: 100,
      maxHeight: 720,
      maxWidth: 1280,
    );

    if (picked == null) return null;

    File? imageFile = File(picked.path);
    imageFile = await _getFileIsAccept(imageFile);
    if (imageFile == null) return null;

    final localizacao = await _extrairLocalizacaoOuAtual(imageFile);

    return ImageFile(
      file: imageFile,
      name: imageFile.path.split('/').last,
      latitude: localizacao.latitude,
      longitude: localizacao.longitude,
    );
  }

  static Future<LatLng> _extrairLocalizacaoOuAtual(File image) async {
    try {
      final bytes = await image.readAsBytes();
      final tags = await readExifFromBytes(bytes);

      if (tags.containsKey('GPS GPSLatitude') &&
          tags.containsKey('GPS GPSLongitude')) {
        final latRef = tags['GPS GPSLatitudeRef']?.printable ?? 'N';
        final lonRef = tags['GPS GPSLongitudeRef']?.printable ?? 'E';

        final latRaw = tags['GPS GPSLatitude']!.values.toList();
        final lonRaw = tags['GPS GPSLongitude']!.values.toList();

        final latValues = [
          latRaw[0].toDouble(),
          latRaw[1].toDouble(),
          latRaw[2].toDouble(),
        ];

        final lonValues = [
          lonRaw[0].toDouble(),
          lonRaw[1].toDouble(),
          lonRaw[2].toDouble(),
        ];

        double lat = _converterParaGraus(latValues);
        double lon = _converterParaGraus(lonValues);

        if (latRef.trim() == 'S') lat = -lat;
        if (lonRef.trim() == 'W') lon = -lon;

        return LatLng(lat, lon);
      }
    } catch (_) {}

    // Fallback: pegar localização atual
    final posicao = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return LatLng(posicao.latitude, posicao.longitude);
  }

  static double _converterParaGraus(List<dynamic> dms) {
    return dms[0].toDouble() +
        (dms[1].toDouble() / 60.0) +
        (dms[2].toDouble() / 3600.0);
  }

  static Future<File?> _getFileIsAccept(File image) async {
    for (var i = 0; i < 2; i++) {
      bool isAccepted = _getSizeIsAccepted(image);
      if (isAccepted) return image;
      image = await _getImageResized(image);
    }
    return null;
  }

  static Future<File> _getImageResized(File image) async {
    final result = await FlutterImageCompress.compressWithList(
      image.readAsBytesSync(),
      rotate: 270,
      format: CompressFormat.webp,
    );
    final file = File(image.path)..writeAsBytesSync(result);
    return file;
  }

  static bool _getSizeIsAccepted(File image) {
    final size = _getFileSize(image, 2);
    return size <= 20;
  }

  static double _getFileSize(File file, int decimals) {
    final int bytes = file.lengthSync();
    final double mb = (bytes / (1024 * 1024));
    return double.parse(mb.toStringAsFixed(decimals));
  }
}

class LatLng {
  final double latitude;
  final double longitude;

  LatLng(this.latitude, this.longitude);
}
