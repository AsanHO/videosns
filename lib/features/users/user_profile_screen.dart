import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/%08features/settings/settings_screen.dart';
import 'package:tictok_clone/%08features/users/widgets/persistent_tab_bar.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  final String username;
  final String tab;

  const UserProfileScreen({
    super.key,
    required this.username,
    required this.tab,
  });

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
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: widget.tab == "likes" ? 1 : 0,
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Text(widget.username),
                  actions: [
                    IconButton(
                      onPressed: _onGearPressed,
                      icon: const FaIcon(
                        FontAwesomeIcons.gear,
                        size: Sizes.size20,
                      ),
                    )
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gaps.v20,
                      const CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/3612017"),
                        child: Text("니꼬"),
                      ),
                      Gaps.v20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "@${widget.username}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h5,
                          FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            size: Sizes.size16,
                            color: Colors.blue.shade500,
                          )
                        ],
                      ),
                      Gaps.v24,
                      SizedBox(
                        height: Sizes.size48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "97",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                                Gaps.v1,
                                Text("Following",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ))
                              ],
                            ),
                            VerticalDivider(
                              width: Sizes.size32,
                              thickness: Sizes.size1,
                              color: Colors.grey.shade400,
                              indent: Sizes.size14,
                              endIndent: Sizes.size14,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "10M",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                                Gaps.v1,
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                )
                              ],
                            ),
                            VerticalDivider(
                              width: Sizes.size32,
                              thickness: Sizes.size1,
                              color: Colors.grey.shade400,
                              indent: Sizes.size14,
                              endIndent: Sizes.size14,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "194.3M",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                                Gaps.v1,
                                Text(
                                  "Likes",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Gaps.v14,
                      FractionallySizedBox(
                        widthFactor: 0.33,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size12,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(Sizes.size4),
                            ),
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Gaps.v14,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size32,
                        ),
                        child: Text(
                          "All highlights and where to watch live matches on FIFA+ I wonder how it would loook",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Gaps.v14,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.link,
                            size: Sizes.size12,
                          ),
                          Gaps.h4,
                          Text(
                            "https://nomadcoders.co",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
              children: [
                GridView.builder(
                  itemCount: 20,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 9 / 14,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 9 / 14,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "images/image.jpg",
                          image:
                              "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text('Page two'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
