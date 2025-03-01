import 'package:talent_space_test/features/home/data/datasource/video_data_source.dart';
import 'package:talent_space_test/features/home/domin/entities/video.dart';
import 'package:talent_space_test/features/home/domin/repositories/video_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoDataSource videoDataSource;

  VideoRepositoryImpl({required this.videoDataSource});

  @override
  Stream<List<Video>> getVedios() {
    return videoDataSource.getVideos();
  }
}
