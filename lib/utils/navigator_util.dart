
import 'package:base_library/base_library.dart';
import 'package:flutter/cupertino.dart';

class NavigatorUtil {
  static void pushPage(
      BuildContext context,
      Widget page, {
        String pageName,
        bool needLogin = false,
      })  {
//    if (context == null || page = null) {
//      return;
//    }
    if (needLogin && Util.isLogin()) {
//      pushPage(context, UserLoginPage());
    return;
    }
    Navigator.push(context, new CupertinoPageRoute(builder: (ctx) => page));

  }

  static void pushWeb(BuildContext context, {
    String title, String titleId, String url, bool isHome: false}) {
    if (context == null || ObjectUtil.isEmpty(url)) return;

//    if (url.endsWith(".apk")) {
//      launchInBrowser()
//    } else {
//      Navigator.push(
//          context,
//          new CupertinoPageRoute<void>(builder: (ctx) =>
//          new WebScaffold(
//            title: title,
//            titleId: titleId,
//            url: url,
//          )));
//    }
  }

  static Future<Null> launchInBrowser(String url, {String title}) async {
//    if (await canLaunch(url)) {
//      await launch(url, forceSafariVC: false, forceWebView: false);
//    } else {
//      throw 'Could not launch $url';
//    }
  }


}