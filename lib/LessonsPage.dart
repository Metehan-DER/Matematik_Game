import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matematik/Lessons/BolmeKonuAnlatimi.dart';
import 'package:matematik/Lessons/CarpmaKonuAnlatimiPage.dart';
import 'package:matematik/Lessons/CikarmaKonuAnlatimiPage.dart';
import 'package:matematik/Renkler&Temalar.dart';
import 'package:matematik/Lessons/ToplamaKonuAnlat%C4%B1m%C4%B1Page.dart';

import 'SettingsPage.dart';

class lessonsPage extends StatelessWidget {
  const lessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: AppColors.textColor,
            )),
        centerTitle: true,
        title: Text(
          "DERSLER",
          style: TextStyle(color: AppColors.textColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => settingsPage()), // SecondPage burada yönlendirilecek sayfanın adı olmalı
              );
            },
            icon: Icon(
              Icons.settings,
              color: AppColors.textColor,
            ),
          )
        ],
        backgroundColor: AppColors.backgroundColor,
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
                      MaterialPageRoute(builder: (context) => toplamaPage()), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                    );
                  },
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.3,
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
                              CupertinoIcons.add,
                              color: AppColors.textColor,
                              size: size.width * 0.15,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "TOPLAMA",
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
                      MaterialPageRoute(builder: (context) => carpmaPage()), // SecondPage burada yönlendirilecek sayfanın adı olmalı
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
                              CupertinoIcons.xmark,
                              color: AppColors.textColor,
                              size: size.width * 0.15,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "ÇARPMA",
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
                  MainAxisAlignment.center, // İlk Column'ı merkezde hizala
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => cikarmaPage()), // SecondPage burada yönlendirilecek sayfanın adı olmalı
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
                              CupertinoIcons.minus,
                              color: AppColors.textColor,
                              size: size.width * 0.15,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Çıkarma",
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
                      MaterialPageRoute(builder: (context) => bolmePage()), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                    );
                  },
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.3,
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
                              CupertinoIcons.divide,
                              color: AppColors.textColor,
                              size: size.width * 0.15,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "BÖLME",
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
          ],
        ),
      ),
    );
  }
}
