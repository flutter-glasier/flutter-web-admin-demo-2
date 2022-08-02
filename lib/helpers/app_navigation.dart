import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/EditProfile/edit_profile.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:flutter_web_dashboard/utils/navigator.dart';

class AppNavigation {
  static final AppNavigation shared = AppNavigation();

  void logout() {
    NavigationUtilities.pushReplacementNamed(AuthenticationPage.route);
  }

  void visitEditProfile() {
    NavigationUtilities.pushReplacementNamed(EditProfile.route);
  }
}
