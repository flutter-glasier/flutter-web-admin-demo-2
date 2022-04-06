import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/controllers/menu_controller.dart';
import 'package:flutter_web_dashboard/helpers/local_navigator.dart';
import 'package:flutter_web_dashboard/widgets/collapsed_side_menu.dart';
import 'package:flutter_web_dashboard/widgets/side_menu.dart';
import 'package:get/get.dart';

class LargeScreen extends StatelessWidget {
  LargeScreen({Key? key}) : super(key: key);

  MenuController menuController = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: menuController.isCollapsed.value
                    ? CollapsedSideMenu()
                    : SideMenu()),
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
