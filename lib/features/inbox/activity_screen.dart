import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _notification = List.generate(20, (index) => "${index}h");

  final List<Map<String, dynamic>> _tabs = [
    {
      "title": "All activity",
      "icon": FontAwesomeIcons.solidMessage,
    },
    {
      "title": "Likes",
      "icon": FontAwesomeIcons.solidHeart,
    },
    {
      "title": "Comments",
      "icon": FontAwesomeIcons.solidComments,
    },
    {
      "title": "Mentions",
      "icon": FontAwesomeIcons.at,
    },
    {
      "title": "Followers",
      "icon": FontAwesomeIcons.solidUser,
    },
    {
      "title": "From TikTok",
      "icon": FontAwesomeIcons.tiktok,
    }
  ];

  bool _showBarrier = false;

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  late final Animation<double> _arrowAnimation =
      Tween(begin: 0.0, end: 0.5).animate(_animationController);

  late final Animation<Offset> _panelAnimation = Tween(
    begin: const Offset(0, -1),
    end: Offset.zero,
  ).animate(_animationController);

  late final Animation<Color?> _barrierAnimation = ColorTween(
    begin: Colors.transparent,
    end: Colors.black38,
  ).animate(_animationController);

  void _onToggleAnimation() async {
    if (_animationController.isCompleted) {
      await _animationController.reverse();
    } else {
      await _animationController.forward();
    } //애니메이션이 끝난뒤에 배리어 생성
    setState(() {
      _showBarrier = !_showBarrier;
    });
  }

  void _onDismissed(String notification, direction) {
    _notification.remove(notification);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _onToggleAnimation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Activity"),
              RotationTransition(
                turns: _arrowAnimation,
                child: const FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: 14,
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Gaps.v24,
              Text(
                "New",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                ),
              ),
              Gaps.v14,
              for (var notification in _notification)
                Dismissible(
                  key: Key(notification),
                  onDismissed: (direction) =>
                      _onDismissed(notification, direction),
                  background: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.green,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: FaIcon(
                        FontAwesomeIcons.checkDouble,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: FaIcon(
                        FontAwesomeIcons.trashCan,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero, //리스트타일의 경우 디폴트 패딩이 있음
                    leading: Container(
                      width: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.bell,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                        text: "Account Updates",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: " Upload longer videos.",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          TextSpan(
                            text: " 1h",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade500),
                          )
                        ],
                      ),
                    ),
                    trailing: const FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: 16,
                    ),
                  ),
                ),
            ],
          ),
          if (_showBarrier)
            AnimatedModalBarrier(
              color: _barrierAnimation,
              dismissible: true,
              onDismiss: _onToggleAnimation,
            ),
          SlideTransition(
            position: _panelAnimation,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var tab in _tabs)
                    ListTile(
                      title: Row(
                        children: [
                          FaIcon(
                            tab["icon"],
                            color: Colors.black,
                            size: 16,
                          ),
                          Gaps.h20,
                          Text(
                            tab["title"],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
