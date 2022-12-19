// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class NowPlayingMoviesState extends MoviesState {
  final List<MovieModel> nowPlaying;
  NowPlayingMoviesState({
    required this.nowPlaying,
  });
}
