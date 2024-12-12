import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:rc_workouts/widgets/my_app_bar.dart';
import 'package:rc_workouts/widgets/video_player_controls.dart';

class SallyUpPage extends StatefulWidget {
  const SallyUpPage({super.key});

  @override
  State<SallyUpPage> createState() => _SallyUpPageState();
}

class _SallyUpPageState extends State<SallyUpPage> {
  late VideoPlayerController controller;
  late Future<void> initializeVideoPlayerFuture;
  bool isFullScreen = false;

  final GlobalKey<VideoPlayerControlsState> controlsKey =
      GlobalKey<VideoPlayerControlsState>();

  void toggleControlsVisibility() {
    setState(() {
      controller.value.isPlaying ? controller.pause() : controller.play();
      controlsKey.currentState?.toggleControlsVisibility();
    });
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    controller = VideoPlayerController.asset('assets/videos/sally_up.mp4');
    initializeVideoPlayerFuture = controller.initialize();
    controller.setLooping(false);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Sally Up!'),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                const Text(
                  "Whoohooooo!",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                const SizedBox(height: 32),
                FutureBuilder(
                  future: initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return buildVideoPlayerContainer();
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildVideoPlayerContainer() {
    return Column(
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GestureDetector(
                  onTap: toggleControlsVisibility,
                  child: VideoPlayer(controller),
                ),
                VideoProgressIndicator(controller, allowScrubbing: true),
                VideoPlayerControls(
                    controller: controller, isFullScreen: isFullScreen),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
