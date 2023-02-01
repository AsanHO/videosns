import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/%08features/inbox/activity_screen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _onDmPressed() {}
    void _onActivityTap(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ActivityScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Inbox"),
        actions: [
          IconButton(
              onPressed: _onDmPressed,
              icon: const FaIcon(FontAwesomeIcons.paperPlane))
        ],
      ),
      body: ListView(
        children: [
          ListTile(
              onTap: (() => _onActivityTap(context)),
              title: const Text("Activity"),
              trailing: const FaIcon(FontAwesomeIcons.chevronRight)),
          Container(
            height: 1,
            color: Colors.grey.shade400,
          ),
          const ListTile(
            leading: CircleAvatar(child: FaIcon(FontAwesomeIcons.users)),
            title: Text(
              "New Follower",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text("팔로워들에게 온 메세지입니다"),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
          )
        ],
      ),
    );
  }
}
