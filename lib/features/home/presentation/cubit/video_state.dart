import 'package:talent_space_test/features/home/domin/entities/video.dart';

class VideoState {}

final class VideoInitial extends VideoState {}

final class VideoLoading extends VideoState {}

final class VideoLoaded extends VideoState {
  final List<Video> videos;

  VideoLoaded({required this.videos});
}

final class VideoError extends VideoState {
  final String message;

  VideoError({required this.message});
}
