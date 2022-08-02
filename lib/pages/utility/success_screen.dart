import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatefulWidget {
  String? route;
  SuccessScreen({Key? key, this.route}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with SingleTickerProviderStateMixin {
  Animation<Color?>? animation;
  AnimationController? controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    animation =
        ColorTween(begin: Colors.white, end: active).animate(controller!)
          ..addListener(() {
            setState(() {
              // The state that has changed here is the animation object’s value.
            });
          });
  }

  @override
  void didChangeDependencies() {
    animateColor();

    Future.delayed(Duration(seconds: 2))
        .then((value) => Get.offAllNamed(rootRoute));
    super.didChangeDependencies();
  }

  void animateColor() {
    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Center(
        child: Lottie.asset(
          'assets/animation/success.json',
          width: 500,
          height: 500,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
