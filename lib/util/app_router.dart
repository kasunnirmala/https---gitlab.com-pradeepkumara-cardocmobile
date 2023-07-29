import 'package:auto_route/auto_route.dart';
import 'package:cardoc/util/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/otp',
          page: OTPRoute.page,
        ),
        AutoRoute(path: '/home_base', page: HomeBaseRoute.page, children: [
          AutoRoute(
            path: 'home',
            page: HomeRoute.page,
            initial: true,
          ),
          AutoRoute(
            path: 'company',
            page: CompanyRoute.page,
          ),
        ]),
      ];
}
