import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/%08features/authentication/widgets/auth_button.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/%08features/authentication/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
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
            children: const [
              Gaps.v80,
              Text(
                "Sign up for TikTok",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              Text(
                  "Create a profile, follow other accrount, make your own videos, and more.",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center),
              Gaps.v40,
              AuthButton(
                  icon: FaIcon(FontAwesomeIcons.user),
                  text: "Use email & password"),
              Gaps.v16,
              AuthButton(
                  icon: FaIcon(FontAwesomeIcons.apple),
                  text: "Continue with Aplle"),
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
              const Text("Already have an account?"),
              Gaps.h5,
              GestureDetector(
                onTap: () => onLoginTap(context),
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
