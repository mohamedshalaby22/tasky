import 'package:flutter/material.dart';
import 'package:tasky/core/theming/colors.dart';

enum Priorities { low, medium, high }

class TaskPriorityColor {
  static Color getTaskPriorityColor(Priorities priority) {
    switch (priority) {
      case Priorities.low:
        return ColorsManager.mainBlue;
      case Priorities.medium:
        return ColorsManager.mainPurple;
      case Priorities.high:
        return ColorsManager.red;
    }
  }

  static String getTaskPriorityIconColor(Priorities priority) {
    switch (priority) {
      case Priorities.low:
        return 'blue';
      case Priorities.medium:
        return 'purple';
      case Priorities.high:
        return 'red';
    }
  }
}
