// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/web_services.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final WebServices webServices;
  MoviesCubit({
    required this.webServices,
  }) : super(MoviesInitial());

  void getNowPlayingMovies() async {
    emit(
      NowPlayingMoviesState(
        nowPlaying: await webServices.getNowPlayingMovies(),
      ),
    );
  }
}
