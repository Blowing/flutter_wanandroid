
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/models/models.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {

  SplashModel _splashModel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    _loadSplashData();

  }

  void _loadSplashData() {
//    _splashModel = SpUtil.get
  }
}