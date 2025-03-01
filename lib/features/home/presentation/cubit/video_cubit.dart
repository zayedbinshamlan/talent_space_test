import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_space_test/features/home/domin/usecases/send_notification_use_case.dart';
import 'package:talent_space_test/features/home/domin/usecases/get_video_use_case.dart';
import 'package:talent_space_test/features/home/presentation/cubit/video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final GetVideoUseCase getVideosUseCase;
  final SendNotificationUseCase sendNotificationUseCase;
  VideoCubit(
      {required this.getVideosUseCase, required this.sendNotificationUseCase})
      : super(VideoInitial());

  void getVideos() {
    try {
      emit(VideoLoading());
      getVideosUseCase.execute().listen(
        (video) {
          emit(VideoLoaded(videos: video));
        },
      );
    } catch (e) {
      emit(VideoError(message: 'Failed to load videos.'));
    }
    return;
  }

  Future<void> sendNotificationToOwner(
      String fcmToken, String title, String body) async {
    await sendNotificationUseCase.execute(fcmToken, title, body);
  }
}
