import 'package:flutter/widgets.dart';

class Preloader extends StatelessWidget {
  final Widget? child;
  final Widget? shimmer;
  final bool isProgressing;

  const Preloader({
    super.key,
    this.child,
    this.shimmer,
    this.isProgressing = true,
  });

  @override
  Widget build(BuildContext context) {
    return isProgressing
        ? shimmer ?? const SizedBox.shrink()
        : child ?? const SizedBox.shrink();
  }
}
