import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matematik/Renkler&Temalar.dart';
import '../SettingsPage.dart';

class carpmaPage extends StatelessWidget {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/carpma_text.txt');
  }

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: AppColors.backgroundColor,
        title: Text('ÇARPMA İŞLEMİ',style: TextStyle(color: AppColors.textColor,),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => settingsPage(),
                ),
              );
            },
            icon: Icon(Icons.settings,color: AppColors.textColor,),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<String>(
            future: loadAsset(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('Hata: Metin dosyası okunamadı');
                }
                final text = snapshot.data;
                final parsedText = _parseText(text!);
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.topLeft, // Metni sola yasla
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: parsedText,
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  List<TextSpan> _parseText(String text) {
    List<TextSpan> spans = [];
    final RegExp exp = RegExp(r'<h1>(.*?)<\/h1>');
    final matches = exp.allMatches(text);

    int start = 0;
    for (Match match in matches) {
      final String? title = match.group(1);
      // Başlık öncesini ve sonrasını koyu renkte olmayan metin olarak ekler
      spans.add(TextSpan(
          text: text.substring(start, match.start),
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 24,
            decoration: TextDecoration.none,
          )));
      // Başlığı koyu renkte ve kalın olarak ekler
      spans.add(TextSpan(
          text: title,
          style: TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold, fontSize: 36)));
      start = match.end;
    }

    if (start < text.length) {
      // Son kısmı koyu renkte olmayan metin olarak ekler
      spans.add(TextSpan(
          text: text.substring(start), style: TextStyle(color: AppColors.textColor,fontSize: 24,)));
    }

    return spans;
  }
}
