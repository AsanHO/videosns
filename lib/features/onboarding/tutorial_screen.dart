import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/main.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showInPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      //오른쪽드래그
      setState(() {
        _direction = Direction.right;
      });
    } else {
      //왼쪽드래그
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails detail) {
    if (_direction == Direction.left) {
      setState(() {
        _showInPage = Page.second;
      });
    } else {
      setState(() {
        _showInPage = Page.first;
      });
    }
  }

  void _onEnterAppTap() {
    context.go("/home");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SafeArea(
            child: AnimatedCrossFade(
              crossFadeState: _showInPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
              firstChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "대단한 영상들을 즐기세요!",
                    style: TextStyle(
                      fontSize: Sizes.size32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gaps.v36,
                  Text(
                    "동해물과 백두산이 마르고 닳도록, 대한사랑 대한으로 길이길이 보전하세",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  )
                ],
              ),
              secondChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "혐오발언은 안돼요!",
                    style: TextStyle(
                      fontSize: Sizes.size32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gaps.v36,
                  Text(
                    "동해물과 백두산이 마르고 닳도록, 대한사랑 대한으로 길이길이 보전하세",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: isDarkMode(context) ? Colors.black : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size48,
              vertical: Sizes.size28,
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _showInPage == Page.first ? 0 : 1,
              child: CupertinoButton(
                onPressed: _onEnterAppTap,
                color: Theme.of(context).primaryColor,
                child: const Text("Enter the App"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
