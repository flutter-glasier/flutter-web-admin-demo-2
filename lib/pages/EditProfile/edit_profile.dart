import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/EditProfile/widgets/avatar_header.dart';
import 'package:flutter_web_dashboard/widgets/top_nav.dart';
import 'package:get/get.dart';

import '../../helpers/local_navigator.dart';
import '../../helpers/reponsiveness.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/large_screen.dart';
import '../../widgets/side_menu.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [AvatarHeader()],
          ))
        ],
      ),
    );
    ;
  }
}
