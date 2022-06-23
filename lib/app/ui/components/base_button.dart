import 'package:flutter/material.dart';

import '../../configs/theme/custom_theme.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.text,
    this.onPressed,
    this.borderSide,
    this.color,
    this.textStyle,
    this.height = 50,
    this.width,
    this.borderRadius = 5,
    Brightness brightness = Brightness.dark,
  })  : isDark = brightness == Brightness.dark,
        super(key: key);

  final String? text;
  final TextStyle? textStyle;
  final Color? color;
  final BorderSide? borderSide;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final double? borderRadius;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color ?? CustomTheme.of(context).colors!.button,
        ).copyWith(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5),
              side: BorderSide.none,
            ),
          ),
          overlayColor: MaterialStateProperty.all(
              CustomTheme.of(context).colors!.button!.withOpacity(.3)),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: onPressed,
        child: Text(
          text!,
          maxLines: 1,
          style: textStyle ?? CustomTheme.of(context).textTheme!.button,
          //style: newTextStyle,
        ),
      ),
    );
  }
}
