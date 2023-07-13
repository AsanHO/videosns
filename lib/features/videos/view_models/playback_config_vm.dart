import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/%08features/videos/models/playback_config_model.dart';
import 'package:tictok_clone/%08features/videos/repos/playback_config_repo.dart';

class PlaybackConfigViewModel extends Notifier<PlaybackConfigModel> {
  final PlaybackConfigRepository _repository;

  PlaybackConfigViewModel(this._repository);

  void setMuted(bool value) {
    _repository.setMuted(value);
    state = PlaybackConfigModel(
      muted: value,
      autoplay: state.autoplay,
    );
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    state = PlaybackConfigModel(
      muted: state.muted,
      autoplay: value,
    );
  }

  //화면이 보기 원하는 데이터의 초기 상태 반환 어디에? -> state에
  @override
  PlaybackConfigModel build() {
    return PlaybackConfigModel(
        muted: _repository.isMuted(), autoplay: _repository.isAutoplay());
  }
}

// <우리가 expos하고 싶은 provider, provider가 expos할 데이터
final playbackConfigProvider =
    NotifierProvider<PlaybackConfigViewModel, PlaybackConfigModel>(
  () => throw UnimplementedError(),
);
