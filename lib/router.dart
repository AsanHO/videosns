import 'package:go_router/go_router.dart';
import 'package:tictok_clone/%08features/videos/video_recording_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: VideoRecordingScreen.route,
      builder: (context, state) => const VideoRecordingScreen(),
    ),
  ],
);
