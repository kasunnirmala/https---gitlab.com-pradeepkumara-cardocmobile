// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:cardoc/pages/company/company_screen.dart' as _i5;
import 'package:cardoc/pages/home/home/home_screen.dart' as _i1;
import 'package:cardoc/pages/home_base/home_base.dart' as _i2;
import 'package:cardoc/pages/login/login/login_screen.dart' as _i4;
import 'package:cardoc/pages/login/otp/otp_screen.dart' as _i3;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    HomeBaseRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeBaseScreen(),
      );
    },
    OTPRoute.name: (routeData) {
      return _i6.AutoRoutePage<String>(
        routeData: routeData,
        child: const _i3.OTPScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    CompanyRoute.name: (routeData) {
      final args = routeData.argsAs<CompanyRouteArgs>(
          orElse: () => const CompanyRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CompanyScreen(
          key: args.key,
          isEditable: args.isEditable,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeBaseScreen]
class HomeBaseRoute extends _i6.PageRouteInfo<void> {
  const HomeBaseRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeBaseRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OTPScreen]
class OTPRoute extends _i6.PageRouteInfo<void> {
  const OTPRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OTPRoute.name,
          initialChildren: children,
        );

  static const String name = 'OTPRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CompanyScreen]
class CompanyRoute extends _i6.PageRouteInfo<CompanyRouteArgs> {
  CompanyRoute({
    _i7.Key? key,
    bool isEditable = false,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CompanyRoute.name,
          args: CompanyRouteArgs(
            key: key,
            isEditable: isEditable,
          ),
          initialChildren: children,
        );

  static const String name = 'CompanyRoute';

  static const _i6.PageInfo<CompanyRouteArgs> page =
      _i6.PageInfo<CompanyRouteArgs>(name);
}

class CompanyRouteArgs {
  const CompanyRouteArgs({
    this.key,
    this.isEditable = false,
  });

  final _i7.Key? key;

  final bool isEditable;

  @override
  String toString() {
    return 'CompanyRouteArgs{key: $key, isEditable: $isEditable}';
  }
}
