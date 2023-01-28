import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/%08features/authentication/login_form_screen.dart';
import 'package:tictok_clone/%08features/authentication/widgets/auth_button.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onSignTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
      ),
    );
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
              const Text(
                "Log in to TikTok",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                  "Create a profile, follow other accrount, make your own videos, and more.",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center),
              Gaps.v40,
              AuthButton(
                  icon: const FaIcon(FontAwesomeIcons.user),
                  text: "Login with email & password",
                  onTap: () => {_onEmailLoginTap(context)}),
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
        color: Colors.grey.shade100,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              Gaps.h5,
              GestureDetector(
                onTap: () => onSignTap(context),
                child: Text(
                  "Sign Up",
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
