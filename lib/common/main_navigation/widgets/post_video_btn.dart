import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/sizes.dart';

class PostBtn extends StatelessWidget {
  const PostBtn({
    Key? key,
    required this.isHome,
  }) : super(key: key);
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 20,
          child: Container(
            height: 35,
            width: 30,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff00f2ea),
              borderRadius: BorderRadius.circular(
                Sizes.size11,
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            height: 35,
            width: 30,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(
                Sizes.size11,
              ),
            ),
          ),
        ),
        Container(
          height: 35,
          width: 45,
          decoration: BoxDecoration(
              color: isHome ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(Sizes.size11)),
          child: Center(
              child: FaIcon(
            FontAwesomeIcons.plus,
            color: isHome ? Colors.black : Colors.white,
            size: Sizes.size24,
          )),
        )
      ],
    );
  }
}
