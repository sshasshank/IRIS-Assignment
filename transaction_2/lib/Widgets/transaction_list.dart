// This contains the list of all the added

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:transaction_2/Model/transaction_model.dart';
import 'package:hive/hive.dart';
import 'package:transaction_2/Widgets/add_transaction.dart';
import 'package:transaction_2/Widgets/charts.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  updateList() {
    print('update list is called');
    setState(() {});
  }

  late List infolist;
//Opened a hive box to access the stored data

  @override
  void initState() {
    super.initState();
    var box = Hive.box("Transaction3");
    infolist = box.get("info", defaultValue: []);

    //Testing if Initstate is called every time I press add button

    print('Initstate is called in transaction list');
  }

  @override
  Widget build(BuildContext context) {
    int a = infolist.length;
    updateList();
    //Testing if build is called every time I press add button

    print('Transaction List is built');

//Layout of List

    return Column(
      children: [
        Chart(infoList: infolist),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            'Recent Transactions',
            style: GoogleFonts.notoSerif(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 580,
          child: Stack(children: [
            ListView.builder(
              //Defining no of cards required

              itemCount: infolist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  //Layout of Card displayed in the list

                  child: Card(
                    elevation: 0,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                //backgroundBlendMode: BlendMode,
                                color: Colors.orange.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            //color: Colors.orange.shade100,
                            child: const Icon(
                              Icons.call_received_rounded,
                              color: Colors.orange,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Printing the title stored in the card using hive box
                                  Text(
                                      (infolist[infolist.length - index - 1]
                                              as Transaction)
                                          .item,
                                      style: const TextStyle(
                                          fontFamily: 'AmaticSC',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    //Adding date of the transaction

                                    DateFormat.yMMMd().format(
                                        (infolist[infolist.length - index - 1]
                                                as Transaction)
                                            .currentdate),
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Padding(
                              padding: const EdgeInsets.all(00),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.currency_rupee,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.orange),

                                    //Printing the amount stored in the card using hive box

                                    (infolist[infolist.length - (index + 1)]
                                            as Transaction)
                                        .amount
                                        .toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 450),
              child: Center(
                child: FloatingActionButton(
                  heroTag: 'b2',
                  onPressed: (() {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) =>
                            AddTransaction(updateList: updateList),
                      ),
                    );
                  }),
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
