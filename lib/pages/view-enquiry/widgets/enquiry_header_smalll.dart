import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/theme_helper.dart';

class EnquiryHeadersSmall extends StatelessWidget {
  const EnquiryHeadersSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: appTheme!.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: appTheme!.grey.withOpacity(0.3), width: 0.3),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: appTheme!.grey.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: Image.asset(
                  'assets/images/computer.png',
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                'ABC210-Want to know more about food delivery Mobile App development',
                style: appTheme!.text14SemiBolddBlack,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.location_city,
                  color: appTheme!.grey.withOpacity(0.5),
                ),
                Flexible(
                  child: Text(
                    'Prahlad Nagar,Ahemdabad | Created Date:20 Dec ,2021 | Due Date :20 Dec , 2021',
                    style: appTheme!.text14SemiGrey,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
