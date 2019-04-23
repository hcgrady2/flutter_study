package com.example.flutter_demo;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;


public class MainActivity extends FlutterActivity {

  private static final String CHANNEL = "nativecall.flutter.io/battery";     //确保和插件调用时，名称相同
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);


    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                // TODO
                if (call.method.equals("getBatteryLevel")) {
                  int batteryLevel = getBatteryLevel();
               //   naviveCallFlutter();
                  Log.i("NativeCallDemo", "onMethodCall: ");
                  if (batteryLevel != -1) {
                    result.success(batteryLevel);
                  } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null);
                  }
                } else {
                  result.notImplemented();
                }
              }
            });

    //EventChanelTest
    new EventChannel(getFlutterView(), "samples.flutter.io/charging").setStreamHandler(
            new EventChannel.StreamHandler() {
              // 接收电池广播的BroadcastReceiver。
              private BroadcastReceiver chargingStateChangeReceiver;
              @Override
              // 这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
              public void onListen(Object arguments, EventChannel.EventSink events) {
                chargingStateChangeReceiver = createChargingStateChangeReceiver(events);
                registerReceiver(chargingStateChangeReceiver, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
              }

              @Override
              public void onCancel(Object arguments) {
                // 对面不再接收
                unregisterReceiver(chargingStateChangeReceiver);
                chargingStateChangeReceiver = null;
              }
            }
    );



  }

  private BroadcastReceiver createChargingStateChangeReceiver(final EventChannel.EventSink events) {
    return new BroadcastReceiver() {
      @Override
      public void onReceive(Context context, Intent intent) {
        int status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1);
        if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
          events.error("UNAVAILABLE", "Charging status unavailable", null);
        } else {
          boolean isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                  status == BatteryManager.BATTERY_STATUS_FULL;
          // 把电池状态发给Flutter
          events.success(isCharging ? "charging " : "discharging");
        }
      }
    };
  }




  private void naviveCallFlutter(){
    new MethodChannel(getFlutterView(), CHANNEL).invokeMethod("getName", null, new MethodChannel.Result() {
      @Override
      public void success(Object o) {
        // 这里就会输出 "Hello from Flutter"，注意判空
        Log.i("NativeCallDemo", "success: " + o.toString());


      }
      @Override
      public void error(String s, String s1, Object o) {
        Log.i("NativeCallDemo", "error: " + s + "," + s1 + ",," );
      }
      @Override
      public void notImplemented() {
        Log.i("NativeCallDemo", "notImplemented: ");
      }
    });

  }



  //调用的原生方法
  private int getBatteryLevel() {
    int batteryLevel = -1;
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    } else {
      Intent intent = new ContextWrapper(getApplicationContext()).
              registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
      batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
              intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
    }

    return batteryLevel;
  }


}
