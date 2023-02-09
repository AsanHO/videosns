import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/main.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  void _onChanged(String value) {
    print("searching $value");
  }

  void _onSubmitted(String value) {
    print("제출 $value");
  }

  void _escapeKeyboard(int num) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: CupertinoSearchTextField(
            controller: _textEditingController,
            onChanged: _onChanged,
            onSubmitted: _onSubmitted,
            style: TextStyle(
                color: isDarkMode(context) ? Colors.white : Colors.black),
          ),
          bottom: TabBar(
            onTap: ((value) => _escapeKeyboard(value)),
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              for (var tab in tabs)
                GestureDetector(
                  child: Tab(
                    text: tab,
                  ),
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (var tab in tabs)
              Center(
                child: GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 20,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 9 / 20 //화면비율
                      ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset("assets/images/image.jpg")),
                      Gaps.v8,
                      const Text(
                        "loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Gaps.v5,
                      DefaultTextStyle(
                        style: TextStyle(
                            color: isDarkMode(context)
                                ? Colors.grey[300]
                                : Colors.grey[600],
                            fontWeight: FontWeight.w600),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 15,
                              child: Text(
                                "uno",
                              ),
                            ),
                            Gaps.h3,
                            const Expanded(
                              //maxline이 1일경우 기준이 없으므로 사용해줘야만 함
                              child: Text(
                                "userndfjsklfjekls;fjkslej;kls;ame",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gaps.h4,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: 19,
                              color: isDarkMode(context)
                                  ? Colors.grey[300]
                                  : Colors.grey[600],
                            ),
                            const Text("3.5K")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
