import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lettutor_thaitran81/data/local/utils/SecureStorageUtils.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';

class DioClient {
  // dio instance
  final Dio _dio;

  // injecting dio instance
  DioClient(this._dio);

  Dio _getDio() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.receiveTimeout = Duration(minutes: 1).inMilliseconds;
      var token =
          await SecureStorageUtils.getValue(SecureStorageUtils.keyAuthToken);
      if (token != null) {
        if (kDebugMode) {
          print(("token :: $token"));
        }
        options.headers = {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8',
          'Authorization': "${AppConst.bearerToken} $token"
        };
      }

      if (kDebugMode) {
        print('Base Url : ${options.baseUrl}');
        print('End Point : ${options.path}');
        print('Method : ${options.method}');
        print('Data : ${options.data}');
      }

      return handler.next(options);
    }, onResponse: (response, handler) {
      if (kDebugMode) {
        print('response data : ${response.data}');
      }
      return handler.next(response);
    }, onError: (DioError e, handler) {
      if (kDebugMode) {
        print('Error Response : ${e.response}');
        print('Error message : ${e.message}');
        print('Error type : ${e.type.name}');
      }
      return handler.next(e);
    }));

    return _dio;
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _getDio().get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _getDio().post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _getDio().put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _getDio().delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
