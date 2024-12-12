import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:rc_workouts/widgets/video_player_controls.dart';

class SallyUpFsPage extends StatefulWidget {
  final VideoPlayerController controller;

  const SallyUpFsPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<SallyUpFsPage> createState() => _SallyUpFsPageState();
}

class _SallyUpFsPageState extends State<SallyUpFsPage> {
  final GlobalKey<VideoPlayerControlsState> controlsKey =
      GlobalKey<VideoPlayerControlsState>();

  void toggleControlsVisibility() {
    setState(() {
      widget.controller.value.isPlaying
          ? widget.controller.pause()
          : widget.controller.play();
      controlsKey.currentState?.toggleControlsVisibility();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: widget.controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GestureDetector(
                onTap: toggleControlsVisibility,
                child: VideoPlayer(widget.controller),
              ),
              VideoProgressIndicator(widget.controller, allowScrubbing: true),
              VideoPlayerControls(
                  controller: widget.controller, isFullScreen: true),
            ],
          ),
        ),
      ),
    );
  }

  buildVideoPlayerControls() {
    return Container(
      color: Colors.black.withOpacity(0.25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    color:
                        widget.controller.value.isPlaying ? null : Colors.red,
                    icon: Icon(widget.controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        if (widget.controller.value.isPlaying) {
                          widget.controller.pause();
                        } else {
                          widget.controller.play();
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: Icon(widget.controller.value.volume == 0
                        ? Icons.volume_off
                        : Icons.volume_up),
                    onPressed: () {
                      setState(() {
                        widget.controller.setVolume(
                            widget.controller.value.volume == 0 ? 1 : 0);
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.fullscreen_exit),
                    onPressed: () {
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                      ]);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
