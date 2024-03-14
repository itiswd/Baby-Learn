import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:learn_baby/pages/first_start.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences namePrefs;
late SharedPreferences numPrefs;
late SharedPreferences resultPrefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  namePrefs = await SharedPreferences.getInstance();
  numPrefs = await SharedPreferences.getInstance();
  resultPrefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return GetMaterialApp(
      textDirection: TextDirection.rtl,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Tunisia',
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      home: const FirstStart(),
    );
  }
}
