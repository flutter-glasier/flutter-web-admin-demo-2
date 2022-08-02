import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../helpers/theme_helper.dart';

class EnquiryDescription extends StatelessWidget {
  const EnquiryDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enquiry Description',
            style: appTheme!.text16SemiBlack,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elementum dolor eget enim porttitor posuere maximus sit amet lectus. Proin et leo lectus. Aliquam ut diam ut risus laoreet egestas id scelerisque ex. Nullam a egestas augue. Fusce congue nunc ac eros posuere vulputate. Fusce posuere tempor mi, eu venenatis tellus mattis euismod. Nulla faucibus risus ex, eu gravida turpis mollis tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur magna mi, fermentum a nulla in, placerat consequat sem. Donec non euismod nunc.Ut aliquet pulvinar risus scelerisque porttitor. Aenean nec congue est. Proin et augue eu risus pharetra congue. Vivamus a scelerisque eros. Nunc id tellus erat. Fusce fermentum erat eros, nec placerat quam facilisis quis. Nam gravida libero lacinia velit rhoncus suscipit. Donec ut eros nec enim scelerisque dignissim. Vestibulum est libero, gravida eu dictum vitae, rutrum non neque. Vestibulum facilisis maximus erat, non ultricies sapien finibus a.',
            overflow: TextOverflow.visible,
            style: appTheme!.text14SemiGrey,
          ),
          SizedBox(
            height: 15,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int i) {
                return Text(
                  '\u2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  style: appTheme!.text14SemiGrey,
                );
              })
        ],
      ),
    );
  }
}
