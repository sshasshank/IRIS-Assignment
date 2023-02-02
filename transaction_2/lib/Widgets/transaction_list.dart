import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transaction_2/Model/transaction_model.dart';
import 'package:hive/hive.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  late List infolist;

  @override
  void initState() {
    super.initState();
    var box = Hive.box("Transaction");
    infolist = box.get("info", defaultValue: []);
    print('Initstate');
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> value = ValueNotifier<int>(infolist.length);
    print('List');
    return SizedBox(
      height: 337,
      child: ValueListenableBuilder(
        valueListenable: value,
        builder: (context, value, c) {
          return ListView.builder(
            itemCount: infolist.length,
            itemBuilder: (context, index) {
              return InkWell(
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
                                Text((infolist[index] as Transaction).item,
                                    style: const TextStyle(
                                        fontFamily: 'AmaticSC',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  DateFormat.yMMMd().format(DateTime.now()),
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
                                  (infolist[index] as Transaction)
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
          );
        },
      ),
    );
  }
}
