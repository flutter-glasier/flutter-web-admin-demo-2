import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/widgets/side_menu_item.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  VoidCallback? voidCallback;
  SideMenu({Key? key, this.voidCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: light,
          child: ListView(
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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: sideMenuItemRoutes
                    .map((item) => SideMenuItem(
                        itemName: item.name,
                        onTap: () {
                          if (item.route == authenticationPageRoute) {
                            Get.offAllNamed(authenticationPageRoute);
                            menuController
                                .changeActiveItemTo(overviewPageDisplayName);
                          }
                          if (!menuController.isActive(item.name)) {
                            menuController.changeActiveItemTo(item.name);
                            if (ResponsiveWidget.isSmallScreen(context))
                              Get.back();
                            navigationController.navigateTo(item.route);
                          }
                        }))
                    .toList(),
              )
            ],
          ),
        ),
        IconButton(
            padding: EdgeInsets.only(left: 30),
            onPressed: () {
              menuController.isCollapsed.value =
                  !menuController.isCollapsed.value;
            },
            icon: Icon(Icons.swipe_left_sharp, color: Colors.black)),
      ],
    );
  }
}
