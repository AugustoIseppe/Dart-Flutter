
import 'dart:async';
import 'dart:ui';

import 'package:app_youtube/models/video.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class FavoriteBloc implements BlocBase {

  Map<String, Video> _favorites = {};

  final StreamController<Map<String, Video>> _favController = StreamController<Map<String, Video>>.broadcast();
  Stream<Map<String, Video>>  get outFav => _favController.stream;

  void toggleFavoritess(Video video) {
    if(_favorites.containsKey(video.id)) {
      _favorites.remove(video.id);
    } else {
      _favorites[video.id!] = video;
    }
    _favController.sink.add(_favorites);
  }

  @override
  void dispose(){
    _favController.close();
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