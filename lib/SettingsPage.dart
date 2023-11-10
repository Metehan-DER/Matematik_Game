import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:matematik/HomePage.dart';
import 'Renkler&Temalar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class settingsPage extends StatefulWidget {
  final String? ad;
  final String? soyad;

  const settingsPage({Key? key, this.ad, this.soyad}) : super(key: key);

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  final TextEditingController adController = TextEditingController();
  final TextEditingController soyadController = TextEditingController();
  String? ad;
  String? soyad;
  bool switchValueTheme = true;
  bool switchValueSound = false;
  File? _selectedImage;
  int selectedTheme = AppColors.Tema;

  @override
  void initState() {
    super.initState();
    _loadUserInformation();
    _loadSelectedTheme();
  }

  void _loadUserInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final adFromPrefs = prefs.getString('ad') ?? "Varsayılan Ad";
    final soyadFromPrefs = prefs.getString('soyad') ?? "Varsayılan Soyad";
    final imagePath = prefs.getString('profile_picture');
    setState(() {
      ad = adFromPrefs;
      soyad = soyadFromPrefs;
      adController.text = adFromPrefs;
      soyadController.text = soyadFromPrefs;
      if (imagePath != null) {
        _selectedImage = File(imagePath);
      }
    });
  }

  void _loadSelectedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('selectedTheme') ?? 1;
    setState(() {
      selectedTheme = themeIndex;
      AppColors.setTheme(themeIndex);
    });
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _setProfilePicture() async {
    if (_selectedImage != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_picture', _selectedImage!.path);
    }
  }

  void _saveUserInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ad', adController.text);
    await prefs.setString('soyad', soyadController.text);
  }

  void _changeTheme(int themeIndex) {
    setState(() {
      selectedTheme = themeIndex;
      AppColors.setTheme(themeIndex);
      switchValueTheme = true; // Tema değiştirildiğinde anahtarın durumunu güncelle
      _saveThemeToPrefs(themeIndex);
    });
  }

  Future<void> _saveThemeToPrefs(int themeIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedTheme', themeIndex);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Tema seçenekleri
    List<Map<String, dynamic>> themeOptions = [
      {
        'index': 1,
        'name': 'DARK',
      },
      {
        'index': 2,
        'name': 'AÇIK YEŞİL',
      },
      {
        'index': 3,
        'name': 'PEMBE',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _saveUserInformation();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => homePage(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: AppColors.textColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "AYARLAR",
          style: TextStyle(color: AppColors.textColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: AppColors.textColor,
            ),
          )
        ],
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.06,
                        width: size.width * 0.4,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            ad ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.06,
                        width: size.width * 0.4,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            soyad ?? "",
                            style: TextStyle(
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: _pickImage,
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          height: size.width * 0.5,
                          width: size.width * 0.5,
                          child: ClipOval(
                            child: _selectedImage != null
                                ? Image.file(_selectedImage!, fit: BoxFit.cover)
                                : Image.asset(
                              "assets/unnamed.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: _setProfilePicture,
                        child: Text(
                          "Profil Fotoğrafını Kaydet",
                          style: TextStyle(color: AppColors.textColor),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Tema değişimi için kullanılan AnimatedContainer
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 50.0,
              width: 300.0, // Genişlik artırıldı
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: switchValueTheme ? AppColors.primaryColor : AppColors.littleBoxColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Tema seçeneklerini yatayda düzenle
                children: themeOptions.map((option) {
                  return InkWell(
                    onTap: () => _changeTheme(option['index']),
                    child: Container(
                      width: 80, // Her bir tema seçeneğinin genişliği ayarlandı
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          option['name'],
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14.0, // Yazı boyutu ayarlandı
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            ListTile(
              title: Text(
                'SES',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: size.width * 0.05,
                ),
              ),
              leading: CupertinoSwitch(
                value: switchValueSound,
                thumbColor: AppColors.secondaryColor,
                trackColor: AppColors.littleBoxColor,
                onChanged: (value) {
                  setState(() {
                    switchValueSound = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.littleBoxColor,
                ),
                padding: EdgeInsets.all(8),
                height: size.height * 0.07,
                width: size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.keyboard_double_arrow_down,
                      color: AppColors.textColor,
                    ),
                    Text(
                      "BİZİ TAKİP EDİN",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: size.width * 0.03,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_double_arrow_down,
                      color: AppColors.textColor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.youtube,
                    color: AppColors.textColor,
                    size: size.width * 0.10,
                  ),
                ),
                SizedBox(
                  width: size.height * 0.02,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.facebook,
                    color: AppColors.textColor,
                    size: size.width * 0.10,
                  ),
                ),
                SizedBox(
                  width: size.height * 0.02,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    color: AppColors.textColor,
                    size: size.width * 0.10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
