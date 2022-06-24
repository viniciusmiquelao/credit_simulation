import 'package:credit_simulation/app/configs/validators/validate_amount.dart';
import 'package:credit_simulation/app/ui/pages/credit_simulation/steps/step_details.dart';
import 'package:credit_simulation/app/ui/pages/credit_simulation/steps/step_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/validators/validate_full_name.dart';
import '../../configs/validators/validator_email.dart';

class CreditSimulationController extends GetxController {
  CreditSimulationController();

  final pageViewController = PageController();

  var currentStep = 1.obs;

  var isLoading = false.obs;

  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void onClose() {
    pageViewController.dispose();
    super.onClose();
  }

  void incrementStep() => ++currentStep.value;

  void decrementStep() => --currentStep.value;

  final pageWidgets = [
    const StepValue(),
    const StepDetails(),
  ];

  void next() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (currentStep.value - 1 < pageWidgets.length) {
      incrementStep();
      pageViewController.nextPage(
        duration: _animationDuration,
        curve: Curves.easeInOut,
      );
      return;
    }

    //Get.toNamed(Routes.);
  }

  Future<bool> back() {
    final isFirst = currentStep == 1;
    if (!isFirst) {
      pageViewController.previousPage(
        duration: _animationDuration,
        curve: Curves.linearToEaseOut,
      );
      decrementStep();
    } else {
      Get.back();
      currentStep(1);
    }
    return Future.value(isFirst);
  }

  var fullName = ''.obs;
  var email = ''.obs;
  var amount = 'R\$ 0,00'.obs;
  var term = 3.obs;
  var ltv = 20.obs;
  var hasProtectedCollateral = false.obs;

  double get amountToDouble => double.parse(amount.value
      .replaceAll('R\$ ', '')
      .replaceAll('.', '')
      .replaceAll(',', '.')
      .trim());

  bool get formPersonalDataValid =>
      validateFullName(fullName.value) == null &&
      validateEmail(email.value) == null;

  bool get formAmountValid => validateAmount(amount.value) == null;
}
