package com.piero.app.cuy

import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.os.Build.VERSION_CODES
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val channel = "com.piero.app.cuy/info"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor, channel).setMethodCallHandler { call, result ->
            if (call.method == "getAppName") {
                val packageName = applicationContext.packageName
                val applicationInfo = packageManager.getApplicationInfo(packageName, 0)
                val appName = applicationInfo.loadLabel(packageManager).toString()
                result.success(appName)
            } else if (call.method == "getPackageID") {
                val packageName = applicationContext.packageName
                result.success(packageName)
            } else if (call.method == "getVersion") {
                val packageName = applicationContext.packageName
                val packageInfo = packageManager.getPackageInfo(packageName, 0)
                result.success(packageInfo.versionName)
            } else if (call.method == "getDeviceModel") {
                result.success(Build.MODEL)
            } else if (call.method == "getDeviceBrand") {
                result.success(Build.BRAND)
            } else if (call.method == "getOSVersion") {
                result.success(Build.VERSION.RELEASE)
            } else if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()
                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getBatteryLevel(): Int {
        return if (Build.VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intentFilter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            val intent = registerReceiver(null, intentFilter)
            intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
    }
}
