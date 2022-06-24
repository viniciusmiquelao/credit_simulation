import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../configs/theme/custom_theme.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    Key? key,
    required this.value,
    this.onChanged,
    required this.min,
    required this.max,
    required this.interval,
    this.labelFormatterCallback,
  }) : super(key: key);

  final int min;
  final int max;
  final double interval;
  final int value;
  final Function(dynamic)? onChanged;
  final String Function(dynamic, String)? labelFormatterCallback;

  @override
  Widget build(BuildContext context) {
    return SfSliderTheme(
      data: SfSliderThemeData(
        activeDividerRadius: 5,
        inactiveDividerRadius: 8,
        inactiveDividerColor: CustomTheme.of(context).colors!.gray50,
        activeDividerColor: CustomTheme.of(context).colors!.primary,
        inactiveTrackColor: CustomTheme.of(context).colors!.gray50,
      ),
      child: SfSlider(
        showLabels: true,
        showDividers: true,
        min: min,
        max: max,
        interval: interval,
        value: value,
        stepSize: interval,
        onChanged: onChanged,
        labelFormatterCallback: labelFormatterCallback,
      ),
    );
  }
}
