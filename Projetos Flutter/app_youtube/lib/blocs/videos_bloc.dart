import 'dart:async';
import 'dart:ui';
import 'package:app_youtube/api.dart';
import 'package:app_youtube/models/video.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class VideosBloc implements BlocBase {
  Api? api;

  List<Video>? videos;

  //tirar um dado de dentro do bloc
  final StreamController<List<Video>> _videosController =
      StreamController<List<Video>>();
  Stream get outVideos => _videosController.stream;

  //passar um dado para dentro do bloc
  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  VideosBloc() {
    api = Api();
    _searchController.stream.listen(_search);
  }

  void _search(String? search) async {
    if (search != null) {
      videos = await api!.search(search);
    } else {
      videos = await api!.nextPage() + await api!.nextPage();
    }
    _videosController.sink.add(videos!);
  }

  @override
  void dispose() {
    _videosController.close();
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
}
