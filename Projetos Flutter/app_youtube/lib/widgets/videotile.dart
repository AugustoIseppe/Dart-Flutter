import 'package:app_youtube/blocs/favorite_bloc.dart';
import 'package:app_youtube/models/video.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class VideoTile extends StatelessWidget {
  final Video? video;
  VideoTile(this.video);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Container(
              padding: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  video!.thumb!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        video!.title!,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(video!.channel!),
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                  stream: BlocProvider.getBloc<FavoriteBloc>().outFav,
                  initialData: {},
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return IconButton(
                        onPressed: () {
                          BlocProvider.getBloc<FavoriteBloc>().toggleFavoritess(video!);
                        },
                        icon: Icon(snapshot.data!.containsKey(video!.id) ? Icons.star : Icons.star_border),
                      );
                    } else {
                      return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue),);
                    }
                  } 
                  ),
            ],
          )
        ],
      ),
    );
  }
}
