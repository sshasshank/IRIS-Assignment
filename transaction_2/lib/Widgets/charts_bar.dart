import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Barchart extends StatefulWidget {
  final String label;
  final double spending;
  final double spendingper;

  const Barchart(
      {super.key,
      required this.label,
      required this.spending,
      required this.spendingper});

  @override
  State<Barchart> createState() => _BarchartState();
}

class _BarchartState extends State<Barchart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.currency_rupee),
            Text(widget.spending.round().toString()),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 130,
          width: 20,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: const Color.fromRGBO(181, 183, 181, 0.808),
                  border: Border.all()),
            ),
            FractionallySizedBox(
              heightFactor: widget.spendingper,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(211, 115, 52, 0.965),
                ),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(widget.label)
      ],
    );
  }
}
