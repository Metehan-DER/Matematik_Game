import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matematik/GamePage.dart';
import 'package:matematik/Renkler&Temalar.dart';
import 'package:matematik/SettingsPage.dart';

class newGamePage extends StatefulWidget {
  const newGamePage({super.key});

  @override
  State<newGamePage> createState() => _newGamePageState();
}

class _newGamePageState extends State<newGamePage> {
  bool isContent1 = true; // Varsayılan içerik, true durumunu temsil eder.
  bool isContent2 = true;
  bool isContent3 = true;
  bool isContent4 = true;

  void resetContent() {
    setState(() {
      isContent1 = true;
      isContent2 = true;
      isContent3 = true;
      isContent4 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Container kutu() {
      return Container(
        height: 2,
        width: size.width * 0.5,
        color: Colors.black,
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                (Route<dynamic> route) => false; // Geçmişi temizler
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                color: AppColors.textColor,
              )),
          centerTitle: true,
          title: Text(
            "New Game",
            style: TextStyle(color: AppColors.textColor),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          settingsPage()), // SecondPage burada yönlendirilecek sayfanın adı olmalı
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
                      resetContent();
                      setState(() {
                        isContent1 = !isContent1;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: isContent1 ? size.width * 0.4 : size.width * 0.5,
                      height:
                          isContent1 ? size.height * 0.2 : size.height * 0.3,
                      color:
                          isContent1 ? AppColors.boxColor : AppColors.textColor,
                      child: isContent1
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.textColor,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ListTile(
                                  title: Text(
                                    'KOLAY',
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage(
                                              operation: "+",
                                              level: "Kolay",
                                              x1: 100,
                                              x2: 100)), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                                    );
                                  },
                                ),
                                kutu(),
                                ListTile(
                                  title: Text(
                                    'NORMAL',
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage(
                                              operation: "+",
                                              level: "Orta",
                                              x1: 1000,
                                              x2: 1000)), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                                    );
                                    // Orta seviye işlemleri burada yapabilirsiniz.
                                  },
                                ),
                                kutu(),
                                ListTile(
                                  title: Text(
                                    'ZOR',
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage(
                                              operation: "+",
                                              level: "Zor",
                                              x1: 10000,
                                              x2: 10000)), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                                    );
                                    // İleri seviye işlemleri burada yapabilirsiniz.
                                  },
                                ),
                              ],
                            ),
                    ),
                  ), // New Game Butonu
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      resetContent();
                      setState(() {
                        isContent2 = !isContent2;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: isContent2 ? size.width * 0.4 : size.width * 0.45,
                      height:
                          isContent2 ? size.height * 0.3 : size.height * 0.35,
                      color:
                          isContent2 ? AppColors.boxColor : AppColors.textColor,
                      child: isContent2
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.textColor,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ListTile(
                                  title: Text(
                                    'KOLAY',
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage(
                                              operation: "*",
                                              level: "Kolay",
                                              x1: 10,
                                              x2: 10)), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                                    );
                                  },
                                ),
                                kutu(),
                                ListTile(
                                  title: Text(
                                    'NORMAL',
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage(
                                              operation: "*",
                                              level: "Orta",
                                              x1: 100,
                                              x2: 100)), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                                    );
                                    // Orta seviye işlemleri burada yapabilirsiniz.
                                  },
                                ),
                                kutu(),
                                ListTile(
                                  title: Text(
                                    'ZOR',
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage(
                                              operation: "*",
                                              level: "Zor",
                                              x1: 100,
                                              x2: 1000)), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                                    );
                                    // İleri seviye işlemleri burada yapabilirsiniz.
                                  },
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
                      resetContent();
                      setState(() {
                        isContent3 = !isContent3;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: isContent3 ? size.width * 0.4 : size.width * 0.45,
                      height:
                          isContent3 ? size.height * 0.3 : size.height * 0.35,
                      color:
                          isContent3 ? AppColors.boxColor : AppColors.textColor,
                      child: isContent3
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.textColor,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ListTile(
                                  title: Text(
                                    'KOLAY',
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage(
                                              operation: "-",
                                              level: "Kolay",
                                              x1: 100,
                                              x2: 99)), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                                    );
                                    // Basit seviye işlemleri burada yapabilirsiniz.
                                  },
                                ),
                                kutu(),
                                ListTile(
                                  title: Text(
                                    'NORMAL',
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage(
                                              operation: "-",
                                              level: "Orta",
                                              x1: 1000,
                                              x2: 999)), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                                    );
                                    // Orta seviye işlemleri burada yapabilirsiniz.
                                  },
                                ),
                                kutu(),
                                ListTile(
                                  title: Text(
                                    'ZOR',
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage(
                                              operation: "-",
                                              level: "Zor",
                                              x1: 10000,
                                              x2: 9999)), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                                    );
                                    // İleri seviye işlemleri burada yapabilirsiniz.
                                  },
                                ),
                              ],
                            ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      resetContent();
                      setState(() {
                        isContent4 = !isContent4;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: isContent4 ? size.width * 0.4 : size.width * 0.5,
                      height:
                          isContent4 ? size.height * 0.2 : size.height * 0.3,
                      color:
                          isContent4 ? AppColors.boxColor : AppColors.textColor,
                      child: isContent4
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.textColor,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ListTile(
                                  title: Text(
                                    'KOLAY',
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage(
                                              operation: "/",
                                              level: "Kolay",
                                              x1: 100,
                                              x2: 10)), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                                    );
                                    // Basit seviye işlemleri burada yapabilirsiniz.
                                  },
                                ),
                                kutu(),
                                ListTile(
                                  title: Text(
                                    'NORMAL',
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage(
                                              operation: "/",
                                              level: "Zor",
                                              x1: 1000,
                                              x2: 100)), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                                    );
                                    // Orta seviye işlemleri burada yapabilirsiniz.
                                  },
                                ),
                                kutu(),
                                ListTile(
                                  title: Text(
                                    'ZOR',
                                    style: TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: size.width * 0.07,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage(
                                              operation: "/",
                                              level: "Kolay",
                                              x1: 10000,
                                              x2: 1000)), // SecondPage burada yönlendirilecek sayfanın adı olmalı
                                    );
                                    // İleri seviye işlemleri burada yapabilirsiniz.
                                  },
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
