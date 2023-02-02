import 'dart:ffi';

import 'package:hive/hive.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class Transaction {
  @HiveField(0)
  final String item;
  @HiveField(1)
  final double amount;
  @HiveField(2)
  final DateTime currentdate;

  Transaction(
      {required this.item, required this.currentdate, required this.amount});
  storeInBox(Transaction show) async {
    var box = Hive.box("Transaction");
    List info = box.get('info', defaultValue: []);
    info.add(show);
    box.put('info', info);
    //await box.deleteAll(box.keys);
  }
}
