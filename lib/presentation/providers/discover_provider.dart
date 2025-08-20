import 'package:flutter/material.dart';
import 'package:toktok/domain/entities/video_post.dart';
import 'package:toktok/infrastructure/models/local_video_model.dart';
import 'package:toktok/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {

  //todo Repository, Data source

  bool initialLoading = true;
  List<VideoPost> videos = [];


  Future<void> loadNextPage() async{

    final List<VideoPost> newVideos = videoPosts.map(
      (video)=> LocalVideoModel.fromJson(video).toVideoEntity()
    ).toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}