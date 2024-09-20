import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/base/api.dart';
import 'package:marhaba_auctions_assessment/core/exceptions/api_exceptions.dart';
import 'package:marhaba_auctions_assessment/data/models/general/error_model.dart';

import '../../core/values/enums.dart';
import '../../core/values/strings.dart';
import '../models/home/user_model.dart';
import 'network_utils.dart';

class ApiRequests extends GetConnect {
  ApiRequests();

  late StreamSubscription subscription;
  Rx<ConnectivityResult?> connectionStatus = Rx(null);

  final Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  Map<String, String> getHeaders(ApiMethod method) {
    Map<String, String> h = Map.from(headers);
    if (method == ApiMethod.get) {
      h["Content-Type"] = "*/*";
    }
    h["Accept-Language"] = Get.locale!.languageCode;

    // var token = UserStorage.readToken();
    // if (token != null) {
    //   h["Authorization"] = "Bearer $token";
    // }

    return h;
  }

  @override
  void onInit() {
    httpClient.timeout = const Duration(minutes: 5);
    super.onInit();
    initConnectivity();
  }

  void initConnectivity() async {
    connectionStatus(await Connectivity().checkConnectivity());
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (kDebugMode) {
        print(result);
      }
      connectionStatus(result);
    });
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }

  Future<Response> _makeRequest(
    String path,
    ApiMethod method, {
    ApiBody? body,
    String? fullPath,
    int tries = 5,
    Map<String, String>? query,
    bool retryAfterNoConnection = true,
    bool handleUnAuthentication = false,
    bool informUserOnRefreshTokenFail = true,
    bool logoutOnRefreshTokenFail = true,
    Duration waitUntilThereIsConnection = const Duration(seconds: 5),
    bool specialValidate = false,
  }) async {
    Map<String, String> headers = getHeaders(method);
    Map<String, dynamic> query0 = query ?? {};
    if (body != null) {
      if (body.validate(specialValidate).isNotEmpty) {
        throw ApiError(
            message: "hide",
            error:
                MultiErrorModel.fromValidator(body.validate(specialValidate)));
      }
    }
    dynamic body0 = body?.toJson() ?? {};

    String url = fullPath ?? (ApiPaths.baseUrl + path);
    if (kDebugMode) {
      print('url $url');
      developer.log('headers $headers');
      print('query $query0');
      print('body $body0');
    }

    await NetworkUtils.handleNoInternetConnection(
        autoRetry: retryAfterNoConnection,
        duration: waitUntilThereIsConnection);
    Response response = await NetworkUtils.makeRequest(
        method: method,
        url: url,
        headers: headers,
        query: query0,
        connect: this,
        body: body0);
    if (kDebugMode) {
      print('response for url $url');
      developer.log('response body string${response.bodyString}');
      print('response status ${response.status}');
      print('response status code${response.statusCode}');
      print('response status text ${response.statusText}');
    }
    response = await NetworkUtils.handleResponse(
      response,
      tries: tries,
      handleUnauthorized: handleUnAuthentication,
      informUserOnRefreshTokenFail: informUserOnRefreshTokenFail,
      logoutOnRefreshTokenFail: logoutOnRefreshTokenFail,
      retryFunction: () => NetworkUtils.makeRequest(
        method: method,
        url: url,
        headers: headers,
        query: query0,
        connect: this,
        body: body0,
      ),
    );

    return response;
  }

  Future<List<UserModel>> getUsersList() async {
    Response res = await _makeRequest(
      ApiPaths.users,
      ApiMethod.get,
    );
    return List.from(res.body.map((e) => UserModel.fromJson(e)));
  }
}
