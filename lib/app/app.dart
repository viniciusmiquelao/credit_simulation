import 'package:credit_simulation/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'configs/theme/theme_switcher.dart';
import 'configs/theme/themes/default_theme.dart';
import 'routes/router.dart';

class CreditSimulationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(
      initialTheme: defaultTheme,
      child: GetMaterialApp(
        title: 'Simulação de Crédito',
        theme: defaultTheme.toMaterialTheme(),
        debugShowCheckedModeBanner: false,
        routes: CustomRouter.routes,
        onUnknownRoute: CustomRouter.onGenerateUnknowedRoute,
        initialRoute: Routes.personalDataCreditSimulation,
        builder: (context, widget) {
          return ScrollConfiguration(
            behavior: const BouncingScrollBehavior(),
            child: widget!,
          );
        },
      ),
    );
  }
}

class BouncingScrollBehavior extends ScrollBehavior {
  const BouncingScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
