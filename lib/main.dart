import 'dart:developer';

import 'package:cypherkicks/screens/sign_in_screen.dart';
import 'package:cypherkicks/utils/init.dart';
import 'package:cypherkicks/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';

import 'components/bottom_navigation_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await Firebase.initializeApp();
  await requestPermission();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialBinding: HomeBinding(),
      themeMode: ThemeMode.system,
      home: const ReturnNavigationBar(),
      title: 'Flutter Demo',
    );
  }
}

Future<void> requestPermission() async {
  PermissionStatus status = await Permission.activityRecognition.request();

  if (status.isPermanentlyDenied) {
    Get.defaultDialog(
        title: 'Allow Permissions', onConfirm: (() => openAppSettings()));
  }
  if (status.isDenied) {
    log('not allowed');
  } else if (status.isGranted) {
    log('allowed');
  }
}
