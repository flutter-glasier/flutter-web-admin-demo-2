import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/EditProfile/edit_profile.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:flutter_web_dashboard/pages/clients/clients.dart';
import 'package:flutter_web_dashboard/pages/drivers/drivers.dart';
import 'package:flutter_web_dashboard/pages/overview/overview.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/utils/fade_route.dart';

class NavigationUtilities {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  /// A convenience method to push a new [MaterialPageRoute] to the [Navigator].
  static void push(Widget widget, {String? name}) {
    key.currentState!.push(MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: name),
    ));
  }

  /// A convenience method to push a new [route] to the [Navigator].
  static Future<dynamic> pushRoute(String route,
      {RouteType type = RouteType.fade, Map? args}) async {
    if (args == null) {
      args = Map<String, dynamic>();
    }
    args["routeType"] = type;
    return await key.currentState!.pushNamed(route, arguments: args);
  }

  /// A convenience method to push a named replacement route.
  static void pushReplacementNamed(String route,
      {RouteType type = RouteType.fade, Map? args}) {
    if (args == null) {
      args = Map<String, dynamic>();
    }
    args["routeType"] = type;

    key.currentState!.pushReplacementNamed(
      route,
      arguments: args,
    );
  }

  /// Returns a [RoutePredicate] similar to [ModalRoute.withName] except it
  /// compares a list of route names.
  ///
  /// Can be used in combination with [Navigator.pushNamedAndRemoveUntil] to
  /// pop until a route has one of the name in [names].
  static RoutePredicate namePredicate(List<String> names) {
    return (route) =>
        !route.willHandlePopInternally &&
        route is ModalRoute &&
        (names.contains(route.settings.name));
  }
}

enum RouteType {
  defaultRoute,
  fade,
  slideIn,
}

Route<dynamic> generateRoute(RouteSettings settings) {
  print(settings.name);
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case driversPageRoute:
      return _getPageRoute(DriversPage());
    case clientsPageRoute:
      return _getPageRoute(ClientsPage());
    case editProfileRoute:
      return _getPageRoute(EditProfile());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

/// [onGenerateRoute] is called whenever a new named route is being pushed to
/// the app.
///
/// The [RouteSettings.arguments] that can be passed along the named route
/// needs to be a `Map<String, dynamic>` and can be used to pass along
/// arguments for the screen.
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final routeName = settings.name;
  final arguments = settings.arguments as Map<String, dynamic>? ?? {};
  final routeType =
      arguments["routeType"] as RouteType? ?? RouteType.defaultRoute;

  late Widget screen;

  switch (routeName) {
    case AuthenticationPage.route:
      screen = AuthenticationPage();
      break;
    case EditProfile.route:
      screen = EditProfile();
      break;
  }

  switch (routeType) {
    case RouteType.fade:
      return FadeRoute(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName),
      );
    case RouteType.defaultRoute:
    default:
      return MaterialPageRoute(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName),
      );
  }
}
