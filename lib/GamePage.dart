import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
import 'HomePage.dart';
import 'Renkler&Temalar.dart';

class GamePage extends StatefulWidget {
  final String operation;
  final String level;
  final int x1;
  final int x2;

  GamePage(
      {required this.operation,
      required this.level,
      required this.x1,
      required this.x2});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final confettiController = ConfettiController();
  AudioPlayer audioPlayer = AudioPlayer();
  int firstNumber = 0;
  int secondNumber = 0;
  int correctAnswer = 0;
  int userAnswer = 0;
  int score = 0;
  int questionCount = 0;
  bool gameOver = false;
  List<int> answerOptions = [];
  String lowScoreSound = 'low.wav';
  String mediumScoreSound = 'medium.mp3';
  String highScoreSound = 'succses.wav';


  @override
  void initState() {
    super.initState();
    generateQuestion(widget.x1, widget.x2);
  }

  void generateQuestion(int x1, int x2) {
    final Random random = Random();
    firstNumber = random.nextInt(x1) + 1;
    secondNumber = random.nextInt(x2) + 1;

    if (widget.operation == '*') {
      correctAnswer = firstNumber * secondNumber;
    } else if (widget.operation == '+') {
      correctAnswer = firstNumber + secondNumber;
    } else if (widget.operation == '-') {
      correctAnswer = firstNumber - secondNumber;
    } else if (widget.operation == '/') {
      double divisionResult = firstNumber / secondNumber;
      correctAnswer = divisionResult.toInt();
    }

    answerOptions.clear();
    answerOptions.add(correctAnswer);
    for (int i = 0; i < 3; i++) {
      int randomAnswer;
      int iter = random.nextInt(12);

      if (iter % 3 == 0) {
        randomAnswer = correctAnswer + random.nextInt(11);
      } else if (iter % 3 == 1) {
        randomAnswer = correctAnswer - random.nextInt(11);
      } else if (iter % 3 == 2) {
        randomAnswer = 10 + correctAnswer;
      } else {
        randomAnswer = 10 - correctAnswer;
      }

      while (answerOptions.contains(randomAnswer)) {
        randomAnswer = random.nextInt(10) + correctAnswer;
      }

      answerOptions.add(randomAnswer);
    }
    answerOptions.shuffle();
  }

  void checkAnswer(int selectedAnswer) {
    if (selectedAnswer == correctAnswer) {
      setState(() {
        score += 10;
        questionCount++;

        if (questionCount < 10) {
          generateQuestion(widget.x1, widget.x2);
        } else {
          gameOver = true;
          // Oyun bittiğinde konfeti patlaması ve müzik çalması
          confettiController.play();
          // Skorunuza göre uygun sesi çal
          if (score < 50) {
            audioPlayer.play(AssetSource(lowScoreSound));
          } else if (score < 80) {
            audioPlayer.play(AssetSource(mediumScoreSound));
          } else {
            audioPlayer.play(AssetSource(highScoreSound));
          }
        }
      });
    } else {
      setState(() {
        questionCount++;

        if (questionCount < 10) {
          generateQuestion(widget.x1, widget.x2);
        } else {
          gameOver = true;
          // Oyun bittiğinde konfeti patlaması ve müzik çalması
          confettiController.play();
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text('Oyun', style: TextStyle(color: AppColors.textColor)),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (!gameOver)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    LinearProgressIndicator(
                      value: (questionCount + 1) / 10,
                      minHeight: 24,
                      color: AppColors.primaryColor,
                      backgroundColor: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Text('Soru ${questionCount + 1}/10',
                        style: TextStyle(
                            fontSize: 40, color: AppColors.textColor)),
                    SizedBox(height: size.height * 0.08),
                    Text('$firstNumber ${widget.operation} $secondNumber = ?',
                        style: TextStyle(
                            fontSize: 40, color: AppColors.textColor)),
                    SizedBox(height: size.height * 0.05),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(
                        size.width * 0.1,
                      ),
                      crossAxisSpacing: size.width * 0.18,
                      mainAxisSpacing: size.width * 0.18,
                      children: answerOptions.map((option) {
                        return ElevatedButton(
                          onPressed: () {
                            if (!gameOver) {
                              checkAnswer(option);
                            }
                          },
                          child: FittedBox(
                            child: Text('$option',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.backgroundColor)),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.secondaryColor,
                            onPrimary: AppColors.primaryColor,
                            minimumSize: Size(125, 75),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                )
              else
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    // Konfeti patlaması
                    Align(
                      alignment: Alignment.centerRight,
                      child: ConfettiWidget(
                        confettiController: confettiController,
                        blastDirection: pi,
                        emissionFrequency: 0.05,
                        numberOfParticles: 20,
                      ),
                    ),
                    SizedBox(height: 40,),
                    Text('Oyun Bitti!',
                        style: TextStyle(
                            fontSize: 40, color: AppColors.textColor)),
                    Text('Puan: $score/100',
                        style: TextStyle(
                            fontSize: 40, color: AppColors.textColor)),
                    SizedBox(
                      height: size.height * 0.2,
                    ),

                    TextButton(
                      onPressed: () {
                        audioPlayer.stop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => homePage()),
                        );

                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                        minimumSize: Size(125, 75),
                      ),
                      child: Text(
                        "TESTİ BİTİR",
                        style:
                            TextStyle(fontSize: 40, color: AppColors.textColor),
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
