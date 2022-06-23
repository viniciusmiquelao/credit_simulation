import 'package:credit_simulation/app/configs/constants/spacements.dart';
import 'package:credit_simulation/app/configs/theme/custom_theme.dart';
import 'package:flutter/material.dart';

import '../../components/text_field_with_title.dart';

class PersonalDataCreditSimulationPage extends StatefulWidget {
  const PersonalDataCreditSimulationPage({Key? key}) : super(key: key);

  @override
  State<PersonalDataCreditSimulationPage> createState() =>
      _PersonalDataCreditSimulationPageState();
}

class _PersonalDataCreditSimulationPageState
    extends State<PersonalDataCreditSimulationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacements.L),
          child: Column(
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
                        color: CustomTheme.of(context).colors?.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Spacements.S),
              const Text('Crédito, rápido, fácil e seguro! :)'),
              const SizedBox(height: Spacements.XL),
              TextFieldWithTitle(
                title: 'Qual seu ',
                titleBold: 'nome completo?',
                hintText: 'Nome completo',
              ),
              const SizedBox(height: Spacements.L),
              TextFieldWithTitle(
                title: 'E seu',
                titleBold: 'e-mail?',
                hintText: 'seuemail@email.com',
              )
            ],
          ),
        ),
      ),
    );
  }
}
