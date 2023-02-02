import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/%08features/inbox/activity_screen.dart';
import 'package:tictok_clone/%08features/inbox/DMs.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    void _onDmPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const DMScreen(),
        ),
      );
    }

    void _onActivityTap() {
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
              onTap: _onActivityTap,
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
