import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'package:movie_app/constant/constant_widget.dart';
import 'package:movie_app/controller/actors_movies/actors_cubit.dart';
import 'package:movie_app/controller/top_rated_moves/top_rated_cubit.dart';
import 'package:movie_app/controller/upcoming_movies/upcoming_cubit.dart';

import '../controller/movies/movies_cubit.dart';
import '../controller/popular_movies/popular_cubit.dart';
import '../widget/no_internet_screen.dart';
import '../widget/now_playing_slider.dart';
import 'category_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context).getNowPlayingMovies();
    BlocProvider.of<TopRatedCubit>(context).getTopRatedMovies();
    BlocProvider.of<PopularCubit>(context).getPopularMovies();
    BlocProvider.of<UpcomingCubit>(context).getUpcomingMovies();
    BlocProvider.of<ActorsCubit>(context).getActorsMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movie App".toUpperCase(),
          style: const TextStyle(
            color: Colors.black45,
            fontSize: 20,
            letterSpacing: 6,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return BlocBuilder<MoviesCubit, MoviesState>(
              builder: (context, state) {
                if (state is NowPlayingMoviesState) {
                  return LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraint) {
                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraint.maxHeight,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NowPlayingSlider(
                                nowPlaying: state.nowPlaying,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                ),
                                child: CategoryScreen(),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return CustomConstantWidget.indicator();
                }
              },
            );
          } else {
            return const NoInterNetWidget();
          }
        },
        child: const NoInterNetWidget(),
      ),
    );
  }
}
