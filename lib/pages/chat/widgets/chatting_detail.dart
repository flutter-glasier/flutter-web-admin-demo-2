import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/app.export.dart';
import 'package:flutter_web_dashboard/helpers/theme_helper.dart';
import 'package:flutter_web_dashboard/pages/chat/widgets/chat_message_listing.dart';

import '../../../constants/style.dart';

class ChatingDetail extends StatelessWidget {
  final TextEditingController chatController = TextEditingController();
  final FocusNode chatFocus = FocusNode();
  ChatingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          chatHeader(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ChatMessageListing(),
                  ChatMessageListing(),
                  ChatMessageListing(),
                  ChatMessageListing(),
                  ChatMessageListing(),
                  ChatMessageListing(),
                  ChatMessageListing(),
                  ChatMessageListing(),
                ],
              ),
            ),
          ),
          chatAction(context)
        ],
      ),
    );
  }

  Widget chatHeader(BuildContext context) => Container(
        // width: getPercentageWidth(70, context),
        decoration: BoxDecoration(color: appTheme!.whiteColor),
        // height: 50,
        child: ListTile(
          title: Text('Punki Takreja'),
          subtitle: Text('last seen at 8:00 AM'),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80  '),
          ),
          trailing: IconButton(
              onPressed: () {}, icon: Icon(Icons.more_horiz_outlined)),
        ),
      );

  Widget chatAction(BuildContext context) => Container(
        color: appTheme!.whiteColor,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: appTheme!.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              chatTextField(context),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
                  Image.asset(
                    'assets/images/attachment.png',
                    height: 20,
                    width: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 2,
                    height: 25,
                    decoration:
                        BoxDecoration(color: appTheme!.grey.withOpacity(0.2)),
                  ),
                  Image.asset(
                    'assets/images/send.png',
                    height: 20,
                    width: 20,
                  )
                ],
              )
            ],
          ),
        ),
      );

  Widget chatTextField(BuildContext context) => Container(
        height: 50,
        width: getPercentageWidth(40, context),
        child: TextField(
          controller: chatController,
          focusNode: chatFocus,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Type here...'),
        ),
      );
}
