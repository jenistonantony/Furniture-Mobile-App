import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  final _controller = ConfettiController();
  bool isPlaying = false;
  @override
  void display() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(),
          body: Center(
            child: MaterialButton(
              onPressed: () {
                if (isPlaying) {
                  _controller.stop();
                } else {
                  _controller.play();
                }
                isPlaying = !isPlaying;
              },
              color: Colors.deepPurple.shade300,
              child: const Text("congratulations"),
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          blastDirection: pi / 2,
          colors: const [Colors.deepOrange, Colors.deepPurple],
          gravity: 0.01,
          emissionFrequency: 0.1,
        )
      ],
    );
  }
}
