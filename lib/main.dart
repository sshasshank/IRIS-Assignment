// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iris/Screens/details_page.dart';
import 'package:iris/Screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iris/Screens/show_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ShowModelAdapter());
  await Hive.openBox("FavouriteDishes");
  //Hive.box("FavouriteDishes").clear();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      theme: ThemeData.dark(),
      //home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        DetailsPage.routeName: (context) => const DetailsPage()
      },
    ),
  );
}
