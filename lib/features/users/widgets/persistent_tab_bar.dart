import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: const TabBar(
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.symmetric(vertical: 10),
        tabs: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.grid_on),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: FaIcon(FontAwesomeIcons.heart),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 47;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
