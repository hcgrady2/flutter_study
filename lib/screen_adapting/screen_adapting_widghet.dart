import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_demo/international/translations_delegate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ScreenAdaptingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);

    Widget redBox=DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
    
    return Scaffold(
        appBar: AppBar(
          title: Text(Translations.of(context).text('ScreenAdapting')),
          //使用Locale title
          //   title: Text(DemoLocalizations.of(context).title),
        ),
        body:
        new Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(540),
                    height: ScreenUtil().setHeight(200),
                    color: Colors.red,
                    child: Text(
                      '我的宽度:${ScreenUtil().setWidth(540)}dp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(12),
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(540),
                    height: ScreenUtil().setHeight(200),
                    color: Colors.blue,
                    child: Text('我的宽度:${ScreenUtil().setWidth(540)}dp',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(12),
                        )),
                  ),
                ],
              ),
              Text('设备宽度:${ScreenUtil.screenWidth}px'),
              Text('设备高度:${ScreenUtil.screenHeight}px'),
              Text('设备的像素密度:${ScreenUtil.pixelRatio}'),
              Text('底部安全区距离:${ScreenUtil.bottomBarHeight}px'),
              Text('状态栏高度:${ScreenUtil.statusBarHeight}px'),
              Text(
                '实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}',
                textAlign: TextAlign.center,
              ),
              Text(
                '实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}',
                textAlign: TextAlign.center,
              ),
              Text(
                '宽度和字体相对于设计稿放大的比例:${ScreenUtil().scaleWidth * ScreenUtil.pixelRatio}',
                textAlign: TextAlign.center,
              ),
              Text(
                '高度相对于设计稿放大的比例:${ScreenUtil().scaleHeight * ScreenUtil.pixelRatio}',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(100),
              ),
              Text('系统的字体缩放比例:${ScreenUtil.textScaleFactory}'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('我的文字大小在设计稿上是14px，不会随着系统的文字缩放比例变化',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(14))),
                  Text('我的文字大小在设计稿上是14px，会随着系统的文字缩放比例变化',
                      style: TextStyle(
                          color: Colors.black, fontSize: ScreenUtil().setSp(14))),
                ],
              )
            ],
          ),
        ),


    );

  }
}


