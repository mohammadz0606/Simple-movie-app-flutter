import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/services/web_services.dart';

import '../../model/crew_model.dart';

part 'crews_state.dart';

class CrewsCubit extends Cubit<CrewsState> {
  CrewsCubit({
    required this.webServices,
  }) : super(CrewsInitial());
  final WebServices webServices;

  void getCrewMovies({
    required int movieId,
  }) async {
    emit(
      GetCrewMoviesState(
        crews: await webServices.getCrewMovies(
          movieId: movieId,
        ),
      ),
    );
  }
}
