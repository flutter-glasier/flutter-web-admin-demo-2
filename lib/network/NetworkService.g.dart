// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NetworkService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _NetworkService implements NetworkService {
  _NetworkService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.coinbase.com/v2/currencies';
  }

  final Dio _dio;

  String? baseUrl;

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
