
import 'package:base_library/base_library.dart';
import 'package:flukit/flukit.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/common.dart';
import 'package:flutter_wanandroid/models/models.dart';
import 'package:flutter_wanandroid/utils/http_utils.dart';
import 'package:flutter_wanandroid/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  TimerUtil _timerUtil;
  List<String> _guideList = [
    Utils.getImgPath('guide1'),
    Utils.getImgPath('guide2'),
    Utils.getImgPath('guide3'),
    Utils.getImgPath('guide4'),
  ];
  SplashModel _splashModel;

  List<Widget> _bannerList = new List();
  int _status = 0;

  int _count = 3;

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: !(_status == 0),
            child: _buildSplashBg(),
          ),
          new Offstage(
            offstage: !(_status == 2),
            child: ObjectUtil.isEmpty(_bannerList)
            ? new Container()
                :new Swiper(
              autoStart: false,
              circular: false,
              indicator: CircleSwiperIndicator(
                radius: 4.0,
                padding: EdgeInsets.only(bottom: 30.0),
                itemColor: Colors.black26,
              ),
              children: _bannerList,) ,
          ),
          _buildAdWidget(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    _loadSplashData();

    Observable.just(1).delay(new Duration(milliseconds: 500)).listen((event) {
      if (SpUtil.getBool(Constant.key_guide, defValue: true) && ObjectUtil
          .isNotEmpty(_guideList)) {
          SpUtil.putBool(Constant.key_guide, false);
          _initBanner();
      } else {
        _initSplash();
      }
    });
  }

  void _loadSplashData() {
    _splashModel = SpUtil.getObj(Constant.key_splash_model, (v) => SplashModel.fromJson(v));
    if (_splashModel != null) {
      setState(() {});
    }

    HttpUtils httpUtil = new HttpUtils();
    httpUtil.getSplash().then((model) {
      if (!ObjectUtil.isEmpty(model.imgUrl)) {
        SpUtil.putObject(Constant.key_splash_model, model);
        setState(() {
          _splashModel = model;
        });
      } else {
        SpUtil.putObject(Constant.key_splash_model, null);
      }
    });

  }

  void _initBanner() {
    _initBannerData();
    setState(() {
      _status = 2;
    });
  }

  void _initBannerData() {
    for (int i = 0, length = _guideList.length; i < length; i++) {
      if (i == length -1) {
        _bannerList.add(new Stack(
          children: <Widget>[
            new Image.asset(
                _guideList[i],
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                margin: EdgeInsets.only(bottom: 160.0),
                child: new InkWell(
                  onTap: () {
                    _goMain();
                  },
                  child: new CircleAvatar(
                    radius: 48.0,
                    backgroundColor: Colors.indigoAccent,
                    child: new Padding(
                      padding: EdgeInsets.all(2.0),
                      child: new Text(
                        '立即体验',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
      } else {
        _bannerList.add(new Image.asset(_guideList[i],
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
        ));
      }
    }
  }

  void _initSplash() {
    if (_splashModel == null) {
      _goMain();
    } else {
      _doCountDown();
    }
  }

  void _goMain() {
    RouteUtil.goMain(context);
  }
  void _doCountDown() {
      setState(() {
        _status = 1;
      });

      _timerUtil = new TimerUtil(mTotalTime: 3* 1000);
      _timerUtil.setOnTimerTickCallback((int tick) {
        double _tick = tick / 1000;
        setState(() {
          _count = _tick.toInt();
        });
        if (_tick == 0) {
          _goMain();
        }
      });
      _timerUtil.startCountDown();
  }

  Widget _buildSplashBg() {
    return new Image.asset(
      Utils.getImgPath('splash_bg'),
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

 Widget _buildAdWidget() {
    if (_splashModel == null) {
      return new Container(
        height: 0.0,
      );
    }
    return new Offstage(
      offstage: !(_status == 1),
      child: new InkWell(
        onTap: () {
          if (ObjectUtil.isEmpty(_splashModel.url))
            return;
          _goMain();
//          NavigationUtil.put
        },
      ),
    );
 }
}