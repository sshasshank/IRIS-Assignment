import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:transaction_2/Model/transaction_model.dart';
import 'package:transaction_2/Screens/home_screen.dart';
import 'package:transaction_2/Widgets/transaction_list.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  void refresh() {
    print('check');
    HomeScreen();
    delete1.clear();
    delete2.clear();
  }

  // final Transaction info;
  String item = 'Some Expense';
  double amount = 0;
  var delete1 = TextEditingController();
  var delete2 = TextEditingController();
  // @override
  // void dispose() {
  //   item.dispose();
  //   amount.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Transactions")),
      body: Card(
        margin: const EdgeInsets.all(10),
        //color: Colors.indigoAccent,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Item",
                ),
                onChanged: (value) {
                  item = value;
                },
                controller: delete2,
              ),
              Container(
                height: 5,
              ),
              TextField(
                style: const TextStyle(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Amount",
                ),
                onChanged: (value) {
                  amount = double.tryParse(value) ?? 0;
                },
                controller: delete1,
              ),
              Container(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  Transaction transaction = Transaction(
                      item: item, currentdate: DateTime.now(), amount: amount);
                  transaction.storeInBox(transaction);
                  Navigator.of(context).pop(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );

                  refresh();

                  //storeInBox(transaction);
                },
                child: const Text("Add", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
