import 'package:base_library/base_library.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/Global.dart';
import 'res/strings.dart';
import 'ui/main_page.dart';
import 'ui/splash_page.dart';


void main() {
  Global.init(() {
    runApp(MyApp());
  });

}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }


}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        BaseConstant.routeMain: (ctx) => MainPage(),
      },
      home: new SplashPage(),
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF666666),
        accentColor: Color(0xFF666666),
        indicatorColor: Colors.white,
      ),
      locale: Locale("zh", "CN"),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        CustomLocalizations.delegate
      ],
      supportedLocales: CustomLocalizations.supportedLocales,
    );
  }

  @override
  void initState() {
    super.initState();
    setLocalizedValues(localizedValues);
  }




}
