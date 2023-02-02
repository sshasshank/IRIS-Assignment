// This file was made for testing purpose




// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:intl/intl.dart';
// import 'package:transaction_2/Widgets/transaction_list.dart';

// import '../Model/transaction_model.dart';

// class TransactionCard extends StatefulWidget {
//   final Transaction transaction;
//   const TransactionCard({required this.transaction, super.key});

//   @override
//   State<TransactionCard> createState() => _TransactionCardState();
// }

// class _TransactionCardState extends State<TransactionCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(5),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           children: [
//             Container(
//               decoration:
//                   BoxDecoration(border: Border.all(color: Colors.indigoAccent)),
//               padding: const EdgeInsets.all(10),
//               child: const Text('amount'),
//             ),
//             Expanded(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("title",
//                         style: TextStyle(
//                             fontFamily: 'AmaticSC',
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold)),
//                     const SizedBox(
//                       height: 2,
//                     ),
//                     Text(
//                       DateFormat.yMMMd().format(DateTime.now()),
//                       style: const TextStyle(
//                         fontSize: 15,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
