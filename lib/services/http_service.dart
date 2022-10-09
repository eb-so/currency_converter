import 'package:dio/dio.dart';

import '../app/app.logger.dart';
import '../enums/request_type.dart';

enum NetErrorType {
  none('-'),
  disconnected('There is no internet connection!'),
  timedOut('Connection timeout, please try again'),
  denied('You connecion is denied check if you are blocked from the website');

  const NetErrorType(this.errorMessage);

  final String errorMessage;
}

class HttpService {
  final _log = getLogger('HttpService');
  final dio = Dio();

  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _makeRequest<T>(
      url,
      requestType: RequestType.get,
      headers: headers,
      queryParameters: queryParameters,
    );
  }

  Future<Response<T>> post<T>(
    String url, {
    Map<String, dynamic>? payload,
    Map<String, dynamic>? headers,
  }) async {
    return _makeRequest<T>(
      url,
      requestType: RequestType.post,
      payload: payload,
      headers: headers,
    );
  }

  Future<Response<T>> put<T>(
    String url, {
    Map<String, dynamic>? payload,
    Map<String, dynamic>? headers,
  }) async {
    return _makeRequest<T>(
      url,
      requestType: RequestType.put,
      payload: payload,
      headers: headers,
    );
  }

  Future<Response<T>> patch<T>(
    String url, {
    Map<String, dynamic>? payload,
    Map<String, dynamic>? headers,
  }) async {
    return _makeRequest<T>(
      url,
      requestType: RequestType.patch,
      payload: payload,
      headers: headers,
    );
  }

  Future<Response<T>> delete<T>(
    String url, {
    Map<String, dynamic>? payload,
    Map<String, dynamic>? headers,
  }) async {
    return _makeRequest<T>(
      url,
      requestType: RequestType.delete,
      payload: payload,
      headers: headers,
    );
  }

  Future<Response<T>> _makeRequest<T>(
    String url, {
    required RequestType requestType,
    Map<String, dynamic>? payload,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      _log.v(
          'url "$url", requestType "$requestType", payload "$payload", requestHeaders: "$headers"');

      switch (requestType) {
        case RequestType.get:
          return dio.get<T>(
            url,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );

        case RequestType.post:
          return dio.post<T>(
            url,
            data: payload,
            options: Options(
              headers: headers,
            ),
          );

        case RequestType.put:
          return dio.put<T>(
            url,
            data: payload,
            options: Options(
              headers: headers,
            ),
          );

        case RequestType.patch:
          return dio.patch<T>(
            url,
            data: payload,
            options: Options(
              headers: headers,
            ),
          );

        case RequestType.delete:
          return dio.delete<T>(
            url,
            data: payload,
            options: Options(
              headers: headers,
            ),
          );

        default:
          return dio.get<T>(
            url,
            options: Options(
              headers: headers,
            ),
          );
      }
    } on DioError catch (error) {
      _log.e(error);
      _log.e(error.response);
      _log.e(error.message);
      rethrow;
    } catch (error) {
      _log.e(error);
      rethrow;
    }
  }
}
