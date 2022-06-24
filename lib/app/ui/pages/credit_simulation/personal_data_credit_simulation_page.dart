import 'package:credit_simulation/app/configs/constants/spacements.dart';
import 'package:credit_simulation/app/configs/theme/custom_theme.dart';
import 'package:credit_simulation/app/configs/validators/validate_full_name.dart';
import 'package:credit_simulation/app/configs/validators/validator_email.dart';
import 'package:credit_simulation/app/controllers/credit_simulation/credit_simulation_controller.dart';
import 'package:credit_simulation/app/routes/routes.dart';
import 'package:credit_simulation/app/ui/components/base_button.dart';
import 'package:credit_simulation/app/ui/components/safe_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/providers/dependences_injector/index.dart';
import '../../components/text_field_with_title.dart';

class PersonalDataCreditSimulationPage extends StatefulWidget {
  const PersonalDataCreditSimulationPage({Key? key}) : super(key: key);

  @override
  State<PersonalDataCreditSimulationPage> createState() =>
      _PersonalDataCreditSimulationPageState();
}

class _PersonalDataCreditSimulationPageState
    extends State<PersonalDataCreditSimulationPage> {
  final _controller = DependencesInjector.get<CreditSimulationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 300,
                color:
                    CustomTheme.of(context).colors!.primary!.withOpacity(.05),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(Spacements.L),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            style: CustomTheme.of(context).textTheme!.h3,
                            TextSpan(
                              children: [
                                const TextSpan(text: 'Simule '),
                                TextSpan(
                                  text: 'agora',
                                  style: TextStyle(
                                    color:
                                        CustomTheme.of(context).colors?.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: Spacements.XS),
                          const Text('Crédito, rápido, fácil e seguro! :)'),
                        ],
                      ),
                      const SizedBox(height: Spacements.XL),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldWithTitle(
                            title: 'Qual seu ',
                            titleBold: 'nome completo?',
                            onChanged: (e) => _controller.fullName.value = e,
                            validator: validateFullName,
                            hintText: 'Nome completo',
                          ),
                          const SizedBox(height: Spacements.M),
                          TextFieldWithTitle(
                            title: 'E seu ',
                            titleBold: 'e-mail?',
                            onChanged: (e) => _controller.email.value = e,
                            validator: validateEmail,
                            hintText: 'seuemail@email.com',
                          ),
                        ],
                      ),
                      const SizedBox(height: Spacements.XL),
                      Obx(
                        () => SafeArea(
                          child: BaseButton(
                            text: 'Continuar',
                            onPressed: _controller.formPersonalDataValid
                                ? () {
                                    Get.toNamed(
                                      Routes.simulationSteps,
                                      arguments: _controller,
                                    );
                                  }
                                : null,
                          ),
                        ),
                      )
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
