import 'package:flutter/material.dart';
import 'package:handle_internet_conectivity/app/app.locator.dart';
import 'package:handle_internet_conectivity/utils/enums.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> setUpSnackBarUI() async {
  await locator.allReady();
  final service = locator<SnackbarService>();
  // Registers a config to be used when calling showSnackbar
  service.registerCustomSnackbarConfig(
      variant: SnackBarType.positive, config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED,
      borderRadius: 48,
      icon: const Icon(
        Icons.info,
        color: Colors.white,
        size: 20,
      )
  ));
  service.registerCustomSnackbarConfig(variant: SnackBarType.negative, config: SnackbarConfig(
    backgroundColor: Colors.red,
    textColor: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.GROUNDED,
    borderRadius: 48,
    icon: const Icon(
      Icons.info,
      color: Colors.white,
      size: 20,
    )
  ));
}