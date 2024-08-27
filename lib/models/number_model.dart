import 'package:flutter/material.dart';

class NumberModel {
  final int value;
  bool isHighlighted;
  Color highlightColor;

  NumberModel({
    required this.value,
    this.isHighlighted = false,
    this.highlightColor = Colors.grey,
  });
}
