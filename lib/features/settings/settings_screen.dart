import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictok_clone/common/video_config/video_config.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotiChanged(bool? newvalue) {
    if (newvalue == null) return;
    setState(() {
      _notifications = newvalue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            activeColor: Theme.of(context).primaryColor,
            value: context.watch<VideoConfig>().isMuted,
            onChanged: (value) {
              context.read<VideoConfig>().toggleIsMuted();
            },
            title: const Text("음소거"),
          ),
          CheckboxListTile(
            activeColor: Theme.of(context).primaryColor,
            value: _notifications,
            onChanged: _onNotiChanged,
            title: const Text("체크박스"),
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1970),
                lastDate: DateTime(2030),
              );
              print(date);
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1930),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                      appBarTheme: AppBarTheme(
                          foregroundColor: Colors.white,
                          backgroundColor: Theme.of(context).primaryColor),
                    ),
                    child: child!,
                  );
                },
              );
              print(booking);
            },
            title: const Text("생일이 언제인가요?"),
          ),
          ListTile(
            title: const Text("Log out"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("정말 나가시겠습니까?"),
                  content: const Text("로그아웃하시면 더이상 특가알림을 받으실 수 없습니다."),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: (() => Navigator.of(context).pop()),
                      child: const Text("NO"),
                    ),
                    CupertinoDialogAction(
                      onPressed: (() => Navigator.of(context).pop()),
                      isDestructiveAction: true,
                      child: const Text("YES"),
                    )
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out/ Btm"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text("진짜?"),
                  message: const Text("진짜로?"),
                  actions: [
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: (() => Navigator.of(context).pop()),
                      child: const Text("NO"),
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: (() => Navigator.of(context).pop()),
                      child: const Text("YES"),
                    ),
                  ],
                ),
              );
            },
          ),
          const AboutListTile(
            applicationVersion: "0.1",
            applicationLegalese: "Don't copy me.",
          )
        ],
      ),
    );
  }
}
