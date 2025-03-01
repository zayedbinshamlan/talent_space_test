
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_space_test/features/home/domin/entities/video.dart';
import 'package:talent_space_test/features/home/presentation/cubit/video_cubit.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final Video video;

  const VideoPlayerWidget({super.key, required this.video});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _notificationSent = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.video.url))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);

        _controller.addListener(() {
          if (_controller.value.isInitialized) {
            double videoPosition =
                _controller.value.position.inSeconds.toDouble();
            double videoDuration =
                _controller.value.duration.inSeconds.toDouble();

            if (videoPosition >= videoDuration * 0.7 && !_notificationSent) {
              _sendNotification();
            }
          }
        });
      });
  }

  void _sendNotification() {
    if (widget.video.ownerFcmToken.isNotEmpty) {
      context.read<VideoCubit>().sendNotificationToOwner(
          widget.video.ownerFcmToken,
          'Video Watched',
          'Someone watched your video!');
      setState(() {
        _notificationSent = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: VideoPlayer(_controller),
          )
        : Center(child: CircularProgressIndicator());
  }
}
