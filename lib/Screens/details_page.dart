import 'package:flutter/material.dart';
import 'package:iris/Screens/show_model.dart';
import 'package:iris/constants.dart';
import 'package:iris/widgets/ingri_card.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DetailsPage extends StatelessWidget {
  static String routeName = '/details';
  //final String title;
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ShowModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title,
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.shade400,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Take Note',
        onPressed: () {
          storeInBox(args);
        },
        backgroundColor: Colors.teal.shade400,
        child: const Icon(
          Icons.edit,
          size: 26,
          // color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 180,
              width: 180,
              child: Image.network(
                dish,
                scale: 0.5,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Strawberry Cake"),
            const SizedBox(
              height: 20,
            ),
            const Text('Desert'),
            const SizedBox(
              height: 20,
            ),
            const Text("Ingridient"),
            SizedBox(
              height: 120,
              child: PageView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return const IngriCard();
                },
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade400),
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow,
              ),
              label: const Text('Tutorial'),
            )
          ],
        ),
      ),
    );
  }

  void storeInBox(ShowModel show) {
    var box = Hive.box('FavouriteDishes');
    List favCard = box.get("hi", defaultValue: []);
    favCard.add(show.title);
    box.put("hi", favCard);
  }
}
