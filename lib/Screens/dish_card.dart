import 'package:flutter/material.dart';
import 'package:iris/Screens/show_model.dart';
import 'package:iris/widgets/list_card.dart';

class DishCard extends StatelessWidget {
  const DishCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListCard(
          show: ShowModel(title: 'Srawberry$index'),
        );
      },
    );
  }
}
