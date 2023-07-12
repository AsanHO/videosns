import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/%08features/authentication/widgets/form_button.dart';
import 'package:tictok_clone/%08features/onboarding/interests_screen.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime today = DateTime.now();

  void onNextTap() {
    context.pushReplacementNamed(InterestsScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    setDateFormat(today);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void setDateFormat(initDate) {
    final textDate = initDate.toString().split(" ")[0];
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "유저명님! 생일이 언제인가요?",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              "유저명님의 생일은 원한다면 비공개할 수 있습니다.",
              style: TextStyle(
                fontSize: Sizes.size14,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              controller: _birthdayController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            GestureDetector(
              onTap: onNextTap,
              child: const FormButton(isDisable: false),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: Sizes.size96 * 4,
          child: CupertinoDatePicker(
            maximumDate: today,
            initialDateTime: today,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime value) {
              setDateFormat(value);
            },
          ),
        ),
      ),
    );
  }
}
