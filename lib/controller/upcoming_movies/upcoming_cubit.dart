// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:movie_app/services/web_services.dart';

import '../../model/movie_model.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  UpcomingCubit({
    required this.webServices,
  }) : super(UpcomingInitial());
  final WebServices webServices;

  void getUpcomingMovies() async {
    emit(
      UpcomingMoviesState(upcoming: await webServices.getUpcomingMovies()),
    );
  }
}
