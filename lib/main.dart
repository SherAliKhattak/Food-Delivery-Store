import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/screens/splash/splash_screen.dart';
import 'package:store_app/utils/init.dart';
import 'package:store_app/utils/language.dart';
import 'package:store_app/utils/light_them.dart';

import 'data/services/local_db.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   Preferences().getThemeStatus();
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
    return  GetMaterialApp(
      translations: Localization(),
      theme: light,
      darkTheme: dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      home: const SplashScreen(),
      initialBinding: AppBindings(),
    );
  }
}
