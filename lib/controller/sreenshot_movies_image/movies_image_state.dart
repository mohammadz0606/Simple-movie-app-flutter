part of 'movies_image_cubit.dart';

@immutable
abstract class MoviesImageState {}

class MoviesImageInitial extends MoviesImageState {}

class GetScreenshotMovies extends MoviesImageState {
  final List<ScreenshotModel> screenshots;
  GetScreenshotMovies({
    required this.screenshots,
  });
}
