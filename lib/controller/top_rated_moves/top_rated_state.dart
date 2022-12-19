part of 'top_rated_cubit.dart';

@immutable
abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedMoviesState extends TopRatedInitial {
  final List<MovieModel> topRated;
  TopRatedMoviesState({
    required this.topRated,
  });
}
