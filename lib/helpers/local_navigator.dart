import 'package:flutter/cupertino.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';

import 'package:flutter_web_dashboard/routing/routes.dart';

import '../utils/navigator.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: authenticationPageRoute,
    );
