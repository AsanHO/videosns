import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/%08features/inbox/chat_detail_screen.dart';

class DMScreen extends StatefulWidget {
  static const String routeName = "dm";
  static const String routeUrl = "/dm";
  const DMScreen({super.key});

  @override
  State<DMScreen> createState() => _DMScreenState();
}

class _DMScreenState extends State<DMScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  final List<int> _items = [];

  void _onChatTap(int index) {
    context.pushNamed(
      ChatDetailScreen.routeName,
      params: {"chatId": "$index"},
    );
  }

  void _addItem() {
    print(_key.currentState);
    if (_key.currentState != null) {
      _key.currentState!.insertItem(
        _items.length,
        duration: const Duration(milliseconds: 100),
      );
    }
    _items.add(_items.length);
  }

  void _removeItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
          index,
          (context, animation) => ScaleTransition(
                scale: animation,
                child: SizeTransition(
                    sizeFactor: animation, child: _makeTile(index)),
              ),
          duration: const Duration(milliseconds: 100));
      _items.removeAt(index);
    }
  }

  Widget _makeTile(int index) {
    return ListTile(
      onLongPress: () => _removeItem(index),
      onTap: () => _onChatTap(index),
      leading: const CircleAvatar(
        radius: 30,
        child: Text('우노'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "우노 ($index)",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            "2:16 PM",
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ],
      ),
      subtitle: Text("팔렸나요 $index"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Direct Messages"),
        actions: [
          IconButton(
              onPressed: _addItem, icon: const FaIcon(FontAwesomeIcons.plus))
        ],
      ),
      body: AnimatedList(
        key: _key,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index, animation) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: SizeTransition(
              sizeFactor: animation,
              child: _makeTile(index),
            ),
          ),
        ),
      ),
    );
  }
}
