import 'package:dio/dio.dart' as d;
import 'package:flutter_web_dashboard/models/DemoResponse.dart';
import 'package:flutter_web_dashboard/models/StaffResponse.dart';

import 'package:get/get.dart';

class ServiceController extends GetxController {
  var isLoading = true.obs;
  @override
  void onInit() {
    getDummyData().whenComplete(() {
      Future.delayed(Duration(seconds: 2))
          .then((value) => isLoading.value = false);
    });
    getFakeUsersData().whenComplete(() {
      Future.delayed(Duration(seconds: 2))
          .then((value) => isLoading.value = false);
    });

    super.onInit();
  }

  var page = 0.obs;
  var demoResponse = DemoResponse().obs;
  var fakeUserResponse = StaffResponse().obs;

  d.Response? response;

  final dio = d.Dio();

  Future<DemoResponse> getDummyData() async {
    isLoading.value = true;

    response = await dio.get(
        'https://api.instantwebtools.net/v1/passenger?page=${page.toString()}=0&size=10');

    demoResponse.value = DemoResponse.fromJson(response!.data);

    return DemoResponse.fromJson(response!.data);
  }

  Future<StaffResponse> getFakeUsersData() async {
    isLoading.value = true;

    print('Gets called');

    response = await dio.get('https://randomuser.me/api/');

    fakeUserResponse.value = StaffResponse.fromJson(response!.data);

    return StaffResponse.fromJson(response!.data);
  }
}
