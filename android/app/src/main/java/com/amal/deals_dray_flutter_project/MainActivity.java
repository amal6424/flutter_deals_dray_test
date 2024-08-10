package com.amal.deals_dray_flutter_project;

import android.annotation.SuppressLint;
import android.provider.Settings;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANEL_DEVICE_ID = "com.amal.deals_dray_flutter_project/deviceId";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANEL_DEVICE_ID).setMethodCallHandler((call, result)->{
            if(call.method.equals("getDeviceId")){
                @SuppressLint("HardwareIds") String deviceId = Settings.Secure.getString(getContext().getContentResolver(), Settings.Secure.ANDROID_ID);
                result.success(deviceId);
            }
        });
    }
}
