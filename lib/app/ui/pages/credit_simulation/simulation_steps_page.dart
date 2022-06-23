import 'package:credit_simulation/app/configs/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SimulationStepsPage extends StatefulWidget {
  const SimulationStepsPage({Key? key}) : super(key: key);

  @override
  State<SimulationStepsPage> createState() => _SimulationStepsPageState();
}

class _SimulationStepsPageState extends State<SimulationStepsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LinearProgressIndicator(),
      ),
      body: PageView(),
    );
  }
}
