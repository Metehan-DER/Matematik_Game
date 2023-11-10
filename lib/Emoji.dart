import 'package:flutter/material.dart';

class EmojiAnimation extends StatefulWidget {
  final String emoji;

  EmojiAnimation({required this.emoji});

  @override
  _EmojiAnimationState createState() => _EmojiAnimationState();
}

class _EmojiAnimationState extends State<EmojiAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityTween;
  late Animation<double> _sizeTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _opacityTween = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _sizeTween = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut, // You can change the curve as needed
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          color: Colors.transparent,
          child: Opacity(
            opacity: _opacityTween.value,
            child: Transform.scale(
              scale: _sizeTween.value,
              child: Text(
                textAlign: TextAlign.center,
                widget.emoji,
                style: TextStyle(fontSize: 150),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
