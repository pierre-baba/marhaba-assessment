
import 'package:marhaba_auctions_assessment/data/models/general/error_model.dart';

import '../values/strings.dart';

class ApiError implements Exception {
  String? message;
  MultiErrorModel error;

  ApiError({String? message, required this.error})
      : message = message ?? error.message;
}

class UnAuthenticatedError extends ApiError {
  bool failedToRefreshToken;

  UnAuthenticatedError(
      this.failedToRefreshToken, MultiErrorModel multiErrorModel)
      : super(message: AppStrings.unauthenticated, error: multiErrorModel);
}
