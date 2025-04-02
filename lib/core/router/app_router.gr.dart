// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:portfolio/features/home/presentation/screen/home_screen.dart'
    as _i1;
import 'package:portfolio/features/login/presentation/screen/login_screen.dart'
    as _i2;
import 'package:portfolio/features/project/presentation/screen/project_details_screen.dart'
    as _i3;
import 'package:portfolio/features/project/presentation/screen/project_entry_screen.dart'
    as _i4;
import 'package:portfolio/features/project/presentation/screen/project_list_screen.dart'
    as _i5;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginScreen();
    },
  );
}

/// generated route for
/// [_i3.ProjectDetailsScreen]
class ProjectDetailsRoute extends _i6.PageRouteInfo<void> {
  const ProjectDetailsRoute({List<_i6.PageRouteInfo>? children})
    : super(ProjectDetailsRoute.name, initialChildren: children);

  static const String name = 'ProjectDetailsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProjectDetailsScreen();
    },
  );
}

/// generated route for
/// [_i4.ProjectEntryScreen]
class ProjectEntryRoute extends _i6.PageRouteInfo<void> {
  const ProjectEntryRoute({List<_i6.PageRouteInfo>? children})
    : super(ProjectEntryRoute.name, initialChildren: children);

  static const String name = 'ProjectEntryRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProjectEntryScreen();
    },
  );
}

/// generated route for
/// [_i5.ProjectListScreen]
class ProjectListRoute extends _i6.PageRouteInfo<void> {
  const ProjectListRoute({List<_i6.PageRouteInfo>? children})
    : super(ProjectListRoute.name, initialChildren: children);

  static const String name = 'ProjectListRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProjectListScreen();
    },
  );
}
