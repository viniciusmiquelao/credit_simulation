import 'package:flutter/material.dart';

import '../../configs/constants/spacements.dart';
import '../../configs/theme/custom_theme.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({
    Key? key,
    required this.title,
    this.titleBold,
    required this.hintText,
  }) : super(key: key);

  final String title;
  final String? titleBold;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          style: CustomTheme.of(context).textTheme!.body1!.copyWith(
                color: CustomTheme.of(context).colors!.gray500,
              ),
          TextSpan(
            children: [
              TextSpan(text: title),
              TextSpan(
                text: titleBold,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: Spacements.XS),
        TextField(
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
    );
  }
}
