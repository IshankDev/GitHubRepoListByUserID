import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static showInfoSnackBar(String msg) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(msg)));
  }

  static hideSnackBar() {
    ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  }
}
