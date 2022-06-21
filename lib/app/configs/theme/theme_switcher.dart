import 'package:flutter/material.dart';

import 'custom_theme.dart';

class ThemeSwitcherWidget extends StatefulWidget {
  final CustomThemeData initialTheme;
  final Widget child;

  const ThemeSwitcherWidget({
    Key? key,
    required this.initialTheme,
    required this.child,
  }) : super(key: key);

  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  CustomThemeData? _updatedTheme;

  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      data: _updatedTheme ?? widget.initialTheme,
      onUpdate: (newData) => setState(() {
        _updatedTheme = newData;
      }),
      child: widget.child,
    );
  }
}
