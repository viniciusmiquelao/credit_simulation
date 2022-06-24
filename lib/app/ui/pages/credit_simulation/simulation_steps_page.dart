import 'package:credit_simulation/app/configs/theme/custom_theme.dart';
import 'package:credit_simulation/app/ui/pages/credit_simulation/steps/step_value.dart';
import 'package:flutter/material.dart';

import '../../../configs/constants/spacements.dart';

class SimulationStepsPage extends StatefulWidget {
  const SimulationStepsPage({Key? key}) : super(key: key);

  @override
  State<SimulationStepsPage> createState() => _SimulationStepsPageState();
}

class _SimulationStepsPageState extends State<SimulationStepsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: Spacements.M),
              IntrinsicHeight(
                child: Stack(
                  children: [
                    Align(
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor:
                              CustomTheme.of(context).colors!.gray50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: Spacements.S),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StepWrapperProvider(
                onNext: () {},
                child: Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: PageController(initialPage: 0),
                    children: [
                      StepValue(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StepWrapperProvider extends InheritedWidget {
  @override
  final Widget child;

  final VoidCallback? onNext;

  StepWrapperProvider({
    Key? key,
    required this.child,
    this.onNext,
  }) : super(key: key, child: child);

  static StepWrapperProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StepWrapperProvider>();
  }

  @override
  bool updateShouldNotify(StepWrapperProvider oldWidget) {
    return true;
  }
}
