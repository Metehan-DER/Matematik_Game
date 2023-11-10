import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matematik/FirstLoginPage.dart';
import 'package:matematik/HomePage.dart';
import 'package:matematik/SettingsPage.dart';
import 'package:matematik/splashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '4 State',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: splashScreen(),
    );
  }
}
