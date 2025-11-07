import 'package:flutter/material.dart';

class CoffeePres extends StatelessWidget {
  const CoffeePres({super.key});

  void increaseStrength() {
    print("inc strength by 1");
  }

  void increaseSugars() {
    print("inc sugars by 1");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Strength: "),
            const Text("3"),
            Image.asset(
              'assets/img/coffee_bean.png',
              width: 25,
              color: Colors.brown[100],
              colorBlendMode: BlendMode.multiply,
            ),
            const Expanded(child: SizedBox()),
            FilledButton(
              onPressed: increaseStrength,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
              ),
              child: const Text("+"),
            ),
          ],
        ),
        Row(
          children: [
            const Text("Sugars: "),
            const Text("3"),
            Image.asset(
              'assets/img/sugar_cube.png',
              width: 25,
              color: Colors.brown[100],
              colorBlendMode: BlendMode.multiply,
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: increaseSugars,
              style: ElevatedButton.styleFrom(foregroundColor: Colors.brown),
              child: const Text("+"),
            ),
          ],
        ),
      ],
    );
  }
}
