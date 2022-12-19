part of 'upcoming_cubit.dart';

@immutable
abstract class UpcomingState {}

class UpcomingInitial extends UpcomingState {}

class UpcomingMoviesState extends UpcomingInitial {
  final List<MovieModel> upcoming;
  UpcomingMoviesState({
    required this.upcoming,
  });
}
