import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/%08features/videos/view_models/timeline_view_model.dart';
import 'package:tictok_clone/%08features/videos/views/widgets/video_post.dart';

class VideoTimelineScreen extends ConsumerStatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  VideoTimelineScreenState createState() => VideoTimelineScreenState();
}

class VideoTimelineScreenState extends ConsumerState<VideoTimelineScreen> {
  int _itemCount = 4;
  final PageController _pageController = PageController();

  void _onPageChanged(int page) {
    print(page);
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
    }
    setState(() {});
  }

  void _onVideoFinished() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 150),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(
      const Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(timeLineProvider).when(
          error: (error, stackTrace) => Center(child: Text("$error")),
          loading: () => Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          )),
          data: (videos) => RefreshIndicator(
            onRefresh: _onRefresh,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: _onPageChanged,
              itemCount: videos.length,
              itemBuilder: (context, index) =>
                  VideoPost(onVideoFinised: _onVideoFinished, index: index),
            ),
          ),
        );
  }
}
