
import 'dart:io';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Global {
  static Future init(VoidCallback callback) async {
    WidgetsFlutterBinding.ensureInitialized();
    await SpUtil.getInstance();
    callback();
    if (Platform.isAndroid) {
      SystemUiOverlayStyle  systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}