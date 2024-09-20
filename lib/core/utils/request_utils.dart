import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/exceptions/api_exceptions.dart';
import 'package:marhaba_auctions_assessment/core/exceptions/api_failure.dart';
import 'package:marhaba_auctions_assessment/core/exceptions/partial_success.dart';
import 'package:marhaba_auctions_assessment/core/utils/notifier.dart';
import 'package:marhaba_auctions_assessment/core/values/strings.dart';
import 'package:marhaba_auctions_assessment/data/providers/api_provider.dart';

import 'navigator.dart';

typedef RequestCallback = Future Function();

class RequestUtils {
  static Future<void> handle({
    required RequestCallback request,
    VoidCallback? success,
    Function(Response)? partialSuccess,
    Function(int?)? error,
    VoidCallback? failure,
    VoidCallback? unauthorized,
    bool showUnAuthSnackBar = true,
    bool showErrorSnackBar = true,
    bool showFailureSnackBar = true,
    List<RxBool> loaders = const [],
    RxBool? errorOccurred,
    RxString? errorMessage,
    RxMap<String, String>? errors,
    bool blockingLoader = false,
    bool handleUnAuth = true,
  }) async {
    try {
      if (errorOccurred != null && errorMessage != null) {
        errorOccurred(false);
        errorMessage("");
      }
      for (var element in loaders) {
        element(true);
      }
      if (blockingLoader) {
        Notifier.showLoader();
      }
      await request();
      if (blockingLoader) {
        Notifier.dismissLoader();
      }
      if (success != null) {
        success();
      }
      if (errorOccurred != null) {
        errorOccurred(false);
      }
    } on PartialSuccess catch (e) {
      if (partialSuccess != null) {
        partialSuccess(e.response);
      }
    } on UnAuthenticatedError catch (e) {
      if (kDebugMode) {
        print('unauth......');
      }
      if (handleUnAuth) {
        AppNavigator.exitAllThenToRegister();
        if (showUnAuthSnackBar) {
          Notifier.showSnackBar(e.error.message!, error: true);
        }
      } else {
        if (showUnAuthSnackBar) {
          Notifier.showSnackBar(
            AppStrings.unauthenticated,
          );
        }
        if (unauthorized != null) {
          unauthorized();
        }
      }
    } on ApiError catch (e) {
      if (kDebugMode) {
        print('api error......${e.error.errors}');
      }
      if (blockingLoader) {
        Notifier.dismissLoader();
      }
      if (showErrorSnackBar && e.message != "hide") {
        Notifier.showSnackBar(
            e.message ?? e.error.message ?? AppStrings.somethingWentWrong,
            error: true);
      }
      if (errors != null && e.error.errors != null) {
        errors(e.error.errors);
      }
      if (errorOccurred != null && errorMessage != null) {
        errorOccurred(true);
        errorMessage(
            e.message ?? e.error.message ?? AppStrings.somethingWentWrong);
      }
      if (error != null) {
        error(e.error.code);
      }
    } on ApiFailure catch (e) {
      if (kDebugMode) {
        print("api failure .....");
      }
      if (showFailureSnackBar) {
        Notifier.showSnackBar(
            kDebugMode ? e.toString() : AppStrings.somethingWentWrong,
            error: true);
      }
      if (errorOccurred != null && errorMessage != null) {
        errorOccurred(true);
        errorMessage(
          kDebugMode
              ? e.toString()
              : Get.find<ApiRequests>().connectionStatus.value !=
                      ConnectivityResult.none
                  ? AppStrings.checkYourInternetConnection
                  : AppStrings.somethingWentWrong,
        );
      }
      if (failure != null) {
        failure();
      }
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(stacktrace);
        print(e);
      }
      if (showFailureSnackBar) {
        Notifier.showSnackBar(
            kDebugMode ? e.toString() : AppStrings.somethingWentWrong,
            error: true);
      }
      if (errorOccurred != null && errorMessage != null) {
        errorOccurred(true);
        errorMessage(kDebugMode ? e.toString() : AppStrings.somethingWentWrong);
      }
      if (failure != null) {
        failure();
      }
    } finally {
      for (var element in loaders) {
        element(false);
      }
    }
  }
}
