import 'package:flutter/widgets.dart';

class ScaleConfig {
  static double designWidth = 800; // Reference design width
  static double designHeight = 1264; // Reference design height
  static double scale = 1.0;

  static void init(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine the scale factor based on the width or height ratio
    double scaleX = screenWidth / designWidth;
    double scaleY = screenHeight / designHeight;
    scale = scaleX < scaleY ? scaleX : scaleY;
  }
}

class ScaledWidget extends StatelessWidget {
  final Widget child;

  ScaledWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    ScaleConfig.init(context);

    return Transform.scale(
      scale: ScaleConfig.scale,
      child: Container(
        width: ScaleConfig.designWidth,
        height: ScaleConfig.designHeight,
        child: child,
      ),
    );
  }
}
