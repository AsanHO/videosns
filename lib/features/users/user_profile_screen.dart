import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/%08features/settings/settings_screen.dart';
import 'package:tictok_clone/%08features/users/widgets/persistent_tab_bar.dart';
import 'package:tictok_clone/constants/gaps.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                title: const Text("이은호"),
                actions: [
                  IconButton(
                    onPressed: _onGearPressed,
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      foregroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/85553431?v=4"),
                      child: Text("이은호"),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "@이은호",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Gaps.h4,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: 16,
                          color: Colors.green,
                        )
                      ],
                    ),
                    Gaps.v24,
                    SizedBox(
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "1",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Gaps.v5,
                              Text(
                                "Following",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          VerticalDivider(
                            //이 위젯은 height라는 속성이 필요하기에, sizedBox로 부모 위젯을 감싸준다.
                            width: 32,
                            thickness: 0.5,
                            color: Colors.grey.shade500,
                            indent: 10, //여백
                            endIndent: 10,
                          ),
                          Column(
                            children: const [
                              Text(
                                "97K",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Gaps.v5,
                              Text(
                                "Followers",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          VerticalDivider(
                            //이 위젯은 height라는 속성이 필요하기에, sizedBox로 부모 위젯을 감싸준다.
                            width: 32,
                            thickness: 0.5,
                            color: Colors.grey.shade500,
                            indent: 10, //여백
                            endIndent: 10,
                          ),
                          Column(
                            children: const [
                              Text(
                                "194.3M",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Gaps.v5,
                              Text(
                                "Like",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Gaps.v14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: const Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Gaps.h5,
                        SizedBox(
                          width: 50,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade400),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4))),
                            child: const Align(
                              alignment: Alignment.center,
                              child: FaIcon(
                                FontAwesomeIcons.youtube,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        Gaps.h5,
                        SizedBox(
                          width: 50,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade400),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4))),
                            child: const Align(
                              alignment: Alignment.center,
                              child: FaIcon(
                                FontAwesomeIcons.chevronDown,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: 12,
                        ),
                        Gaps.h4,
                        Text(
                          "www.naver.com",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            physics:
                const NeverScrollableScrollPhysics(), //통째로 스크롤 할 수 있도록 하는 것
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: 9 / 16 //화면비율
                    ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 9 / 16,
                          child: Image.asset("assets/images/image.jpg"),
                        ),
                        Positioned(
                          left: 2,
                          top: 2,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: const Text(
                              "Pinned",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 2,
                            child: DefaultTextStyle(
                              style: const TextStyle(color: Colors.white),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.play_arrow_outlined,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  Text("2.1M")
                                ],
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text("2"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
