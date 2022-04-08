import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/pages/enquiry/widgets/client_profile.dart';
import 'package:flutter_web_dashboard/pages/enquiry/widgets/document_listing.dart';
import 'package:flutter_web_dashboard/pages/enquiry/widgets/enquiry_description.dart';
import 'package:flutter_web_dashboard/pages/enquiry/widgets/enquiry_header.dart';
import 'package:flutter_web_dashboard/widgets/custom_widget.dart';

class Enquiry extends StatelessWidget {
  const Enquiry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            EnquiryHeaders(),
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
                  child: CustomWidgets().getButton(() {}, 'Start Conversation',
                      horizontalMargin: 30),
                ),
                Expanded(
                  flex: 2,
                  child: DocumentListing(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
