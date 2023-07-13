import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/%08features/videos/view_models/playback_config_vm.dart';

import 'package:tictok_clone/%08features/videos/views/widgets/video_btn.dart';
import 'package:tictok_clone/%08features/videos/views/widgets/video_comments.dart';

import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends ConsumerStatefulWidget {
  final Function onVideoFinised;
  final int index;
  const VideoPost({
    super.key,
    required this.onVideoFinised,
    required this.index,
  });

  @override
  VideoPostState createState() => VideoPostState();
}

class VideoPostState extends ConsumerState<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/soju.mp4");
  late bool isPlay;

  late final AnimationController _animationController;
  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    setState(() {});
    _videoPlayerController.addListener(_onVideoChange);
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    isPlay = ref.read(playbackConfigProvider).autoplay;
    print(isPlay);
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.addListener(() {
      setState(() {});
    }); //이벤트리스너가 있어야만 부드럽게 작동함
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onPlaybackConfigChanged() {
    if (!mounted) return;
    if (ref.read(playbackConfigProvider).muted) {
      _videoPlayerController.setVolume(0);
    } else {
      _videoPlayerController.setVolume(1);
    }
  }

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinised();
      }
    }
  }

  void _onVisibilityChaned(VisibilityInfo info) {
    if (!mounted) return;
    if (info.visibleFraction == 1 && !_videoPlayerController.value.isPlaying) {
      //100퍼센트 차있는데, 재생중이 아니라면
      if (ref.read(playbackConfigProvider).autoplay) {
        _videoPlayerController.play();
        setState(() {
          isPlay = true;
        });
      } else {
        isPlay = false;
      }
    }
    if (info.visibleFraction == 0 && _videoPlayerController.value.isPlaying) {
      _onToggle();
    }
  }

  void _onToggle() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse(); //reset()도 가능 비교 해볼것
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      isPlay = !isPlay;
    });
  }

  void _onCommentsTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying == true) {
      _onToggle();
    }
    await showModalBottomSheet(
      //Future이므로 비동기할 것.
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const VideoComments(),
    );
  }

//if seconde pattern build video_post's all wiget
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChaned,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.teal,
                  ),
          ),
          Positioned.fill(
              child: GestureDetector(
            onTap: _onToggle,
          )),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: Transform.scale(
                  scale: _animationController.value,
                  child: AnimatedOpacity(
                    opacity: isPlay ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size60,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "@니꼬",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                Text(
                  "This is my house in Thailand!!!",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                IconButton(
                  onPressed: _onPlaybackConfigChanged,
                  icon: FaIcon(
                    ref.watch(playbackConfigProvider).muted
                        ? FontAwesomeIcons.volumeHigh
                        : FontAwesomeIcons.volumeOff,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Gaps.v24,
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/3612017",
                  ),
                  child: Text("니꼬"),
                ),
                Gaps.v24,
                const VideoButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: "2.9M",
                ),
                Gaps.v24,
                GestureDetector(
                  onTap: () => _onCommentsTap(context),
                  child: const VideoButton(
                    icon: FontAwesomeIcons.solidComment,
                    text: "33K",
                  ),
                ),
                Gaps.v24,
                const VideoButton(
                  icon: FontAwesomeIcons.share,
                  text: "Share",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
