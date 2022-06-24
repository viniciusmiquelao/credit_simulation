import 'package:credit_simulation/app/controllers/credit_simulation/credit_simulation_controller.dart';
import 'package:credit_simulation/app/ui/components/custom_slider.dart';
import 'package:credit_simulation/app/ui/components/safe_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/constants/spacements.dart';
import '../../../../configs/theme/custom_theme.dart';
import '../../../components/base_button.dart';

class DetailsStep extends StatefulWidget {
  const DetailsStep({Key? key}) : super(key: key);

  @override
  State<DetailsStep> createState() => _StepDetailsState();
}

class _StepDetailsState extends State<DetailsStep> {
  final _controller = Get.arguments as CreditSimulationController;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeScrollView(
        child: _controller.isLoading.value
            ? const LoadingPage()
            : Padding(
                padding: const EdgeInsets.all(Spacements.L),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valor escolhido',
                      style: CustomTheme.of(context).textTheme!.h4,
                    ),
                    const SizedBox(height: Spacements.XS),
                    Text(
                      _controller.amount.value,
                      style: CustomTheme.of(context).textTheme!.h1!.copyWith(
                            color: CustomTheme.of(context).colors!.primary,
                          ),
                    ),
                    const SizedBox(height: Spacements.L),
                    Text.rich(
                      style: CustomTheme.of(context).textTheme!.subtitle1,
                      const TextSpan(
                        children: [
                          TextSpan(text: 'Escolha a '),
                          TextSpan(
                            text: 'quantidade de parcerlas',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Spacements.S),
                    Obx(
                      () => CustomSlider(
                        value: _controller.term.value,
                        onChanged: (v) => _controller.term.value = v.toInt(),
                        interval: 3,
                        max: 12,
                        min: 3,
                      ),
                    ),
                    const SizedBox(height: Spacements.L),
                    Text.rich(
                      style: CustomTheme.of(context).textTheme!.subtitle1,
                      const TextSpan(
                        children: [
                          TextSpan(text: 'Escolha o '),
                          TextSpan(
                            text: 'percentual de garantia',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Spacements.S),
                    Obx(
                      () => CustomSlider(
                        value: _controller.ltv.value,
                        onChanged: (v) => _controller.ltv.value = v.toInt(),
                        interval: 15,
                        max: 50,
                        min: 20,
                        labelFormatterCallback:
                            (dynamic actualValue, String formattedText) {
                          return '  $formattedText%';
                        },
                      ),
                    ),
                    const SizedBox(height: Spacements.XL),
                    Text(
                      'Garantia protegida',
                      style: CustomTheme.of(context).textTheme!.h4!.copyWith(
                            color: CustomTheme.of(context).colors!.primary,
                          ),
                    ),
                    const SizedBox(height: Spacements.S),
                    Text(
                      'Bitcoin caiu? Fique tranquilo! Na garantia protegida, '
                      'você não recebe chamada de margem e não é liquidado',
                      style: CustomTheme.of(context).textTheme!.body3!.copyWith(
                            color: CustomTheme.of(context).colors!.gray500,
                          ),
                    ),
                    const SizedBox(height: Spacements.XL),
                    const Spacer(),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          _controller.hasProtectedCollateral.value = false;
                          _controller.createSimulation();
                        },
                        child: const Text('Continuar sem garantia'),
                      ),
                    ),
                    const SizedBox(height: Spacements.XXS),
                    SafeArea(
                      child: BaseButton(
                        text: 'Adicionar garantia',
                        onPressed: () {
                          _controller.hasProtectedCollateral.value = true;
                          _controller.createSimulation();
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Spacements.XL + Spacements.XS),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: Spacements.XL),
            Text(
              'Aguarde um momento',
              style: CustomTheme.of(context).textTheme?.h2,
              maxLines: 1,
            ),
            const SizedBox(height: Spacements.S),
            Text(
              'Estamos simulando seu pedido de crédito Rispar..',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: CustomTheme.of(context).textTheme?.body1,
            )
          ],
        ),
      ),
    );
  }
}
