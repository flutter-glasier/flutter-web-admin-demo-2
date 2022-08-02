import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/buttons.dart';

import '../helpers/theme_helper.dart';

class CustomWidgets {
  Widget getButton(Function onPressed, String title,
      {double? verticalMargin,
      double? horizontalMargin,
      double? buttonHeight,
      double? buttonWidth}) {
    return Container(
        height: buttonHeight ?? 50,
        width: buttonWidth ?? 200,
        margin: EdgeInsets.symmetric(
            vertical: verticalMargin ?? 15, horizontal: horizontalMargin ?? 0),
        child: AppButton.flat(
          onTap: () {
            onPressed();
          },
          borderRadius: 10,
          fitWidth: true,
          backgroundColor: appTheme!.colorPrimary,
          text: title,
        ));
  }

  void showNotification(String message, BuildContext context) => showToast(
        message,
        context: context,
        animation: StyledToastAnimation.scale,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.center,
        animDuration: Duration(seconds: 1),
        duration: Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
      );

  final spinkit = SpinKitCubeGrid(
    color: active,
  );
}
