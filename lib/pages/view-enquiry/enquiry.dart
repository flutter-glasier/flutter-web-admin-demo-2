import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';

import 'package:flutter_web_dashboard/pages/view-enquiry/widgets/client_profile.dart';
import 'package:flutter_web_dashboard/pages/view-enquiry/widgets/document_listing.dart';
import 'package:flutter_web_dashboard/pages/view-enquiry/widgets/enquiry_description.dart';
import 'package:flutter_web_dashboard/pages/view-enquiry/widgets/enquiry_header_large.dart';
import 'package:flutter_web_dashboard/pages/view-enquiry/widgets/enquiry_header_smalll.dart';
import 'package:flutter_web_dashboard/widgets/custom_widget.dart';
import 'package:get/get.dart';

import '../../helpers/local_navigator.dart';
import '../../helpers/reponsiveness.dart';
import '../../helpers/theme_helper.dart';
import '../../widgets/large_screen.dart';
import '../../widgets/side_menu.dart';
import '../../widgets/top_nav.dart';
import '../overview/widgets/notification_dialog.dart';

class Enquiry extends StatelessWidget {
  Enquiry({Key? key}) : super(key: key);
  // MenuController menuController = Get.put(MenuController());
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: viewEnquiry(context),
    );
    //   Scaffold(
    //   // key: scaffoldKey,
    //   // extendBodyBehindAppBar: true,
    //   // appBar: topNavigationBar(context, scaffoldKey),
    //   // drawer: Drawer(
    //   //   child: SideMenu(),
    //   // ),
    //   // body: Obx(() => Stack(children: [
    //   //       ResponsiveWidget(
    //   //           largeScreen: LargeScreen(
    //   //             widget: viewEnquiry(),
    //   //           ),
    //   //           smallScreen: Padding(
    //   //             padding: const EdgeInsets.symmetric(horizontal: 16),
    //   //             child: localNavigator(),
    //   //           )),
    //   //       menuController.isMenuShowing.value
    //   //           ? NotificationDialog()
    //   //           : Container()
    //   //     ])),
    // );
  }

  Widget viewEnquiry(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 60),
        child: ResponsiveWidget.isLargeScreen(context)
            ? Column(
                children: [
                  EnquiryHeadersLarge(),
                  Row(
                    children: [
                      Flexible(flex: 6, child: EnquiryDescription()),
                      Flexible(flex: 2, child: ClientProfile())
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: CustomWidgets().getButton(
                            () {}, 'Start Conversation',
                            horizontalMargin: 20),
                      ),
                      Expanded(
                        flex: 2,
                        child: DocumentListing(),
                      )
                    ],
                  )
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    EnquiryHeadersSmall(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: appTheme!.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: appTheme!.grey.withOpacity(0.3), width: 0.3),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 6),
                              color: lightGrey.withOpacity(.1),
                              blurRadius: 12)
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Status'),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(5)),
                            // height: 30,
                            // width: 100,
                            child: Text(
                              'New',
                              style: appTheme!.text10Blue500Semi,
                            ),
                          )
                        ],
                      ),
                    ),
                    EnquiryDescription(),
                    ClientProfile(),
                    DocumentListing(),
                    CustomWidgets().getButton(() {}, 'Start Conversation',
                        horizontalMargin: 20)
                  ],
                ),
              ),
      );
}
