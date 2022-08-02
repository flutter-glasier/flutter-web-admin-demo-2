import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/enquiry/widgets/enquiry_table.dart';

import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

import 'widgets/search_bar.dart';

class EnquiryPage extends StatelessWidget {
  const EnquiryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          // Obx(
          //   () => Row(
          //     children: [
          //       Container(
          //           margin: EdgeInsets.only(
          //               top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
          //           child: CustomText(
          //             text: menuController.activeItem.value,
          //             size: 24,
          //             weight: FontWeight.bold,
          //           )),
          //     ],
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: ListView(
              shrinkWrap: true,
              children: [SearchBar(), EnquiryTable()],
            ),
          ),
        ],
      ),
    );
  }
}
