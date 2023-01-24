import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iris/Screens/details_page.dart';
import 'package:iris/Screens/dish_card.dart';
import 'package:iris/Screens/fav_page.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Recipe Book', style: TextStyle(fontFamily: 'Pacifico')),
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        backgroundColor: Colors.teal.shade400,
        foregroundColor: Colors.white,
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) {
                      return const FavPage();
                    },
                  ),
                );
              },
              child: const Icon(Icons.favorite))
        ],
      ),
      body: const DishCard(),
    );
  }
}
