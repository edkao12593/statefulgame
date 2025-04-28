import 'package:flutter/material.dart';

class GainButton extends StatelessWidget {
  final VoidCallback onPressed;
  const GainButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: const StadiumBorder(),
      ),
      child: const Text('增臭！', style: TextStyle(fontSize: 20)),
    );
  }
}
