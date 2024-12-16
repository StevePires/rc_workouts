import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:rc_workouts/pages/sally_up_fs_page.dart';

class VideoPlayerControls extends StatefulWidget {
  final VideoPlayerController controller;
  final bool isFullScreen;

  const VideoPlayerControls({
    super.key,
    required this.controller,
    required this.isFullScreen,
  });

  @override
  State<VideoPlayerControls> createState() => VideoPlayerControlsState();
}

class VideoPlayerControlsState extends State<VideoPlayerControls> {
  bool areControlsVisible = true;
  bool wasPlaying = false;
  Timer? hideControlsTimer;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onVideoStateChanged);
  }

  @override
  void dispose() {
    hideControlsTimer?.cancel();
    widget.controller.removeListener(onVideoStateChanged);
    super.dispose();
  }

  void onVideoStateChanged() {
    if (widget.controller.value.isPlaying == wasPlaying) {
      return;
    }

    if (widget.controller.value.isPlaying) {
      startHideControlsTimer();
    } else {
      hideControlsTimer?.cancel();
      setState(() {
        areControlsVisible = true;
      });
    }

    wasPlaying = widget.controller.value.isPlaying;
  }

  void startHideControlsTimer() {
    hideControlsTimer?.cancel();
    hideControlsTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        areControlsVisible = false;
      });
    });
  }

  void toggleControlsVisibility() {
    setState(() {
      areControlsVisible = !areControlsVisible;

      if (areControlsVisible) {
        startHideControlsTimer();
      } else {
        hideControlsTimer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        if (areControlsVisible)
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: Colors.black.withOpacity(0.33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          color: widget.controller.value.isPlaying
                              ? null
                              : Colors.red,
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
                          icon: Icon(widget.isFullScreen
                              ? Icons.fullscreen_exit
                              : Icons.fullscreen),
                          onPressed: () {
                            if (widget.isFullScreen) {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                              ]);
                              Navigator.of(context).pop();
                            } else {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.landscapeLeft,
                                DeviceOrientation.landscapeRight,
                              ]);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SallyUpFsPage(
                                      controller: widget.controller),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
      ],
    );
  }
}
