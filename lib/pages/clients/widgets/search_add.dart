import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_web_dashboard/pages/clients/widgets/new_client_form.dart';
import 'package:flutter_web_dashboard/utils/math_utils.dart';
import 'package:flutter_web_dashboard/widgets/custom_widget.dart';

import '../../../helpers/theme_helper.dart';

class SearchAndAdded extends StatelessWidget {
  SearchAndAdded({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
        color: appTheme!.whiteColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: TextFormField(
              controller: _searchController,
              focusNode: _searchFocus,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
                hintText: 'Search here',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: CustomWidgets().getButton(() {
                _showAttach(context);
              }, 'Add New'))
        ],
      ),
    );
  }

  void _showAttach(BuildContext ctx) {
    // var attachDialog = (BuildContext context) {
    //   SmartDialog.showAttach(
    //     targetContext: context,
    //     isPenetrateTemp: true,
    //     alignmentTemp: Alignment.topCenter,
    //     useSystem: true,
    //     widget: Container(width: 100, height: 100, color: Colors.red),
    //   );
    // };

    //target widget
    SmartDialog.show(
      alignmentTemp: Alignment.centerRight,
      isLoadingTemp: false,
      useSystem: true,
      widget: Container(
        height: double.infinity,
        width: 500,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: Builder(builder: (context) {
          return NewClientForm();
        }),
      ),
    );
  }
}
