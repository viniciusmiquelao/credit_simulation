import 'package:credit_simulation/app/controllers/credit_simulation/credit_simulation_controller.dart';
import 'package:credit_simulation/app/data/providers/dependences_injector/index.dart';
import 'package:credit_simulation/app/data/repositories/credit_simulation_repository.dart';

import '../../http/http_client.dart';

void setupCreditSimulationInjections() {
  DependencesInjector.registerFactory<CreditSimulationRepository>(
    () => CreditSimulationRepositoryImpl(
      DependencesInjector.get<HttpClient>(),
    ),
  );

  DependencesInjector.registerFactory<CreditSimulationController>(
    () => CreditSimulationController(
      DependencesInjector.get<CreditSimulationRepository>(),
    ),
  );
}
