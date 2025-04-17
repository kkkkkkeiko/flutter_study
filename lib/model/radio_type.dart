import 'package:flutter/material.dart';

enum RadioType {
  learn('learning', 'LRN'),
  work('work', 'WRK'),
  general('general', 'GEN');

  const RadioType(this.value, this.label);
  final String value;
  final String label;
  Color getColor() {
    switch (this) {
      case RadioType.learn:
        return Colors.green;
      case RadioType.work:
        return Colors.blue.shade700;
      case RadioType.general:
        return Colors.amberAccent.shade700;
    }
  }
}
