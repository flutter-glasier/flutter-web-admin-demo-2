import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/theme_helper.dart';

import '../../../constants/style.dart';

class ClientProfile extends StatelessWidget {
  const ClientProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Client Profile',
            style: appTheme!.text16SemiBlack,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileDetailElement(
                  Icons.person_outline, 'Client Name:', 'Ketan Parikh'),
              profileDetailElement(
                  Icons.apartment_outlined, 'Address:', 'XYZ Street,Ahemdabad'),
              profileDetailElement(
                  Icons.phone_outlined, 'Mobile-Number:', '+91 XXXXXXXXXX'),
              profileDetailElement(
                  Icons.email_outlined, 'E-mail:', 'ketan@mail.com'),
              profileDetailElement(Icons.chat_outlined, 'Total-enquiry:', '50'),
            ],
          )
        ],
      ),
    );
  }

  Widget profileDetailElement(IconData icon, String label, String value) =>
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon),
            SizedBox(
              width: 5,
            ),
            Text(
              label,
              style: appTheme!.text14SemiBolddBlack,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              value,
              style: appTheme!.text14SemiGrey,
            )
          ],
        ),
      );
}
