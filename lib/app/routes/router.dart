import 'package:credit_simulation/app/ui/pages/credit_simulation/personal_data_credit_simulation_page.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class CustomRouter {
  static Map<String, WidgetBuilder> routes = {
    //Credit Simulation
    Routes.personalDataCreditSimulation: (_) =>
        const PersonalDataCreditSimulationPage(),
  };

  static Route<dynamic> onGenerateUnknowedRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Center(
          child: Text('Nenhuma rota definida para ${settings.name}'),
        ),
      );
    });
  }
}
