import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../constants/constants.dart';

part 'NetworkService.g.dart';

@RestApi(baseUrl: baseURL)
abstract class NetworkService {
  factory NetworkService(Dio dio) = _NetworkService;
}
