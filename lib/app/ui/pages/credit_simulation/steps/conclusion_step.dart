import 'package:credit_simulation/app/configs/utils/date_formatted.dart';
import 'package:credit_simulation/app/configs/utils/money_formatted.dart';
import 'package:credit_simulation/app/controllers/credit_simulation/credit_simulation_controller.dart';
import 'package:credit_simulation/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/constants/spacements.dart';
import '../../../../configs/theme/custom_theme.dart';
import '../../../components/base_button.dart';
import '../../../components/safe_scroll_view.dart';

class ConclusionStep extends StatefulWidget {
  const ConclusionStep({Key? key}) : super(key: key);

  @override
  State<ConclusionStep> createState() => _StepDetailsState();
}

class _StepDetailsState extends State<ConclusionStep> {
  final _controller = Get.arguments as CreditSimulationController;
  @override
  Widget build(BuildContext context) {
    return SafeScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Spacements.L),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Resultado da simulação',
              style: CustomTheme.of(context).textTheme!.h2,
            ),
            const SizedBox(height: Spacements.L),
            Column(
              children: [
                RowTitleAndContent(
                  title: 'Valor escolhido',
                  content:
                      moneyFormatted(_controller.simulationResponse.netValue!)
                          .replaceAll(',00', ''),
                ),
                RowTitleAndContent(
                  title: 'Garantia',
                  content: _controller.simulationResponse.collateral.toString(),
                ),
                RowTitleAndContent(
                  title: 'Taxa de juros',
                  content: _controller.simulationResponse.interestRate
                          .toString()
                          .replaceAll('.', ',') +
                      '% a.m',
                ),
                RowTitleAndContent(
                  title: 'Percentual de garantia',
                  content: _controller.simulationResponse.ltv.toString() + '%',
                ),
                RowTitleAndContent(
                  title: 'Primeiro vencimento',
                  content: dateFormatted(
                      _controller.simulationResponse.firstDueDate!),
                ),
                RowTitleAndContent(
                  title: 'IOF',
                  content:
                      moneyFormatted(_controller.simulationResponse.iofFee!),
                ),
                RowTitleAndContent(
                  title: 'Tarifa da plataforma',
                  content: moneyFormatted(
                      _controller.simulationResponse.originationFee!),
                ),
                RowTitleAndContent(
                  title: 'Total financiado',
                  content: moneyFormatted(
                      _controller.simulationResponse.contractValue!),
                ),
                RowTitleAndContent(
                  title: 'CET mensal',
                  content: _controller.simulationResponse.monthlyRate!
                          .toPrecision(2)
                          .toString()
                          .replaceAll('.', ',') +
                      '%',
                ),
                RowTitleAndContent(
                  title: 'CET anual',
                  content: _controller.simulationResponse.annualRate!
                          .toPrecision(2)
                          .toString()
                          .replaceAll('.', ',') +
                      '%',
                ),
                RowTitleAndContent(
                  title: 'Cotação do BTC',
                  content: moneyFormatted(
                      _controller.simulationResponse.collateralUnitPrice!),
                ),
              ],
            ),
            const SizedBox(height: Spacements.L),
            SafeArea(
              child: BaseButton(
                text: 'Nova simulação',
                onPressed: () =>
                    Get.offAllNamed(Routes.personalDataCreditSimulation),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowTitleAndContent extends StatelessWidget {
  const RowTitleAndContent(
      {Key? key, required this.title, required this.content})
      : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacements.XS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: CustomTheme.of(context).textTheme!.body2,
              ),
              Text(
                content,
                style: CustomTheme.of(context).textTheme!.body2!.copyWith(
                    color: CustomTheme.of(context).colors!.gray150,
                    fontSize: 17),
              ),
            ],
          ),
        ),
        Divider(
          color: CustomTheme.of(context).colors!.gray50,
          thickness: 2,
        )
      ],
    );
  }
}
