import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/%08features/videos/view_models/playback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            activeColor: Theme.of(context).primaryColor,
            value: ref.watch(playbackConfigProvider).muted,
            //메소드에 접근하고 싶다면 .notifier을 해준다.
            onChanged: (value) {
              ref.read(playbackConfigProvider.notifier).setMuted(value);
            },
            title: const Text("음소거"),
          ),
          SwitchListTile.adaptive(
            activeColor: Theme.of(context).primaryColor,
            value: ref.watch(playbackConfigProvider).autoplay,
            onChanged: (value) {
              ref.read(playbackConfigProvider.notifier).setAutoplay(value);
            },
            title: const Text("자동재생"),
          ),
          CheckboxListTile(
            activeColor: Theme.of(context).primaryColor,
            value: false,
            onChanged: (value) {},
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
