import 'package:flutter/material.dart';

class SafeScrollView extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final ScrollPhysics? scrollPhysics;

  const SafeScrollView({
    Key? key,
    required this.child,
    this.padding,
    this.scrollPhysics = const ScrollPhysics(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: scrollPhysics,
          padding: padding,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(child: child),
          ),
        );
      },
    );
  }
}
