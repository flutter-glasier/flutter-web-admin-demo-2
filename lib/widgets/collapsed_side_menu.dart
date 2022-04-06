import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/widgets/side_menu_item.dart';
import 'package:get/get.dart';

class CollapsedSideMenu extends StatelessWidget {
  VoidCallback? callback;
  CollapsedSideMenu({Key? key, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              if (ResponsiveWidget.isSmallScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(width: _width / 48),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Image.asset("assets/icons/logo.png"),
                        ),
                        Flexible(
                          child: CustomText(
                            text: "Dash",
                            size: 20,
                            weight: FontWeight.bold,
                            color: active,
                          ),
                        ),
                        SizedBox(width: _width / 48),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              Divider(
                color: lightGrey.withOpacity(.1),
              ),
              Obx(() => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: sideMenuItemRoutes
                        .map((item) => InkWell(
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.,
                                  children: [
                                    Visibility(
                                      visible: menuController
                                              .isHovering(item.name) ||
                                          menuController.isActive(item.name),
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      child: Container(
                                        width: 6,
                                        height: 40,
                                        color: dark,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    menuController.returnIconFor(item.name),
                                  ],
                                )),
                            onTap: () {
                              if (item.route == authenticationPageRoute) {
                                Get.offAllNamed(authenticationPageRoute);
                                menuController.changeActiveItemTo(
                                    overviewPageDisplayName);
                              }
                              if (!menuController.isActive(item.name)) {
                                menuController.changeActiveItemTo(item.name);
                                if (ResponsiveWidget.isSmallScreen(context))
                                  Get.back();
                                navigationController.navigateTo(item.route);
                              }
                            }))
                        .toList(),
                  ))
            ],
          ),
          IconButton(
              padding: EdgeInsets.only(left: 20),
              onPressed: () {
                menuController.isCollapsed.value =
                    !menuController.isCollapsed.value;
              },
              icon: Icon(Icons.swipe_right, color: Colors.black)),
        ],
      ),
    );
  }
}
