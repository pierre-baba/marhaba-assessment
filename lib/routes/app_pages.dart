import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/modules/home/binding/home_binding.dart';
import 'package:marhaba_auctions_assessment/modules/home/view/home_view.dart';
import 'package:marhaba_auctions_assessment/modules/register/bindings/register_bindings.dart';
import 'package:marhaba_auctions_assessment/modules/register/view/register_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.register;

  static final routes = [
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
