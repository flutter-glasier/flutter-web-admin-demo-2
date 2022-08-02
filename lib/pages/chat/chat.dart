import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/app.export.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/chat/widgets/chat_listing.dart';
import 'package:flutter_web_dashboard/pages/chat/widgets/chatting_detail.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 1, child: ChatListing()),
          if (ResponsiveWidget.isLargeScreen(context))
            Expanded(flex: 3, child: ChatingDetail())
        ],
      ),
    );
  }
}
