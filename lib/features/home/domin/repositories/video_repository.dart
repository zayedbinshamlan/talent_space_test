import 'package:talent_space_test/features/home/domin/entities/video.dart';

abstract class VideoRepository {
  Stream<List<Video>> getVedios();
}
