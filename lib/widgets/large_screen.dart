import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/controllers/menu_controller.dart';
import 'package:flutter_web_dashboard/helpers/local_navigator.dart';
import 'package:flutter_web_dashboard/widgets/collapsed_side_menu.dart';
import 'package:flutter_web_dashboard/widgets/side_menu.dart';
import 'package:get/get.dart';

class LargeScreen extends StatefulWidget {
  LargeScreen({Key? key}) : super(key: key);

  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen>
    with TickerProviderStateMixin {
  MenuController menuController = Get.put(MenuController());
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        seconds: 2,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInSine,
    );
  }

  @override
  dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: menuController.isCollapsed.value
                    ? CollapsedSideMenu()
                    : SizeTransition(
                        axis: Axis.horizontal,
                        axisAlignment: 1.0,
                        sizeFactor: _animation!,
                        child: SideMenu())),
            Expanded(
                flex: menuController.isCollapsed.value ? 15 : 5,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: localNavigator(),
                ))
          ],
        ));
  }
}
