import 'package:flutter_web_dashboard/helpers/app_navigation.dart';
import 'package:flutter_web_dashboard/network/ServiceModule.dart';
import 'package:kiwi/kiwi.dart';

import '../utils/custom_dialog.dart';
import '../utils/connectivity_service.dart';
import '../utils/pref_utils.dart';

part "app_module.g.dart";

abstract class AppModule {
  @Register.singleton(ConnectivityService)
  @Register.singleton(PrefUtils)
  @Register.singleton(ServiceModule)
  @Register.singleton(AppNavigation)
  @Register.singleton(CustomDialogs)
  void configure();
}

void setup() {
  var appModule = _$AppModule();
  appModule.configure();
}
