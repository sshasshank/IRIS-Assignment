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
  //refresh() is used for clearing the entered data from the text field when add is pressed

  void refresh() {
    print('check');
    HomeScreen();
    delete1.clear();
    delete2.clear();
  }

  String item = 'Some Expense';
  double amount = 0;
  var delete1 = TextEditingController();
  var delete2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Layout of the add transaction page

    return Scaffold(
      appBar: AppBar(title: const Text("Add Transactions")),
      body: Card(
        margin: const EdgeInsets.all(10),
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
                //Storing the added input in a variable value
                // which in turn stores the input in item
                onChanged: (value) {
                  item = value;
                },

                //using delete2 variable to delete the added input after pressing add

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

                //Storing the added input in a variable value
                // which in turn stores the input in item

                onChanged: (value) {
                  //using delete2 variable to delete the added input after pressing add

                  amount = double.tryParse(value) ?? 0;
                },
                controller: delete1,
              ),
              Container(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  //Storing all the entered info in the hive box

                  Transaction transaction = Transaction(
                      item: item, currentdate: DateTime.now(), amount: amount);
                  transaction.storeInBox(transaction);

                  //returning to the homescreen after pressing add

                  Navigator.of(context).pop(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                  //calling this function to remove all the entered inputs from the text field

                  refresh();
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
