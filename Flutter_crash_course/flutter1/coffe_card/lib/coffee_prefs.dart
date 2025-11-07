import 'package:flutter/material.dart';

class CoffeePres extends StatefulWidget {
  const CoffeePres({super.key});

  @override
  State<CoffeePres> createState() => _CoffeePresState();
}

class _CoffeePresState extends State<CoffeePres> {
  int strength = 1;
  int sugars = 1;

  void increaseStrength() {
    setState(() {
      strength = strength < 5 ? strength + 1 : 1;
    });
  }

  void increaseSugars() {
    setState(() {
      sugars = sugars < 5 ? sugars + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Strength: "),

            for (int i = 0; i < strength; i++)
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

            if (sugars == 0) const Text("No sugars..."),

            for (var i = 0; i < sugars; i++)
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
