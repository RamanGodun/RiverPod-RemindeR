/// 🛣️ All route paths used in GoRouter configuration.
class RoutePaths {
  ///
  /// 🛡️ Auth-related paths
  static const signIn = '/signInPage';
  static const signUp = '/signUpPage';

  /// 🌿 First navigation branch
  static const firstPage = '/firstPage';
  static const firstSubtreePage = 'firstSubtreePage';

  /// 🌿 Second navigation branch
  static const secondPage = '/secondPage';
  static const secondSubtreePage =
      'secondSubtreePage/:id'; //":id" means we give id parameter, when go to this route

  /// 🌿 Third navigation branch
  static const thirdPage = '/thirdPage';
  static const thirdSubtreePage =
      'thirdSubtreePage/:id'; //":id" means we give id parameter, when go to this route
}
