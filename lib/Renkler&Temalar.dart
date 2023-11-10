import 'package:flutter/material.dart';

class AppColors {
  static int Tema = 1;

  static Color primaryColor = Color(0xFF3D7A5D);
  static Color secondaryColor = Color(0xFFFFF3C7);
  static Color textColor = Color(0xFFFBF7EA);
  static Color boxColor = Color(0xFF1F1E1C);
  static Color backgroundColor = Color(0xFF000000);
  static Color littleBoxColor = Color(0xFF5D5D5D);

  static void setTheme(int tema) {
    Tema = tema;
    if (Tema == 1) {
      primaryColor = Color(0xFF3D7A5D);
      secondaryColor = Color(0xFFFFF3C7);
      textColor = Color(0xFFFBF7EA);
      boxColor = Color(0xFF1F1E1C);
      backgroundColor = Color(0xFF000000);
      littleBoxColor = Color(0xFF5D5D5D);
    } else if (Tema == 2) {
      primaryColor = Color(0xFF34FFC8); //
      secondaryColor = Color(0xFF737373); //
      textColor = Color(0xFFFFFFFF); //
      boxColor = Color(0xFF2F2F2F); //
      backgroundColor = Color(0xFF121212); //
      littleBoxColor = Color(0xFFF72A9F); //
    } else if (Tema == 3) {
      primaryColor = Color(0xFFFC0747);   //
      secondaryColor = Color(0xFFF72A9F);  //
      textColor = Color(0xFFFFFFFF);      //
      boxColor = Color(0xFF2E323E);      //
      backgroundColor = Color(0xE5171B29); //
      littleBoxColor = Color(0xFF4D515B); //

    } else if (Tema == 4) {
      // Diğer tema renklerini burada tanımlayabilirsiniz.
    }
  }
}

class AppConstants {
  static const double fontSize = 16.0;
}
