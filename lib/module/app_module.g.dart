// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_module.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$AppModule extends AppModule {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => ConnectivityService())
      ..registerSingleton((c) => PrefUtils())
      ..registerSingleton((c) => ServiceModule())
      ..registerSingleton((c) => AppNavigation())
      ..registerSingleton((c) => CustomDialogs());
  }
}
