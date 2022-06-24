import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController showCustomSnackbar(String text, {Color? color}) {
  return Get.showSnackbar(
    GetSnackBar(
      message: text,
      duration: const Duration(seconds: 4),
      backgroundColor: color ?? Get.theme.primaryColor,
    ),
  );
}
