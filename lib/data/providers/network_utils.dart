import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/exceptions/api_exceptions.dart';
import 'package:marhaba_auctions_assessment/core/exceptions/api_failure.dart';
import 'package:marhaba_auctions_assessment/core/exceptions/connetion_exception.dart';
import 'package:marhaba_auctions_assessment/core/values/enums.dart';
import 'package:marhaba_auctions_assessment/core/values/strings.dart';
import 'package:marhaba_auctions_assessment/data/models/general/error_model.dart';
import '../../core/exceptions/partial_success.dart';
import 'api_provider.dart';

typedef RetryFunction = Future<Response> Function();

class NetworkUtils {
  static Future<void> handleNoInternetConnection(
      {bool autoRetry = false,
      Duration duration = const Duration(seconds: 15)}) async {
    ConnectivityResult? status = Get.find<ApiRequests>().connectionStatus.value;
    if (status == null) return;
    DateTime start = DateTime.now();
    switch (status) {
      case ConnectivityResult.none:
        if (autoRetry) {
          await waitWhile(() =>
              Get.find<ApiRequests>().connectionStatus.value ==
                  ConnectivityResult.none &&
              DateTime.now().difference(start) < duration);
          status = Get.find<ApiRequests>().connectionStatus.value;
          if (status == ConnectivityResult.none) {
            throw InternetConnectionError();
          }
          return;
        } else {
          throw InternetConnectionError();
        }
      default:
        return;
    }
  }

  static Future<Response> makeRequest(
      {required ApiMethod method,
      required String url,
      required headers,
      required query,
      required GetConnect connect,
      required body}) async {
    Response response;
    switch (method) {
      case ApiMethod.post:
        response =
            await connect.post(url, body, headers: headers, query: query);
        break;
      case ApiMethod.get:
        response = await connect.get(url, headers: headers, query: query);
        break;
      case ApiMethod.delete:
        response = await connect.delete(url, headers: headers, query: query);
        break;
      case ApiMethod.put:
        response = await connect.put(url, body, headers: headers, query: query);
        break;
    }
    return response;
  }

  static Future<Response> handleResponse(Response response,
      {bool handleUnauthorized = true,
      RetryFunction? retryFunction,
      bool logoutOnRefreshTokenFail = true,
      bool informUserOnRefreshTokenFail = true,
      int tries = 1}) async {
    if (kDebugMode) {
      print('Response unauthorized: ${response.unauthorized}');
    }
    if (response.bodyString == null && retryFunction != null) {
      response = await _handleBodyIsNull(response,
          retryFunction: retryFunction, tries: tries);
    }
    if (response.isOk && response.statusCode == 206) {
      throw PartialSuccess(
          message: response.body["message"], response: response);
    }
    if (response.isOk) return response;
    if (response.unauthorized) {
      if (handleUnauthorized) {

      } else {
        if (kDebugMode) {
          print('unauth thrown');
        }
        throw UnAuthenticatedError(
            true,
            MultiErrorModel.fromJson(
              jsonDecode(response.bodyString!),
              code: response.statusCode,
              statusText: response.bodyString!,
            ));
        //throw UnAuthenticatedError(false);
      }
    }
    if (response.bodyString != null) {
      throw ApiError(
          error: MultiErrorModel.fromJson(
        jsonDecode(response.bodyString!),
        code: response.statusCode,
        statusText: response.bodyString!,
      ));
    } else {
      throw ApiFailure(error: AppStrings.somethingWentWrong);
    }
  }

  static Future waitWhile(bool Function() function,
      [Duration pollInterval = Duration.zero]) {
    var completer = Completer();
    check() {
      if (!function()) {
        completer.complete();
      } else {
        Timer(pollInterval, check);
      }
    }

    check();
    return completer.future;
  }

  static Future<Response> _handleBodyIsNull(Response response,
      {required RetryFunction retryFunction, int tries = 1}) async {
    for (int i = 0; i < tries; i++) {
      try {
        if (kDebugMode) {
          print('retry ${i + 1} from $tries');
        }
        var v = await retryFunction();
        if (v.body != null) return v;
      } catch (e, s) {
        throw ApiFailure(error: e, stackTrace: s);
      }
    }
    return response;
  }
}
