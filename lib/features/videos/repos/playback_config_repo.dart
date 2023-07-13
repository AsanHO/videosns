import 'package:shared_preferences/shared_preferences.dart';

class PlaybackConfigRepository {
  static const String _autoplay = "autoplay";
  static const String _muted = "muted";

  final SharedPreferences _preferences;

  PlaybackConfigRepository(this._preferences);

  Future<void> setAutoplay(bool value) async {
    _preferences.setBool(_autoplay, value);
  }

  Future<void> setMuted(bool value) async {
    _preferences.setBool(_muted, value);
  }

  bool isAutoplay() {
    return _preferences.getBool(_autoplay) ?? false;
  }

  bool isMuted() {
    return _preferences.getBool(_muted) ?? false;
  }
}
