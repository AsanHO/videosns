import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictok_clone/%08features/onboarding/tutorial_screen.dart';
import 'package:tictok_clone/%08features/onboarding/widgets/interest_button.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  static String routeName = "interest";
  static String routeUrl = "/tutorial";
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _hideTitle = false;

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_hideTitle) return; //이미 참이라면 불필요하게 바꾸지 않는다.
      setState(() {
        _hideTitle = true;
      });
    } else {
      setState(() {
        _hideTitle = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
            opacity: _hideTitle ? 0 : 1,
            duration: const Duration(milliseconds: 300),
            child: const Text("관심사를 선택하세요!")),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
              horizontal: Sizes.size28,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "관심사를 선택하세요",
                  style: TextStyle(
                    fontSize: Sizes.size32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gaps.v20,
                const Text("더나은 이용환경을 만들어드립니다"),
                Gaps.v60,
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size24),
          child: CupertinoButton(
            onPressed: _onNextTap,
            color: Theme.of(context).primaryColor,
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}
