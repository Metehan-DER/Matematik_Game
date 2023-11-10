import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matematik/FirstLoginPage.dart';
import 'package:matematik/HomePage.dart';
import 'package:matematik/Renkler&Temalar.dart';
import 'package:matematik/SettingsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstLogin();
  }

  void _checkFirstLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLogin = prefs.getBool('firstLogin') ?? true;

    if (isFirstLogin) {
      // İlk girişse, kullanıcıyı ad-soyad girişi yapması için yönlendirin.
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => firstLoginPage(),
          ),
        );
      });
    } else {
      // İlk giriş değilse, ana sayfaya yönlendirin.
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => homePage(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: size.width * 0.5,
          ),
          Container(
            alignment: Alignment.center,
            height: size.width * 0.6,
            width: size.width * 0.6,
            child: Image.asset("assets/logo.png"),
          ),
          SizedBox(height: size.width * 0.1),
          CircularProgressIndicator(
            color: AppColors.secondaryColor,
            strokeWidth: 7,
            backgroundColor: AppColors.primaryColor,
          ),
          SizedBox(height: size.width * 0.1),
          Text(
            "HOŞGELDİNİZ...",
            style: GoogleFonts.nabla(
              textStyle: TextStyle(
                fontSize: size.width * 0.06,
                color: AppColors.secondaryColor,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
