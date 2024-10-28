import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:videoplayeerapp/video_list';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestStoragePermission();
  List<FileSystemEntity> videos = await fetchVideos();
  runApp(MyApp(videos: videos));git branch -M main
}

Future<void> requestStoragePermission() async {
  var status = await Permission.storage.request();
  if (!status.isGranted) {
    await Permission.storage.request();
  }
}

Future<List<FileSystemEntity>> fetchVideos() async {
  Directory? directory = await getExternalStorageDirectory();
  List<FileSystemEntity> files = directory!.listSync(recursive: true);
  return files.where((file) => file.path.endsWith(".mp4")).toList();
}

class MyApp extends StatelessWidget {
  final List<FileSystemEntity> videos;

  MyApp({required this.videos});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VideoPlayer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoListScreen(videos: videos),
    );
  }
}
