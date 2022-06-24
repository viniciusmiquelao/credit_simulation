import 'package:credit_simulation/app/controllers/credit_simulation/credit_simulation_controller.dart';
import 'package:credit_simulation/app/data/providers/dependences_injector/index.dart';

void setupCreditSimulationInjections() {
  DependencesInjector.registerFactory<CreditSimulationController>(
    () => CreditSimulationController(),
  );
}
