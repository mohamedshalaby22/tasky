import 'package:flutter/material.dart';
import 'package:tasky/core/theming/colors.dart';

enum TaskStatus { waiting, inprogress, finished }

class TaskStatusHelper {
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

  static String getTaskText(int index) {
    switch (index) {
      case 1:
        return 'inprogress';
      case 2:
        return 'waiting';
      case 3:
        return 'finished';
      default:
        return 'all';
    }
  }
}
