import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation(
      {Key? key,
      this.controller,
      this.width,
      this.height,
      this.padding,
      this.borderRadius,
      this.color,
      this.child})
      :

        // Each animation defined here transforms its value during the subset
        // of the controller's duration defined by the animation's interval.
        // For example the opacity animation transforms its value during
        // the first 10% of the controller's duration.

        opacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller!,
            curve: Interval(
              0.0,
              0.100,
              curve: Curves.ease,
            ),
          ),
        ),

        // ... Other tween definitions ...

        super(key: key);

  final AnimationController? controller;
  final Animation<double>? opacity;
  final Animation<double>? width;
  final Animation<double>? height;
  final Animation<EdgeInsets>? padding;
  final Animation<BorderRadius>? borderRadius;
  final Animation<Color>? color;
  final Widget? child;

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext? context, Widget? child) {
    return Container(
      padding: padding!.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity!.value,
        child: Container(
          width: width!.value,
          height: height!.value,
          decoration: BoxDecoration(
            color: color!.value,
            border: Border.all(
              color: Colors.indigo[300]!,
              width: 3.0,
            ),
            borderRadius: borderRadius!.value,
          ),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller!,
    );
  }
}
