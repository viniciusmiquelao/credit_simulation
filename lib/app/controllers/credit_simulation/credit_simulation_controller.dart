import 'package:credit_simulation/app/configs/validators/validate_amount.dart';
import 'package:credit_simulation/app/data/models/simulation_request.dart';
import 'package:credit_simulation/app/data/repositories/credit_simulation_repository.dart';
import 'package:credit_simulation/app/ui/pages/credit_simulation/steps/details_step.dart';
import 'package:credit_simulation/app/ui/pages/credit_simulation/steps/value_step.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/validators/validate_full_name.dart';
import '../../configs/validators/validator_email.dart';
import '../../data/models/simulation_response.dart';
import '../../ui/components/custom_snackbar.dart';
import '../../ui/pages/credit_simulation/steps/conclusion_step.dart';

class CreditSimulationController extends GetxController {
  CreditSimulationController(this._creditSimulationRepository);

  final CreditSimulationRepository _creditSimulationRepository;

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
    const ValueStep(),
    const DetailsStep(),
    const ConclusionStep(),
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

  late SimulationResponse simulationResponse;

  void createSimulation() async {
    try {
      isLoading(true);
      final response = await _creditSimulationRepository.createSimulation(
        SimulationRequest(
          fullname: fullName.value,
          email: email.value,
          ltv: ltv.value,
          amount: amountToDouble,
          hasProtectedCollateral: hasProtectedCollateral.value,
          term: term.value,
        ),
      );
      simulationResponse = response;
      next();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      showCustomSnackbar(
        'Ocorreu um erro, tente novamente mais tarde',
        color: Get.theme.colorScheme.error,
      );
    }
  }
}
