import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/sizes.dart';

class PostBtn extends StatelessWidget {
  const PostBtn({
    Key? key,
  }) : super(key: key);

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
              color: Colors.white,
              borderRadius: BorderRadius.circular(Sizes.size11)),
          child: const Center(
              child: FaIcon(
            FontAwesomeIcons.plus,
            color: Colors.black,
            size: Sizes.size24,
          )),
        )
      ],
    );
  }
}
