import 'dart:io';
import 'package:flutter/material.dart';
import 'video_player_screen.dart';

class VideoListScreen extends StatelessWidget {
  final List<FileSystemEntity> videos;

  const VideoListScreen({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VideoPlayer"),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return ListTile(
            title: Text(video.path.split('/').last),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(videoPath: video.path),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
