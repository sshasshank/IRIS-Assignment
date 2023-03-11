import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transaction_2/Screens/add_trans_page.dart';
import 'package:transaction_2/Widgets/transaction_list.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  updateList() {
    print('update list is called');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('Home screen is built');

    //Layout of Home Screen

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(10, 10))),
        backgroundColor: Colors.green,
        elevation: 5,
        title: const Text("Expense Tracker",
            style: TextStyle(fontFamily: 'AmaticSC')),
      ),
      body: ListView(
        children: [
          //I will add some chart later on

          const Center(
            child: Text('Chart',
                style: TextStyle(fontSize: 20, fontFamily: 'AmaticSC')),
          ),
          const SizedBox(height: 0),

          // Button to add transaction in the app

          const SizedBox(
            height: 0,
          ),
          Stack(children: [
            const TransactionList(),
          ]),
        ],
      ),
    );
  }
}
