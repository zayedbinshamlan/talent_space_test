import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talent_space_test/features/home/domin/entities/video.dart';

class VideoDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<Video>> getVideos() {
    return firestore.collection('videos').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Video(
          userId: doc['userId'],
          url: doc['url'],
          ownerFcmToken: doc['ownerFcmToken'],
        );
      }).toList();
    });
  }
}
