import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/helpers/theme_helper.dart';
import 'package:flutter_web_dashboard/widgets/CommonTextfield.dart';

class ChatListing extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      decoration: BoxDecoration(color: appTheme!.whiteColor),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Messages',
            style: appTheme!.text18BolddBlack,
          ),
          searchBox(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  chatItem(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      'Putri Tanjak',
                      'Assiap Mazessa',
                      false,
                      '4:30 Pm',
                      false,
                      context),
                  chatItem(
                      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      'Jenny Smith',
                      'Assiap Mazessa',
                      true,
                      '4:25 Pm',
                      true,
                      context),
                  chatItem(
                      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      'Jenny Smith',
                      'Assiap Mazessa',
                      false,
                      '4:25 Pm',
                      false,
                      context),
                  chatItem(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      'Putri Tanjak',
                      'Assiap Mazessa',
                      false,
                      '4:30 Pm',
                      false,
                      context),
                  chatItem(
                      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      'Jenny Smith',
                      'Assiap Mazessa',
                      true,
                      '4:25 Pm',
                      true,
                      context),
                  chatItem(
                      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      'Jenny Smith',
                      'Assiap Mazessa',
                      false,
                      '4:25 Pm',
                      false,
                      context),
                  chatItem(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      'Putri Tanjak',
                      'Assiap Mazessa',
                      false,
                      '4:30 Pm',
                      false,
                      context),
                  chatItem(
                      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      'Jenny Smith',
                      'Assiap Mazessa',
                      true,
                      '4:25 Pm',
                      true,
                      context),
                  chatItem(
                      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      'Jenny Smith',
                      'Assiap Mazessa',
                      false,
                      '4:25 Pm',
                      false,
                      context),
                  chatItem(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      'Putri Tanjak',
                      'Assiap Mazessa',
                      false,
                      '4:30 Pm',
                      false,
                      context),
                  chatItem(
                      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      'Jenny Smith',
                      'Assiap Mazessa',
                      true,
                      '4:25 Pm',
                      true,
                      context),
                  chatItem(
                      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      'Jenny Smith',
                      'Assiap Mazessa',
                      false,
                      '4:25 Pm',
                      false,
                      context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBox(BuildContext context) => Container(
        child: CommonTextfield(
          margin: 0,
          textFieldHeight: 40,
          label: '',
          textFieldWidth: ResponsiveWidget.isLargeScreen(context) ? 300 : 400,
          focusNode: _searchFocus,
          textOption: TextFieldOption(
              inputController: _searchController,
              fillColor: appTheme!.grey.withOpacity(0.05),
              prefixWid: Icon(Icons.search)),
        ),
      );

  Widget chatItem(
          String imagePath,
          String label,
          String lastMessage,
          bool isTyping,
          String time,
          bool hasUnseenMessage,
          BuildContext context) =>
      Container(
          height: 50,
          width: ResponsiveWidget.isLargeScreen(context) ? 300 : 360,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(imagePath),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: appTheme!.text12SemiBoldBlack,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(isTyping ? 'Typing...' : lastMessage,
                      style: isTyping
                          ? appTheme!.text9RegularGreen
                          : appTheme!.text9RegularGrey),
                ],
              ),
              SizedBox(
                width: ResponsiveWidget.isLargeScreen(context) ? 120 : 135,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    time,
                    style: appTheme!.text9RegularGrey,
                  ),
                  hasUnseenMessage
                      ? Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Text(
                            '2',
                            style: appTheme!.text8RegularWhite,
                          ),
                        )
                      : Container()
                ],
              ),
            ],
          ));
}
