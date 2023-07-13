import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/%08features/videos/models/video_model.dart';

class TimeLineViewModel extends AsyncNotifier<List<VideoModel>> {
  final List<VideoModel> _list = [VideoModel(title: "이 비디오는 리스트선언시 만들어졌습니다.")];

  Future<void> uploadVideo() async {
    state = const AsyncValue.loading();
    //상태를 로딩중으로 만듬
    await Future.delayed(const Duration(seconds: 2));
    final newVideo = VideoModel(title: "${DateTime.now()}");
    _list.add(newVideo);
    state = AsyncValue.data(_list);
  }

  @override
  FutureOr<List<VideoModel>> build() async {
    await Future.delayed(const Duration(seconds: 5));
    return _list;
  }
}

final timeLineProvider =
    AsyncNotifierProvider<TimeLineViewModel, List<VideoModel>>(
  () => TimeLineViewModel(),
);
