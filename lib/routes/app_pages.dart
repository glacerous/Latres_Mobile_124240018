import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/detail_controller.dart';
import '../controllers/favorite_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/root_controller.dart';
import '../views/detail_page.dart';
import '../views/login_page.dart';
import '../views/root_page.dart';
import 'app_routes.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.root,
      page: () => RootPage(),
      binding: RootBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
  ];
}