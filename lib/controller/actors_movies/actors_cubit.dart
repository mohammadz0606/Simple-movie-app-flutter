import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/model/actors_model.dart';
import 'package:movie_app/services/web_services.dart';

part 'actors_state.dart';

class ActorsCubit extends Cubit<ActorsState> {
  ActorsCubit({required this.webServices}) : super(ActorsInitial());
  final WebServices webServices;

  void getActorsMovies() async {
    emit(
      ActorsMoviesState(actors: await webServices.getActorsMovies()),
    );
  }
}
