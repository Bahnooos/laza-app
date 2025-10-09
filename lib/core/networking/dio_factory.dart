import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/constants.dart';
import '../helpers/shared_pref_helper.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio getDio() {
    Duration timeOut = Duration(seconds: 30);
    if (dio == null) {
      dio = Dio(BaseOptions(connectTimeout: timeOut, receiveTimeout: timeOut));
      addHeader();
      addInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addHeader() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getSecureData(key: Constants.accessToken)}',
    };
  }

  static void addInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
