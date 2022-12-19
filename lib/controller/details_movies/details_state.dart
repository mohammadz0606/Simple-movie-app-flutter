part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class GetDetailsMovies extends DetailsState {
  final DetailsMovies detailsMovies;
  GetDetailsMovies({
    required this.detailsMovies,
  });
}
