import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/menu_controller.dart';
import 'package:flutter_web_dashboard/controllers/navigation_controller.dart';
import 'package:flutter_web_dashboard/widgets/layout.dart';
import 'package:flutter_web_dashboard/pages/404/error.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

import 'helpers/theme_helper.dart';
import 'routing/routes.dart';

late KiwiContainer app;
void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: appTheme!.colorPrimary, // navigation bar color
    statusBarColor: appTheme!.colorPrimary, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: authenticationPageRoute,
      unknownRoute: GetPage(
          name: '/not-found',
          page: () => PageNotFound(),
          transition: Transition.fadeIn),
      getPages: [
        GetPage(
            name: rootRoute,
            page: () {
              return SiteLayout();
            }),
        GetPage(
            name: authenticationPageRoute, page: () => AuthenticationPage()),
      ],
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.blue,
      ),
      // home: AuthenticationPage(),
      builder: _builder,
    );
  }
}

// import 'dart:io';

// import 'package:bucks_borrower/app/constant/FontConstant.dart';
// import 'package:bucks_borrower/components/Screens/FeatureScreen/BottomNavBar.dart';
// import 'package:bucks_borrower/components/Screens/FeatureScreen/HomeScreen.dart';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:kiwi/kiwi.dart';
// import 'package:month_year_picker/month_year_picker.dart';

// import 'app/app.export.dart';
// import 'app/theme/ThemeSetting.dart';
// import 'app/theme/global_models_provider.dart';
// import 'app/theme/settings_models_provider.dart';
// import 'app/utils/route_observer.dart';
// import './app/utils/pallet.dart';

// import 'package:flutter_localizations/flutter_localizations.dart';

// late KiwiContainer app;

// TextDirection deviceTextDirection = TextDirection.ltr;

// void main() {
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     systemNavigationBarColor: appTheme!.splashBgColor, // navigation bar color
//     statusBarColor: appTheme!.splashBgColor, // status bar color
//   ));
//   if (kDebugMode && ApiConstants.apiLog) {
//     rootBundle
//         .load('assets/chls.pem')
//         .then((value) => {
//               if (value != null)
//                 {
//                   SecurityContext.defaultContext
//                       .setTrustedCertificatesBytes(value.buffer.asUint8List())
//                 }
//             })
//         .catchError((object) => {print(object)});
//   }
//   WidgetsFlutterBinding.ensureInitialized();
//   app = KiwiContainer();
//   setup();

//   runApp(SettingsModelsProvider(
//     child: GlobalModelsProvider(
//       child: StreamBuilder<String>(
//           stream: ThemeHelper.appthemeString,
//           builder: (context, snapshot) {
//             return Base();
//           }),
//     ),
//   ));
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
// }

// class Base extends StatefulWidget {
//   @override
//   _BaseState createState() => _BaseState();
// }

// class _BaseState extends State<Base> {
//   ThemeData? themeData;

//   @override
//   void initState() {
//     super.initState();
//     ThemeHelper.changeTheme("white");

//     WidgetsBinding.instance!.addPostFrameCallback(
//       (_) => setState(() {
//         themeData = AppTheme.of(context).theme;
//       }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: APPNAME,
//       localizationsDelegates: [
//         GlobalWidgetsLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         MonthYearPickerLocalizations.delegate,
//       ],
//       // theme: themeData,
//       theme: ThemeData(
//         // Define the default brightness and colors.
//         brightness: Brightness.light,
//         primaryColor: appTheme!.colorPrimary,
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         fontFamily: Regular,
//         cursorColor: appTheme!.colorPrimary,

//         buttonColor: appTheme!.colorPrimary,
//         // primaryColorDark: appTheme.colorPrimary,
//         primarySwatch: Palette.kToDark,

//         backgroundColor: appTheme!.colorPrimary,
//         accentColor: appTheme!.colorPrimary,

//         buttonTheme: ButtonThemeData(
//             textTheme: ButtonTextTheme.primary,

//             // textTheme: ButtonTextTheme.normal,
//             colorScheme: ColorScheme.dark(),
//             buttonColor: appTheme!.colorPrimary,
//             highlightColor: appTheme!.colorPrimary,
//             focusColor: appTheme!.colorPrimary),
//       ),
//       navigatorKey: NavigationUtilities.key,
//       onGenerateRoute: onGenerateRoute,
//       navigatorObservers: [routeObserver],
//       home: BottomNavBar(),
//       routes: <String, WidgetBuilder>{
//         '/ThemeSetting': (BuildContext context) => ThemeSetting(),
//         // '/': (BuildContext context) => SignUp()
//       },
//       builder: _builder,
//     );
//   }

Widget _builder(BuildContext context, Widget? child) {
  return Column(
    children: <Widget>[
      Expanded(child: child!),
    ],
  );
}
