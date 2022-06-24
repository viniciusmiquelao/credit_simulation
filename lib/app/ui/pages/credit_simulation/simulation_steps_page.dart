import 'package:credit_simulation/app/configs/theme/custom_theme.dart';
import 'package:credit_simulation/app/controllers/credit_simulation/credit_simulation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/constants/spacements.dart';

class SimulationStepsPage extends StatefulWidget {
  const SimulationStepsPage({Key? key}) : super(key: key);

  @override
  State<SimulationStepsPage> createState() => _SimulationStepsPageState();
}

class _SimulationStepsPageState extends State<SimulationStepsPage> {
  final _controller = Get.arguments as CreditSimulationController;

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
                    Obx(
                      () => Visibility(
                        visible: !_controller.isLoading.value,
                        child: Align(
                          child: SizedBox(
                            width: 200,
                            child: LinearProgressIndicator(
                              value: _controller.currentStep /
                                  _controller.pageWidgets.length,
                              backgroundColor:
                                  CustomTheme.of(context).colors!.gray50,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: Spacements.S),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: _controller.back,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StepWrapperProvider(
                onNext: _controller.next,
                child: Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller.pageViewController,
                    children: _controller.pageWidgets,
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
