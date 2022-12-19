// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:movie_app/model/screenshot_model.dart';
import 'package:movie_app/services/web_services.dart';

part 'movies_image_state.dart';

class MoviesImageCubit extends Cubit<MoviesImageState> {
  MoviesImageCubit({
    required this.webServices,
  }) : super(MoviesImageInitial());
  final WebServices webServices;

  void getScreenshotMovies({
    required int movieId,
  }) async {
    emit(
      GetScreenshotMovies(
        screenshots: await webServices.getScreenshotMovies(
          movieId: movieId,
        ),
      ),
    );
  }
}
