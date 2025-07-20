import 'package:get/get.dart';
import 'package:getx_basics/presentation/controllers/auth_binding.dart';
import 'package:getx_basics/presentation/pages/auth/login_page.dart';
import 'package:getx_basics/presentation/pages/dashboard_page.dart';

class GetRoutes {
  static const login = '/login';
  static const dashboard = '/dashboard';
}

final List<GetPage> routes = [
  GetPage(
    name: GetRoutes.login, 
    page: () => LoginPage(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: GetRoutes.dashboard, 
    page: () => DashboardPage(),
    binding: AuthBinding(),
  ),
];