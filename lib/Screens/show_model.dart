import "package:flutter/foundation.dart";
import 'package:hive/hive.dart';
part 'show_model.g.dart';

@HiveType(typeId: 1)
class ShowModel {
  @HiveField(1)
  final String title;
  // @HiveField(2)
  // final String fulltitle;
  // @HiveField(3)
  // final bool isFavourite;
  ShowModel({required this.title});
}
