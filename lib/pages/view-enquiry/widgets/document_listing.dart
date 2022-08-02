import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../helpers/theme_helper.dart';

class DocumentListing extends StatelessWidget {
  DocumentListing({Key? key}) : super(key: key);

  List<String> imagePath = [
    // 'assets/images/document.png',
    'assets/images/pdf.png',
    'assets/images/xls.png'
  ];

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('File Attachment'),
          ListView.builder(
              shrinkWrap: true,
              itemCount: imagePath.length,
              itemBuilder: (BuildContext context, int i) {
                return documentItem(
                    imagePath[i], 'Document ${i + 1} .png', '24 March 2021');
              })
        ],
      ),
    );
  }

  Widget documentItem(String imagePath, String label, String date) => Container(
        child: ListTile(
          leading: Image.asset(
            imagePath,
            height: 35,
            width: 34,
          ),
          title: Text(label),
          subtitle: Text(date),
        ),
      );
}
