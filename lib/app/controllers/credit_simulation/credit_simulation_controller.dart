import 'package:credit_simulation/app/ui/pages/credit_simulation/steps/step_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

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

  void incrementStep() => ++currentStep;

  void decrementStep() => --currentStep;

  final pageWidgets = [
    const StepValue(),
  ];

  void next() {
    if (currentStep < pageWidgets.length) {
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
    pageViewController.previousPage(
      duration: _animationDuration,
      curve: Curves.linearToEaseOut,
    );

    final isFirst = currentStep == 1;
    if (!isFirst) decrementStep();
    return Future.value(isFirst);
  }

  void goToSteps() {
    currentStep.value = 1;
    Get.toNamed(Routes.simulationSteps);
  }
}
