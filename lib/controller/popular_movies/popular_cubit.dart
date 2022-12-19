// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/web_services.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit({
    required this.webServices,
  }) : super(PopularInitial());
  final WebServices webServices;

  void getPopularMovies() async {
    emit(
      PopularMoviesState(popular: await webServices.getPopularMovies()),
    );
  }
}
