import 'package:get/get.dart';

import 'modules/credit_simulation.dart';
import 'modules/shared.dart';

typedef FactoryFunc<T> = T Function();

class DependencesInjector {
  static final _locator = Get;

  static T get<T extends Object>({String? instanceName}) {
    return _locator.find(tag: instanceName);
  }

  static void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    _locator.create(factoryFunc, tag: instanceName);
  }

  static void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    _locator.lazyPut(
      factoryFunc,
      tag: instanceName,
    );
  }

  static void setup() {
    setupSharedInjections();
    setupCreditSimulationInjections();
  }
}
