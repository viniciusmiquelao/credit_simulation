import 'package:credit_simulation/app/ui/components/safe_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import '../../../../configs/constants/spacements.dart';
import '../../../../configs/theme/custom_theme.dart';
import '../../../components/base_button.dart';

class StepValue extends StatefulWidget {
  const StepValue({Key? key}) : super(key: key);

  @override
  State<StepValue> createState() => _StepValueState();
}

class _StepValueState extends State<StepValue> {
  @override
  Widget build(BuildContext context) {
    return SafeScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Spacements.L),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  style: CustomTheme.of(context).textTheme!.h3,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'De quanto ',
                        style: TextStyle(
                          color: CustomTheme.of(context).colors?.primary,
                        ),
                      ),
                      const TextSpan(text: 'você precisa?'),
                    ],
                  ),
                ),
                const SizedBox(height: Spacements.XS),
                Text.rich(
                  style: CustomTheme.of(context).textTheme!.body1,
                  const TextSpan(
                    children: [
                      TextSpan(text: 'Insira um valor entre '),
                      TextSpan(
                        text: 'R\$500',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' a '),
                      TextSpan(
                        text: 'R\$300.000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: Spacements.XL),
            TextField(
              controller: MoneyMaskedTextController(
                decimalSeparator: ',',
                thousandSeparator: '.',
                leftSymbol: 'R\$ ',
              ),
              autofocus: true,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: CustomTheme.of(context).colors!.primary,
              ),
              decoration: const InputDecoration(
                hintText: 'R\$ 0,00',
                hintStyle: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: Spacements.XL),
            SafeArea(
              child: BaseButton(
                text: 'Continuar',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
