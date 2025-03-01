import 'package:talent_space_test/features/home/domin/entities/video.dart';

class VideoModel extends Video {
  VideoModel({
    required super.userId,
    required super.url,
    required super.ownerFcmToken,
  });
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      userId: json['userId'],
      url: json['url'],
      ownerFcmToken: json['ownerFcmToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'url': url,
      'ownerFcmToken': ownerFcmToken,
    };
  }
}
