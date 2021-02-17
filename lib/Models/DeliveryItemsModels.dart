import 'package:flutter/material.dart';

class DeliveryItemsModel {
  String text;
  String time;
  String number;
  String dinein;
  String takeaway;
  DeliveryItemsModel({
    @required this.text,
    @required this.time,
    @required this.number,
    @required this.dinein,
    @required this.takeaway,
  });
}
