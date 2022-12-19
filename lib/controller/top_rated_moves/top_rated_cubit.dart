import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/movie_model.dart';
import '../../services/web_services.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit({required this.webServices}) : super(TopRatedInitial());
  final WebServices webServices;
  void getTopRatedMovies() async {
    emit(
      TopRatedMoviesState(
        topRated: await webServices.getTopRatedMovies(),
      ),
    );
  }
}
