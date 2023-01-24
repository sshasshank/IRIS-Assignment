import 'package:flutter/material.dart';
import 'package:iris/constants.dart';

class IngriCard extends StatelessWidget {
  const IngriCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.asset(errorBuilder: ((context, error, stackTrace) {
            return const Text('shit');
          }), ingri),
          const Expanded(child: Center(child: Text('Strawberry')))
        ],
      ),
    );
  }
}
