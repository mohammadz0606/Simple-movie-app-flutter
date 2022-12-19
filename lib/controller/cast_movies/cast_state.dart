part of 'cast_cubit.dart';

@immutable
abstract class CastState {}

class CastInitial extends CastState {}

class GetCastMovies extends CastState {
  final List<CastsModel> casts;
  GetCastMovies({
    required this.casts,
  });
}
