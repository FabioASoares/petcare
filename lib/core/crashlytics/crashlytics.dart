import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

abstract class Crashlytics {
  static final ValueNotifier<String> _log = ValueNotifier<String>('');

  static void addLog(String log) {
    String newLog = '${DateTime.now().toIso8601String()} - $log';
    if (_log.value.isNotEmpty) {
      newLog += '\n\n\n\n${_log.value}';
    }
    _log.value = newLog;
  }

  static Future<void> _writeLog() async {
    final directory = await getDownloadsDirectory();
    if (directory == null) {
      return;
    }
    final File file = File('${directory.path}/my_file.txt');
    await file.create();
    await file.writeAsString(_log.value);
  }

  static Future<void> iniciarLogs() async {
    _writeLog();
    _log.addListener(() {
      _writeLog();
    });
  }
}
