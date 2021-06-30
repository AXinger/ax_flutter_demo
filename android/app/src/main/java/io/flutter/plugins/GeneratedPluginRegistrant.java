package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
    flutterEngine.getPlugins().add(new com.ax.ax_flutter_plugin.AxFlutterPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.camera.CameraPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.deviceinfo.DeviceInfoPlugin());
    flutterEngine.getPlugins().add(new com.example.flutterimagecompress.FlutterImageCompressPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin());
    flutterEngine.getPlugins().add(new io.github.ponnamkarthik.toast.fluttertoast.FlutterToastPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.imagepicker.ImagePickerPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.localauth.LocalAuthPlugin());
      com.github.leisim.logger_flutter.LoggerFlutterPlugin.registerWith(shimPluginRegistry.registrarFor("com.github.leisim.logger_flutter.LoggerFlutterPlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.packageinfo.PackageInfoPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.pathprovider.PathProviderPlugin());
    flutterEngine.getPlugins().add(new com.baseflow.permissionhandler.PermissionHandlerPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin());
    flutterEngine.getPlugins().add(new com.tekartik.sqflite.SqflitePlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.urllauncher.UrlLauncherPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.webviewflutter.WebViewFlutterPlugin());
  }
}
