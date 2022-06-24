import 'package:flutter/material.dart';

import '../../configs/constants/spacements.dart';
import '../../configs/theme/custom_theme.dart';

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
