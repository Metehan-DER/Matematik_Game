import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matematik/LessonsPage.dart';
import 'package:matematik/NewGamePage.dart';
import 'package:matematik/Renkler&Temalar.dart';
import 'package:matematik/SettingsPage.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: Image.asset('assets/logo.png'), // Burada yeni logoyu ekliyoruz
        centerTitle: true,
        title: Text(
          "MATEMATİK",
          style: TextStyle(color: AppColors.textColor),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // İlk Column'ı merkezde hizala
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => newGamePage()), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                    );
                  },
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.2,
                    color: AppColors.boxColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.textColor, // Çerçeve rengi
                              width: 1.0, // Çerçeve kalınlığı
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                                8.0), // İkonun içindeki boşluk
                            child: Icon(
                              CupertinoIcons.power,
                              color: AppColors.textColor,
                              size: size.width * 0.15,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "New Game",
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ), // New Game Butonu
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => settingsPage()), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                    );
                  },
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.2,
                    color: AppColors.boxColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.textColor, // Çerçeve rengi
                              width: 1.0, // Çerçeve kalınlığı
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                                8.0), // İkonun içindeki boşluk
                            child: Icon(
                              CupertinoIcons.settings,
                              color: AppColors.textColor,
                              size: size.width * 0.15,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ), // Random Game Butonu
              ],
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // İkinci Column'ı merkezde hizala
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => lessonsPage()), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                    );
                  },
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.42,
                    color: AppColors.boxColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.textColor, // Çerçeve rengi
                              width: 1.0, // Çerçeve kalınlığı
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                                8.0), // İkonun içindeki boşluk
                            child: Icon(
                              CupertinoIcons.pencil,
                              color: AppColors.textColor,
                              size: size.width * 0.15,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "L\n E\n  A\n   R\n    N",
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ), // Learn Butonu
              ],
            ),
          ],
        ),
      ),
    );
  }
}
