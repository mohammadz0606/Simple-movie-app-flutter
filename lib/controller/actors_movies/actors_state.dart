part of 'actors_cubit.dart';

@immutable
abstract class ActorsState {}

class ActorsInitial extends ActorsState {}

class ActorsMoviesState extends ActorsInitial {
  final List<ActorsModel> actors;
  ActorsMoviesState({
    required this.actors,
  });
}
