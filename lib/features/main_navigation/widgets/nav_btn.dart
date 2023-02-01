import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';

class NavBtn extends StatelessWidget {
  const NavBtn({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.selectedIcon,
    required this.selectedIndex,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.5,
          duration: const Duration(milliseconds: 300),
          child: Column(
            mainAxisSize: MainAxisSize.min, // 중요! 디폴트값이 전체로 설정되어 있음
            children: [
              FaIcon(
                isSelected ? selectedIcon : icon,
                color: selectedIndex == 0 ? Colors.white : Colors.black,
              ),
              Gaps.v6,
              Text(
                text,
                style: TextStyle(
                    color: selectedIndex == 0 ? Colors.white : Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
