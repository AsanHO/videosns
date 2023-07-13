import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/%08features/videos/view_models/timeline_view_model.dart';
import 'package:video_player/video_player.dart';
import "package:gallery_saver/gallery_saver.dart";

class VideoPreviewScreen extends ConsumerStatefulWidget {
  final XFile preview;
  final bool isPicked;
  const VideoPreviewScreen(
      {super.key, required this.preview, required this.isPicked});

  @override
  VideoPreviewScreenState createState() => VideoPreviewScreenState();
}

class VideoPreviewScreenState extends ConsumerState<VideoPreviewScreen> {
  bool _isSaved = false;
  late final VideoPlayerController _videoPlayerController;
  Future<void> _initVideo() async {
    _videoPlayerController =
        VideoPlayerController.file(File(widget.preview.path));
    _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    //_videoPlayerController.play();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initVideo();
  }

  Future<void> _saveGallary() async {
    if (_isSaved) return;
    await GallerySaver.saveVideo(widget.preview.path, albumName: "프리뷰");
    _isSaved = true;
    setState(() {});
  }

  Future<void> _onUploadPressed() async {
    ref.read(timeLineProvider.notifier).uploadVideo();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("미리보기"),
        actions: [
          //if (!widget.isPicked)
          IconButton(
            onPressed: ref.watch(timeLineProvider).isLoading
                ? () {}
                : _onUploadPressed,
            icon: ref.watch(timeLineProvider).isLoading
                ? const CircularProgressIndicator()
                : const FaIcon(FontAwesomeIcons.download),
          ),
          IconButton(
            onPressed: _saveGallary,
            icon: _isSaved
                ? const FaIcon(FontAwesomeIcons.check)
                : const FaIcon(FontAwesomeIcons.download),
          ),
        ],
      ),
      body: !_videoPlayerController.value.isInitialized
          ? VideoPlayer(_videoPlayerController)
          : null,
    );
  }
}
