// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_routes.dart';

/// generated route for
/// [CoachProfileScreenPage]
class CoachProfileScreenRoute
    extends PageRouteInfo<CoachProfileScreenRouteArgs> {
  CoachProfileScreenRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
         CoachProfileScreenRoute.name,
         args: CoachProfileScreenRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'CoachProfileScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CoachProfileScreenRouteArgs>();
      return CoachProfileScreenPage(key: args.key, id: args.id);
    },
  );
}

class CoachProfileScreenRouteArgs {
  const CoachProfileScreenRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'CoachProfileScreenRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CoachProfileScreenRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [HomeScreenPage]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute({List<PageRouteInfo>? children})
    : super(HomeScreenRoute.name, initialChildren: children);

  static const String name = 'HomeScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreenPage();
    },
  );
}

/// generated route for
/// [SignInScreenPage]
class SignInScreenRoute extends PageRouteInfo<void> {
  const SignInScreenRoute({List<PageRouteInfo>? children})
    : super(SignInScreenRoute.name, initialChildren: children);

  static const String name = 'SignInScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignInScreenPage();
    },
  );
}

/// generated route for
/// [SignUpScreenPage]
class SignUpScreenRoute extends PageRouteInfo<void> {
  const SignUpScreenRoute({List<PageRouteInfo>? children})
    : super(SignUpScreenRoute.name, initialChildren: children);

  static const String name = 'SignUpScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpScreenPage();
    },
  );
}
