import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/translation/translations.dart';

class AppStrings {
  static String get validName => LocaleKeys.validName.tr;

  static String get company => LocaleKeys.company.tr;

  static String get noUsersFound => LocaleKeys.noUsersFound.tr;

  static String get usersList => LocaleKeys.usersList.tr;

  static String get passwordShouldBeMoreThan8Chars =>
      LocaleKeys.passwordShouldBeMoreThan8Chars.tr;

  static String get name => LocaleKeys.name.tr;

  static String get register => LocaleKeys.register.tr;

  static String get password => LocaleKeys.password.tr;

  static String get validEmail => LocaleKeys.validEmail.tr;

  static String get requiredField => LocaleKeys.requiredField.tr;

  static String get email => LocaleKeys.email.tr;

  static String get somethingWentWrong => LocaleKeys.somethingWentWrong.tr;

  static String get unauthenticated => LocaleKeys.unauthenticated.tr;

  static String get connectionError => LocaleKeys.connectionError.tr;

  static String get checkYourInternetConnection =>
      LocaleKeys.checkYourInternetConnection.tr;
}

class ApiPaths {
  static const String _baseDomain = 'https://jsonplaceholder.typicode.com';

  static String get domain => _baseDomain;

  static String baseUrl = domain;

  static const String users = "/users";
}

class AssetsPaths {
  static const splashLogo = "assets/images/splash_logo.svg";

  static const onBoarding1 = "assets/images/onboarding1.svg";

  static const onBoarding2 = "assets/images/onboarding2.svg";

  static const onBoarding3 = "assets/images/onboarding3.svg";

  static const icFavoritesUnSelected =
      "assets/images/ic_favorites_unselected.svg";

  static const icHome = "assets/images/ic_home_selected.svg";

  static const icMap = "assets/images/ic_map_selected.svg";

  static const icOrders = "assets/images/ic_orders_selected.svg";

  static const icProfile = "assets/images/ic_profile_selected.svg";

  static const icHomeUnSelected = "assets/images/ic_home_unselected.svg";

  static const icMapUnSelected = "assets/images/ic_map_unselected.svg";

  static const icOrdersUnSelected = "assets/images/ic_orders_unselected.svg";

  static const icProfileUnSelected = "assets/images/ic_profile_unselected.svg";

  static const icArrowRight = "assets/images/ic_arrow_right.svg";

  static const icArrowBack = "assets/images/ic_arrow_back.svg";

  static const icVerticalSep = "assets/images/ic_vertical_sep.svg";

  static const icFacebook = "assets/images/ic_facebook.svg";

  static const icGoogle = "assets/images/ic_google.svg";

  static const icHorizontalSep = "assets/images/ic_horizontal_sep.svg";

  static const icPin = "assets/images/ic_pin.svg";

  static const icRank = "assets/images/ic_rank.svg";

  static const icPrice = "assets/images/ic_price.svg";

  static const icCancel = "assets/images/ic_cancel.svg";

  static const icDone = "assets/images/ic_done.svg";

  static const icPlus = "assets/images/ic_plus.svg";

  static const icMinus = "assets/images/ic_minus.svg";

  static const icCall = "assets/images/ic_call.svg";

  static const icWhatsapp = "assets/images/ic_whatsapp.svg";

  static const icCheckboxSelected = "assets/images/ic_checkbox_selected.svg";
  static const icCheckboxUnSelected =
      "assets/images/ic_checkbox_unselected.svg";

  static const icEditProfile = "assets/images/ic_edit_profile.svg";
  static const icEditPassword = "assets/images/ic_reset_password.svg";
  static const icInviteFriend = "assets/images/ic_invite_friend.svg";
  static const icFavorites = "assets/images/ic_favorites.svg";
  static const icFeedback = "assets/images/ic_feedback.svg";
  static const icUserPrivacy = "assets/images/ic_privacy.svg";
  static const icSettings = "assets/images/ic_settings.svg";
  static const icAboutUs = "assets/images/ic_pin_profile.svg";

  static const icLoyalty = "assets/images/ic_loyalty.svg";

  static const icEdit = "assets/images/ic_edit.svg";

  static const icFilters = "assets/images/ic_filters.svg";

  static const icCheck = "assets/images/ic_check.svg";

  static const icShare = "assets/images/ic_share.svg";

  static const icLoyaltySquare = "assets/images/ic_loyalty_square.svg";

  static const icCart = "assets/images/ic_cart.svg";

  static const icStar = "assets/images/ic_star.svg";

  static const icFacebook2 = "assets/images/ic_facebook2.svg";
  static const icInstagram = "assets/images/ic_instagram.svg";

  static const icWarning = "assets/images/ic_warning.svg";

  static const icFailure = "assets/images/ic_failure.svg";

  static const icCash = "assets/images/ic_cash.svg";

  static const icCard = "assets/images/ic_card.svg";

  static const icPersonally = "assets/images/ic_personally.svg";
  static const icDrive = "assets/images/ic_drive.svg";

  static const icCheckboxWhite = "assets/images/ic_checkbox_white.svg";

  static const successOrder = "assets/images/ic_success_order.svg";

  static const icBritainFlag = "assets/images/ic_britain_flag.svg";

  static const icAEFlag = "assets/images/ic_ae_flag.svg";

  static const icLang = "assets/images/ic_language.svg";

  static const icMyVehicles = "assets/images/ic_my_car.svg";

  static const icTerms = "assets/images/ic_terms.svg";

  static const icTrash = "assets/images/ic_trash.svg";

  static const icArrowDown = "assets/images/ic_arrow_down.svg";

  static const icEmptySearch = "assets/images/ic_empty_search.svg";

  static const icEmptyHistory = "assets/images/ic_empty_history.svg";

  static const icEmptyOngoing = "assets/images/ic_empty_ongoing.svg";

  static const icApple = "assets/images/ic_apple.svg";
}

class AnimationsAssets {}

class StorageKeys {
  static const String storageUserProfile = 'user_storage';

  static const String keyUser = 'user';
  static const String keyToken = "token";
}
