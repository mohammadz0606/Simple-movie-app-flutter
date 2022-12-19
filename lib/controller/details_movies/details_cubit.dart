import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/model/details_model.dart';
import 'package:movie_app/services/web_services.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({required this.webServices}) : super(DetailsInitial());
  final WebServices webServices;
  void getDetailsMovies({required int movieId}) async {
    emit(
      GetDetailsMovies(
        detailsMovies: await webServices.getDetailsMovies(movieId: movieId),
      ),
    );
  }
}
