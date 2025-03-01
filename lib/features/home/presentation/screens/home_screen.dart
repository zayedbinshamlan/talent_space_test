// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_space_test/features/home/presentation/cubit/video_cubit.dart';
import 'package:talent_space_test/features/home/presentation/cubit/video_state.dart';
import 'package:talent_space_test/features/home/presentation/widgets/video_player_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          if (state is VideoLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is VideoLoaded) {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.videos.length,
              itemBuilder: (context, index) {
                return VideoPlayerWidget(video: state.videos[index]);
              },
            );
          } else if (state is VideoError) {
            return Center(child: Text(state.message));
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
