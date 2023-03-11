import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:transaction_2/Model/transaction_model.dart';
import 'package:transaction_2/Model/transaction_model.dart';
import 'package:transaction_2/Widgets/charts_bar.dart';

class Chart extends StatefulWidget {
  final List infoList;

  const Chart({required this.infoList, super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        double totalsum = 0;
        final weekDay = DateTime.now().subtract(Duration(days: index));
        for (var i = 0; i < widget.infoList.length; i++) {
          if (widget.infoList[i].currentdate.day == weekDay.day &&
              widget.infoList[i].currentdate.month == weekDay.month &&
              widget.infoList[i].currentdate.year == weekDay.year) {
            totalsum += widget.infoList[i].amount;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 3),
          'amount': totalsum
        };
      },
    );
  }

  double get total {
    return groupedTransactionValues.fold(
        0, (sum, item) => sum + (item['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValues
            .map(
              (e) => Barchart(
                  label: e['day'],
                  spending: e['amount'],
                  spendingper: total == 0 ? 0 : e['amount'] / total),
            )
            .toList(),
      ),
    );
  }
}
