package com.example.flutter_toast_plugin;

import android.content.Context;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterToastPlugin */
public class FlutterToastPlugin implements MethodCallHandler {

  //为了调用 android 中的功能，则需要 context
  private final Context mContext;
  public FlutterToastPlugin(Context context) {
    mContext = context;
  }


  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    //为了防止 channel 名字冲突，在名字前面加上 example.com
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "example.com/flutter_toast_plugin");
    // context 可以从 Registrar 拿到
    channel.setMethodCallHandler(new FlutterToastPlugin(registrar.context()));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {

    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("ShowToast")) {
      // 调用本地代码的时候，只能传递一个参数。为了传递多个，可以把参数放在一个 map 里面。
      // call.arguemnt() 方法支持 Map 和 JSONObject
      String content = call.argument("content");
      String duration = call.argument("duration");
      Toast.makeText(mContext, content, "short".equals(duration) ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG).show();
      // 执行成功
      result.success(true);
    } else {
      result.notImplemented();
    }







  }
}
