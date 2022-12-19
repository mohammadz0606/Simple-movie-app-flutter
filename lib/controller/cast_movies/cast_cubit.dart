import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/model/casts_model.dart';
import 'package:movie_app/services/web_services.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit({
    required this.webServices,
  }) : super(CastInitial());
  final WebServices webServices;

  void getCastMovies({
    required int movieId,
  }) async {
    emit(
      GetCastMovies(
        casts: await webServices.getCastMovies(movieId: movieId),
      ),
    );
  }
}
