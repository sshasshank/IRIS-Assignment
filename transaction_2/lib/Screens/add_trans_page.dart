//Page used to add information of the transaction

import 'package:flutter/material.dart';
import 'package:transaction_2/Widgets/add_transaction.dart';

class AddTransactionPage extends StatelessWidget {
  Function updateList;
   AddTransactionPage({required this.updateList,super.key});

  @override
  Widget build(BuildContext context) {
    return AddTransaction(
      updateList: updateList,
    );
  }
}
