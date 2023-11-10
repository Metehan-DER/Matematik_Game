import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:matematik/Emoji.dart';
import 'dart:async';
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
  late int totalTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    totalTime = getTimeForLevel(widget.level);
    generateQuestion(widget.x1, widget.x2);
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (totalTime > 0) {
          totalTime--;
        } else {
          handleTimeUp();
        }
      });
    });
  }

  void showFeedbackWithEmoji(String emoji) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: EmojiAnimation(emoji: emoji),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Pes etme, tekrar dene".toUpperCase(),
                style: TextStyle(color: AppColors.textColor,
                fontSize: 20,),
              ),
              style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor),
            ),
          ],
        );
      },
    );
  }

// Example usage:
// showFeedbackWithEmoji('😢'); // Sad emoji
// showFeedbackWithEmoji('😊'); // Happy emoji
// showFeedbackWithEmoji('🎉'); // Celebration emoji
// ...


  void handleTimeUp() {
    timer.cancel();
    setState(() {
      questionCount++;
      if (questionCount < 10) {
        generateQuestion(widget.x1, widget.x2);
        totalTime = getTimeForLevel(widget.level);
        startTimer();
      } else {
        gameOver = true;
        if (score < 50) {
          audioPlayer.play(AssetSource(lowScoreSound));
          showFeedbackWithEmoji('😢');
        } else if (score < 80) {
          audioPlayer.play(AssetSource(mediumScoreSound));
          confettiController.play();
        } else {
          audioPlayer.play(AssetSource(highScoreSound));
          confettiController.play();
        }
      }
    });
  }

  int getTimeForLevel(String level) {
    switch (level) {
      case 'Kolay':
        return 15;
      case 'Orta':
        return 10;
      case 'Zor':
        return 5;
      default:
        return 10;
    }
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
        handleTimeUp();
      });
    } else {
      setState(() {
        handleTimeUp();
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final size = MediaQuery.of(context).size;
    double progress = totalTime / getTimeForLevel(widget.level);
    Color startColor = AppColors.primaryColor;
    Color endColor = AppColors.secondaryColor;

    // Adjust gradient colors based on progress
    if (progress < 0.5) {
      startColor = Color.lerp(
        Colors.red,
        AppColors.secondaryColor,
        progress * 2,
      )!;
      endColor = AppColors.secondaryColor;
    } else {
      startColor = AppColors.primaryColor;
      endColor = Color.lerp(
        AppColors.textColor,
        AppColors.secondaryColor,
        (progress - 0.5) * 2,
      )!;
    }

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
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [startColor, endColor],
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          height: 32,
                          width: size.width,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Text(
                            textAlign: TextAlign.center,
                            'Kalan Süre: $totalTime s',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              color: AppColors.backgroundColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text('Soru ${questionCount + 1}/10',
                        style: TextStyle(
                            fontSize: size.width * 0.07,
                            color: AppColors.textColor)),
                    SizedBox(height: size.height * 0.08),
                    Text('$firstNumber ${widget.operation} $secondNumber = ?',
                        style: TextStyle(
                            fontSize: size.width * 0.10,
                            color: AppColors.textColor)),
                    SizedBox(height: size.height * 0.04),
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: ConfettiWidget(
                        confettiController: confettiController,
                        blastDirection: pi,
                        emissionFrequency: 0.05,
                        numberOfParticles: 20,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
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
