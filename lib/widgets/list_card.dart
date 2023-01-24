import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iris/Screens/details_page.dart';
import 'package:iris/Screens/show_model.dart';
import 'package:iris/constants.dart';

class ListCard extends StatelessWidget {
  final ShowModel show;
  const ListCard({required this.show, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailsPage.routeName, arguments: show);
      },
      child: Card(
        borderOnForeground: true,
        surfaceTintColor: Colors.black,
        elevation: 5,
        shadowColor: const Color.fromARGB(255, 222, 166, 70),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        color: const Color.fromARGB(255, 51, 50, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
            bottom: Radius.circular(15),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          //height: 50,
          //width: 1000,
          //color: Colors.black12,
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                width: 110,
                height: 100,
                child: Image.network(dish),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Desert', style: TextStyle(color: Colors.blue)),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    show.title,
                    style: const TextStyle(fontFamily: 'Dancing', fontSize: 20),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
