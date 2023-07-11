import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';

class VideoRecordingScreen extends StatefulWidget {
  static String route = "/";
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
  bool _hasPermission = false;
  bool _isSelfieMode = false;
  late FlashMode _flashMode;
  late CameraController _cameraController;
  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }
    print(cameras); //0번 카메라 : 후면 , 1번카메라 : 전면
    _cameraController = CameraController(
      cameras[_isSelfieMode ? 1 : 0],
      ResolutionPreset.ultraHigh,
    );
    await _cameraController.initialize();

    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> initpermission() async {
    final cameraPermission = await Permission.camera.request();
    final microphonePermission = await Permission.microphone.request();
    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final microphoneDenied = microphonePermission.isDenied ||
        microphonePermission.isPermanentlyDenied;
    if (!cameraDenied && !microphoneDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
    print("설정완료");
  }

  @override
  void initState() {
    super.initState();
    initpermission();
  }

  Future<void> _toggleSelfieMode() async {
    print("셀피 변경");
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !_hasPermission || !_cameraController.value.isInitialized
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Initializing...",
                    style:
                        TextStyle(color: Colors.white, fontSize: Sizes.size20),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive()
                ],
              )
            : Stack(
                children: [
                  CameraPreview(_cameraController),
                  Positioned(
                    top: 100,
                    left: Sizes.size20,
                    child: Column(
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: _toggleSelfieMode,
                          icon: const Icon(Icons.cameraswitch),
                        ),
                        Gaps.v10,
                        IconButton(
                          color: _flashMode == FlashMode.off
                              ? Colors.amber.shade200
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.off),
                          icon: const Icon(
                            Icons.flash_off_rounded,
                          ),
                        ),
                        Gaps.v10,
                        IconButton(
                          color: _flashMode == FlashMode.always
                              ? Colors.amber.shade200
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.always),
                          icon: const Icon(
                            Icons.flash_on_rounded,
                          ),
                        ),
                        Gaps.v10,
                        IconButton(
                          color: _flashMode == FlashMode.auto
                              ? Colors.amber.shade200
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.auto),
                          icon: const Icon(
                            Icons.flash_auto_rounded,
                          ),
                        ),
                        Gaps.v10,
                        IconButton(
                          color: _flashMode == FlashMode.torch
                              ? Colors.amber.shade200
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.torch),
                          icon: const Icon(
                            Icons.flashlight_on_rounded,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
