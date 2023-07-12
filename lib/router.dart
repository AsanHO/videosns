import 'package:go_router/go_router.dart';
import 'package:tictok_clone/%08features/authentication/login_screen.dart';
import 'package:tictok_clone/%08features/authentication/sign_up_screen.dart';
import 'package:tictok_clone/%08features/onboarding/interests_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeUrl,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeUrl,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: InterestsScreen.routeName,
      path: InterestsScreen.routeUrl,
      builder: (context, state) => const InterestsScreen(),
    ),
  ],
);
