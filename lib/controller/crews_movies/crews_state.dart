part of 'crews_cubit.dart';

@immutable
abstract class CrewsState {}

class CrewsInitial extends CrewsState {}

class GetCrewMoviesState extends CrewsState {
  final List<CrewModel> crews;
  GetCrewMoviesState({
    required this.crews,
  });
}
