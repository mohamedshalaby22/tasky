import 'package:flutter/material.dart';
import 'package:tasky/core/theming/colors.dart';

enum TaskStatus { waiting, inprogress, finished }

class TaskStatusColor {
  static Color getTaskStatusColor(TaskStatus taskStatus) {
    switch (taskStatus) {
      case TaskStatus.waiting:
        return ColorsManager.red;
      case TaskStatus.inprogress:
        return ColorsManager.mainPurple;
      case TaskStatus.finished:
        return ColorsManager.mainBlue;
    }
  }

  static Color getTaskStatusBackgroundColor(TaskStatus taskStatus) {
    switch (taskStatus) {
      case TaskStatus.waiting:
        return ColorsManager.lightRed;
      case TaskStatus.inprogress:
        return ColorsManager.lightPurple;
      case TaskStatus.finished:
        return ColorsManager.lightBlue;
    }
  }
}
