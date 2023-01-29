import 'package:flutter/material.dart';
import 'package:tictok_clone/%08features/authentication/widgets/form_button.dart';
import 'package:tictok_clone/%08features/onboarding/interests_screen.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formdata = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      _formKey.currentState!.validate(); //currentState가 null일때만 동작 return bool
      _formKey.currentState!.save();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const InterestsScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "이메일을 작성해주세요";
                  }
                  return null;
                  /* return "i don't like your email"; 이런식으로 오류를 출력할 수도 있음*/
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formdata["email"] = newValue;
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "비밀번호를 작성해주세요";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formdata["password"] = newValue;
                  }
                },
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmitTap,
                child: const FormButton(
                  isDisable: false,
                  text: "Log In",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
