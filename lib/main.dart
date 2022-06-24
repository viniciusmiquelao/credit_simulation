import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/app.dart';
import 'app/data/providers/dependences_injector/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                  Brightness.light
              ? Brightness.dark
              : Brightness.light,
    ),
  );
  DependencesInjector.setup();
  runApp(CreditSimulationApp());
}
