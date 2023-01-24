import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iris/Screens/show_model.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  late List favCard;

  @override
  void initState() {
    super.initState;
    fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))),
        centerTitle: true,
        title: const Text('Favourite Page'),
        backgroundColor: Colors.teal.shade400,
      ),
      body: ListView.builder(
        itemCount: favCard.length,
        itemBuilder: ((context, index) {
          return Card(
            child: Text(favCard[index].toString()),
          );
        }),
      ),
    );
  }

  void fetchList() {
    var box = Hive.box("FavouriteDishes");
    favCard = box.get("hi", defaultValue: []);
  }
}
