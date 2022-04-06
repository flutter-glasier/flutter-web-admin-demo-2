import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/theme_helper.dart';

class NotificationDialog extends StatelessWidget {
  NotificationDialog({Key? key}) : super(key: key);
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: DefaultTabController(
        length: 3,
        child: Container(
          height: 300,
          width: 400,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 12,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            )
          ]),
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notifications',
                    style: appTheme!.text24BoldBlack,
                  ),
                  Text(
                    'Mark all as read',
                    style: TextStyle(
                      shadows: [
                        Shadow(color: Colors.black, offset: Offset(0, -5))
                      ],
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      decorationThickness: 2,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
                child: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: active,
                  labelStyle: appTheme!.text14SemiBolddBlack,
                  tabs: [
                    Tab(
                      icon: Text('All'),
                    ),
                    Tab(
                      icon: Text('New'),
                    ),
                    Tab(
                      icon: Text('Archive'),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TabBarView(
                  children: [
                    // first tab bar view widget
                    Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        child: ListView.separated(
                            controller: _scrollController,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                endIndent: 10,
                                indent: 20,
                              );
                            },
                            itemCount: 10,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) => ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.orange.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    height: 50,
                                    width: 35,
                                    child: Text(
                                      'JR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  title: Text(
                                    'New enquiry created !',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    '2h ago',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )))),

                    // second tab bar viiew widget
                    Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        child: ListView.separated(
                            controller: _scrollController,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                endIndent: 10,
                                indent: 20,
                              );
                            },
                            itemCount: 10,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) => ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.orange.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    height: 50,
                                    width: 35,
                                    child: Text(
                                      'JR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  title: Text(
                                    'New enquiry created !',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    '2h ago',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )))),

                    Container(
                      child: Center(
                        child: Text(
                          'Nothing to show here',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
