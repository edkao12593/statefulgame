
import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/gain_button.dart';
import '../theme/app_theme.dart';

class MuscleGamePage extends StatefulWidget {
  const MuscleGamePage({Key? key}) : super(key: key);

  @override
  State<MuscleGamePage> createState() => _MuscleGamePageState();
}

class _MuscleGamePageState extends State<MuscleGamePage> {
  int muscleLevel = 0;
  int timeLeft = 20;
  Timer? _timer;
  bool isStarted = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startGame() {
    setState(() {
      muscleLevel = 0;
      timeLeft = 20;
      isStarted = true;
    });
    _startCountdown();
  }

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          _timer?.cancel();
          _showGameOver();
        }
      });
    });
  }

  void _increaseMuscle(int amount) {
    setState(() {
      muscleLevel += amount;
    });
  }

  void _showGameOver() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope<Object?>(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {},
        child: AlertDialog(
          title: const Text('遊戲結束！'),
          content: Text('你的惡臭指數：$muscleLevel'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  isStarted = false;
                });
              },
              child: const Text('再試一次'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!isStarted) {
      return Scaffold(
        backgroundColor: AppTheme.wallColor,
        appBar: AppBar(title: const Text('野獸先輩 ‧ 臉部臭臭臭')),
        body: Center(
          child: ElevatedButton(
            onPressed: _startGame,
            child: const Text('開始遊戲', style: TextStyle(fontSize: 24)),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.wallColor,
      appBar: AppBar(title: const Text('野獸先輩 ‧ 臉部臭臭臭')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '時間：$timeLeft s',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '惡臭指數：$muscleLevel',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),

          Expanded(
            child: Center(
              child: Card(
                color: AppTheme.shutterColor,
                elevation: 4,
                child: OverflowBox(
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 200 + muscleLevel.toDouble(),
                    height: 200 + muscleLevel.toDouble(),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/senpai_face.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: GainButton(onPressed: () => _increaseMuscle(5)),
          ),
        ],
      ),
    );
  }
}
