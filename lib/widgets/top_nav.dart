import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/menu_controller.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/helpers/theme_helper.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import 'custom_text.dart';

MenuController menuController = Get.put(MenuController());
AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Image.asset(
                    "assets/icons/logo.png",
                    width: 28,
                  ),
                ),
              ],
            )
          : IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                key.currentState!.openDrawer();
              }),
      title: Container(
        child: Row(
          children: [
            Visibility(
                visible: !ResponsiveWidget.isSmallScreen(context),
                child: CustomText(
                  text: "Dash",
                  color: lightGrey,
                  size: 20,
                  weight: FontWeight.bold,
                )),

            Expanded(child: Container()),
            // IconButton(
            //     icon: Icon(
            //       Icons.settings,
            //       color: dark,
            //     ),
            //     onPressed: () {
            //       // _showPopupMenu(context);
            //     }),
            Stack(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: dark.withOpacity(.7),
                    ),
                    onPressed: () {
                      menuController.isMenuShowing.value =
                          !menuController.isMenuShowing.value;
                    }),
                Positioned(
                  top: 7,
                  right: 7,
                  child: Container(
                    width: 12,
                    height: 12,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: active,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: light, width: 2)),
                  ),
                )
              ],
            ),
            Container(
              width: 1,
              height: 22,
              color: lightGrey,
            ),
            SizedBox(
              width: 24,
            ),
            CustomText(
              text: "Ashish Suthar",
              color: lightGrey,
            ),
            SizedBox(
              width: 16,
            ),
            InkWell(
              onTap: () async {
                // Get.toNamed(editProfileRoute);
                navigationController.navigateTo(editProfileRoute);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: active.withOpacity(.5),
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: light,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      iconTheme: IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: appTheme!.whiteColor,
    );

void _showPopupMenu(BuildContext context) async {
  await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(0, 500, 200, 0),
    items: [
      PopupMenuItem(
        value: 1,
        child: Text("View"),
      ),
      PopupMenuItem(
        value: 2,
        child: Text("Edit"),
      ),
      PopupMenuItem(
        value: 3,
        child: Text("Delete"),
      ),
    ],
    elevation: 8.0,
  ).then((value) {
// NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null

    if (value != null) print(value);
  });
}
