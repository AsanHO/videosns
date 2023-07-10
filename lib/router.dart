import 'package:go_router/go_router.dart';
import 'package:tictok_clone/%08features/authentication/email_screen.dart';
import 'package:tictok_clone/%08features/authentication/login_screen.dart';
import 'package:tictok_clone/%08features/authentication/sign_up_screen.dart';
import 'package:tictok_clone/%08features/authentication/username_screen.dart';
import 'package:tictok_clone/%08features/users/user_profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: UsernameScreen.routeName,
      builder: (context, state) => const UsernameScreen(),
    ),
    GoRoute(
      path: EmailScreen.routeName,
      builder: (context, state) => const EmailScreen(),
    ),
    GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final username = state.params['username'];
        return UserProfileScreen(username: username!);
      },
    )
  ],
);
