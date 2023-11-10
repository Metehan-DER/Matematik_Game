import 'package:flutter/material.dart';
import 'package:matematik/Renkler&Temalar.dart';
import 'package:matematik/SettingsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class firstLoginPage extends StatefulWidget {
  @override
  _firstLoginPage createState() => _firstLoginPage();
}

class _firstLoginPage extends State<firstLoginPage> {
  TextEditingController adController = TextEditingController();
  TextEditingController soyadController = TextEditingController();

  bool isDataValid = false; // Verilerin geçerli olduğunu kontrol etmek için bir bayrak ekleyin

  @override
  Widget build(BuildContext context) {
    String ad, soyad;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'GİRİŞ SAYFASI',
          style: TextStyle(color: AppColors.textColor),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: adController,
                  onChanged: (value) {
                    setState(() {
                      isDataValid = adController.text.isNotEmpty && soyadController.text.isNotEmpty;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Adınız',
                    labelStyle: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                    prefixIcon: Icon(
                      Icons.drive_file_rename_outline_sharp,
                      color: AppColors.primaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: AppColors.secondaryColor, // Arkaplan rengi
                  ),
                ),
                SizedBox(height: 20), // Boşluk ekleyebilirsiniz
                TextField(
                  controller: soyadController,
                  onChanged: (value) {
                    setState(() {
                      isDataValid = adController.text.isNotEmpty && soyadController.text.isNotEmpty;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Soyadınız',
                    labelStyle: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                    prefixIcon: Icon(
                      Icons.drive_file_rename_outline_sharp,
                      color: AppColors.primaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: AppColors.secondaryColor, // Arkaplan rengi
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    ad = adController.text;
                    soyad = soyadController.text;

                    if (ad.isNotEmpty && soyad.isNotEmpty) {
                      isDataValid = true;
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      await prefs.setString('ad', adController.text);
                      await prefs.setString('soyad', soyadController.text);
                      await prefs.setBool('firstLogin', false);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              settingsPage(ad: ad, soyad: soyad),
                        ),
                      );
                    } else {
                      // Kullanıcıdan gerekli verileri girmesini isteyen bir uyarı göster
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Hata'),
                            content: Text('Lütfen ad ve soyadınızı giriniz.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Tamam'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isDataValid
                        ? AppColors.primaryColor
                        : AppColors.littleBoxColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Kaydet',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor, // Buton metin rengi
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
