// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'popular_cubit.dart';

@immutable
abstract class PopularState {}

class PopularInitial extends PopularState {}

class PopularMoviesState extends PopularState {
  final List<MovieModel> popular;
  PopularMoviesState({
    required this.popular,
  });
}
