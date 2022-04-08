import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/controllers/menu_controller.dart';
import 'package:flutter_web_dashboard/helpers/local_navigator.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/helpers/theme_helper.dart';
import 'package:flutter_web_dashboard/widgets/large_screen.dart';
import 'package:flutter_web_dashboard/widgets/side_menu.dart';
import 'package:get/get.dart';

import '../pages/overview/widgets/notification_dialog.dart';
import 'top_nav.dart';

class SiteLayout extends StatelessWidget {
  MenuController menuController = Get.put(MenuController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(
        child: SideMenu(),
      ),
      body: Obx(() => Stack(children: [
            ResponsiveWidget(
                largeScreen: LargeScreen(),
                smallScreen: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: localNavigator(),
                )),
            menuController.isMenuShowing.value
                ? NotificationDialog()
                : Container()
          ])),
    );
  }
}
