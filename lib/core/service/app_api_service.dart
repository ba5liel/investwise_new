import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:investwise_new/core/modal/response/api_response.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:get/get.dart';

import 'package:investwise_new/core/service/app_setting_service.dart';
import 'package:investwise_new/core/exceptions/app_http_exceptions.dart';

class AppApiService extends GetxService {
  late dio.Dio _dio;
  final AppSettingService _appSettingService = Get.find<AppSettingService>();
  final AuthService _appAuthService = Get.find<AuthService>();

  AppApiService() {
    _dio = dio.Dio(
        dio.BaseOptions(baseUrl: '${_appSettingService.config.baseURL}/'));
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  Future<APIResponse<T>> post<T>(String path,
      {required dynamic data,
      Map<String, dynamic>? queryParameters,
      dio.Options? options}) async {
    try {
      dio.Response<Map> response = await _dio.post<Map>(path,
          data: data, queryParameters: queryParameters, options: options);
      if (response.data == null) throw NullHTTPReponseException(path, data);
      return APIResponse<T>.fromMap(Map<String, dynamic>.from(response.data!));
    } on dio.DioException catch (e) {
      log(e.toString());
      throw _handleDioError(e);
    } on SocketException catch (e) {
      throw UnknownHttpException('Pre error:', e.toString());
    }
  }

  Future<APIResponse<T>> get<T>(String path,
      {required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters,
      dio.Options? options}) async {
    try {
      dio.Response<Map> response = await _dio.get<Map>(path,
          data: data, queryParameters: queryParameters, options: options);
      if (response.data == null) throw NullHTTPReponseException(path, data);
      return APIResponse<T>.fromMap(Map<String, dynamic>.from(response.data!));
    } on dio.DioException catch (e) {
      throw _handleDioError(e);
    } on SocketException catch (e) {
      throw UnknownHttpException('Pre error:', e.toString());
    }
  }

  Future<APIResponse<T>> authPost<T>(String path,
      {required dynamic data,
      Map<String, dynamic>? queryParameters,
      dio.Options? options}) async {
    return await post(path,
        data: data,
        options: options == null
            ? dio.Options(
                headers: {'Authorization': 'Bearer ${_appAuthService.token}'})
            : dio.Options(headers: {
                ...(options.headers ?? {}),
                'Authorization': 'Bearer ${_appAuthService.token}'
              }));
  }

  Future<APIResponse<T>> authGet<T>(String path,
      {required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters,
      dio.Options? options}) async {
    return await get(path,
        data: data,
        // ignore: prefer_if_null_operators
        options: options == null
            ? dio.Options(
                headers: {'Authorization': 'Bearer ${_appAuthService.token}'})
            : dio.Options(headers: {
                ...(options.headers ?? {}),
                'Authorization': 'Bearer ${_appAuthService.token}'
              }));
  }

  HttpException _handleDioError(dio.DioException e) {
    switch (e.response?.statusCode) {
      case 400:
        return BadRequestException(null, e.response?.data);
      case 401:
        return UnauthorizedException(null, e.response?.data);
      case 403:
        return ForbiddenException(null, e.response?.data);
      case 404:
        return NotFoundException(null, e.response?.data);
      case 500:
        return InternalServerError(null, e.response?.data);
      case 502:
        return BadGatewayError(null, e.response?.data);
      case 503:
        return ServiceUnavailableError(null, e.response?.data);
      case 504:
        return GatewayTimeoutError(null, e.response?.data);

      default:
        return UnknownHttpException(
            'Unknown error: ${e.response?.statusCode}', e.response?.data);
    }
  }
}
