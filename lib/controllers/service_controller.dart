import 'package:dio/dio.dart' as d;
import 'package:flutter_web_dashboard/constants/constants.dart';
import 'package:flutter_web_dashboard/models/DemoResponse.dart';
import 'package:flutter_web_dashboard/network/NetworkCall.dart';

import 'package:get/get.dart';

class ServiceController extends GetxController {
  var isLoading = true.obs;
  @override
  void onInit() {
    getCovidData().whenComplete(() => Future.delayed(Duration(seconds: 2))
        .then((value) => isLoading.value = false));
    super.onInit();
  }

  var page = 0.obs;
  var demoResponse = DemoResponse().obs;

  d.Response? response;

  final dio = d.Dio();

  Future<DemoResponse> getCovidData() async {
    isLoading.value = true;
    print(
        'https://api.instantwebtools.net/v1/passenger?page=${page.toString()}=0&size=10');
    response = await dio.get(
        'https://api.instantwebtools.net/v1/passenger?page=${page.toString()}=0&size=10');

    demoResponse.value = DemoResponse.fromJson(response!.data);

    print("API response " + response!.data.toString());

    print("Page number " + page.value.toString());

    return DemoResponse.fromJson(response!.data);
  }
}
