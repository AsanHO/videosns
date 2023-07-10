import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/%08features/authentication/login_screen.dart';
import 'package:tictok_clone/%08features/authentication/username_screen.dart';
import 'package:tictok_clone/%08features/authentication/widgets/auth_button.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/";
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed(LoginScreen.routeName);
    print(result);
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).pushNamed(UsernameScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              Text(
                "Sign up for TikTok",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Gaps.v20,
              const Opacity(
                opacity: 0.7,
                child: Text(
                    "Create a profile, follow other account, make your own videos, and more.",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                    ),
                    textAlign: TextAlign.center),
              ),
              Gaps.v40,
              AuthButton(
                  icon: const FaIcon(FontAwesomeIcons.user),
                  text: "Use email & password",
                  onTap: () {
                    _onEmailTap(context);
                  }),
              Gaps.v16,
              AuthButton(
                  icon: const FaIcon(FontAwesomeIcons.apple),
                  text: "Continue with Aplle",
                  onTap: () {}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onLoginTap(context),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
