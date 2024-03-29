import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/%08features/discover/discover_screen.dart';
import 'package:tictok_clone/%08features/inbox/inbox_screen.dart';
import 'package:tictok_clone/common/main_navigation/widgets/nav_btn.dart';
import 'package:tictok_clone/common/main_navigation/widgets/post_video_btn.dart';
import 'package:tictok_clone/%08features/users/user_profile_screen.dart';
import 'package:tictok_clone/%08features/videos/views/video_recording_screen.dart';
import 'package:tictok_clone/%08features/videos/views/video_timeline_screen.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/main.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";
  final String tab;
  const MainNavigationScreen({super.key, required this.tab});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "discover",
    "xxxx",
    "inbox",
    "profile",
  ];
  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoBtnTap() {
    context.pushNamed(VideoRecordingScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //회원가입에는 필요할지몰라도, 영상코멘트 댓글등에선 불필요함 반드시 scaffold에서 운영하는 코드
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(
              username: "니꼬",
              tab: "likes",
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 || isDarkMode(context)
            ? Colors.black
            : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: Sizes.size10, horizontal: Sizes.size20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBtn(
                text: "Home",
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                isSelected: _selectedIndex == 0,
                selectedIndex: _selectedIndex,
                onTap: () => _onTap(0),
              ),
              NavBtn(
                text: "Discover",
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                isSelected: _selectedIndex == 1,
                selectedIndex: _selectedIndex,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoBtnTap,
                child: PostBtn(isHome: _selectedIndex == 0),
              ),
              Gaps.h24,
              NavBtn(
                text: "Inbox",
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                isSelected: _selectedIndex == 3,
                selectedIndex: _selectedIndex,
                onTap: () => _onTap(3),
              ),
              NavBtn(
                text: "Profile",
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                isSelected: _selectedIndex == 4,
                selectedIndex: _selectedIndex,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
