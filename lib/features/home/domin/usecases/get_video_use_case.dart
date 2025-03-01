import 'package:talent_space_test/features/home/domin/entities/video.dart';
import 'package:talent_space_test/features/home/domin/repositories/video_repository.dart';

class GetVideoUseCase {
  final VideoRepository videoRepository;

  GetVideoUseCase({required this.videoRepository});

  Stream<List<Video>> execute() {
    return videoRepository.getVedios();
  }
}
