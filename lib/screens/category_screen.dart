import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant/constant_widget.dart';
import 'package:movie_app/controller/actors_movies/actors_cubit.dart';
import 'package:movie_app/controller/popular_movies/popular_cubit.dart';
import 'package:movie_app/controller/top_rated_moves/top_rated_cubit.dart';
import 'package:movie_app/controller/upcoming_movies/upcoming_cubit.dart';
import 'package:movie_app/model/actors_model.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screens/details_moveis.dart';
import 'package:movie_app/screens/popular_screen.dart';
import 'package:movie_app/screens/top_rated_screen.dart';
import 'package:movie_app/screens/upcoming_screen.dart';
import 'package:movie_app/widget/items_widget.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  List<MovieModel> topRatedMovies = [];
  List<MovieModel> popularMovies = [];
  List<MovieModel> upcomingMovies = [];
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: hight * 0.035),
        _tittleCategoryMovies(
          text: "top rated movies",
          onTap: () {
            Navigator.of(context).pushNamed(
              TopRatedScreen.route,
              arguments: topRatedMovies,
            );
          },
        ),
        BlocBuilder<TopRatedCubit, TopRatedState>(builder: (context, state) {
          if (state is TopRatedMoviesState) {
            topRatedMovies = state.topRated;
            return SizedBox(
              height: hight * 0.35,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: state.topRated.length,
                itemBuilder: (context, index) {
                  MovieModel movie = state.topRated[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        DetailsMoveisScreen.route,
                        arguments: movie.id,
                      );
                    },
                    child: ItemsWidget(movie: movie),
                  );
                },
                separatorBuilder: (context, index) {
                  return CustomConstantWidget.verticalDivider();
                },
              ),
            );
          } else {
            return CustomConstantWidget.indicator();
          }
        }),
        _tittleCategoryMovies(
          text: "popular movies",
          onTap: () {
            Navigator.of(context).pushNamed(
              PopularScreen.route,
              arguments: popularMovies,
            );
          },
        ),
        SizedBox(height: hight * 0.01),
        BlocBuilder<PopularCubit, PopularState>(
          builder: (context, state) {
            if (state is PopularMoviesState) {
              popularMovies = state.popular;
              return SizedBox(
                height: hight * 0.35,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.popular.length,
                  itemBuilder: (context, index) {
                    MovieModel movie = state.popular[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          DetailsMoveisScreen.route,
                          arguments: movie.id,
                        );
                      },
                      child: ItemsWidget(movie: movie),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return CustomConstantWidget.verticalDivider();
                  },
                ),
              );
            } else {
              return CustomConstantWidget.indicator();
            }
          },
        ),
        _tittleCategoryMovies(
          text: "upcoming movies",
          onTap: () {
            Navigator.of(context).pushNamed(
              UpcomingScreen.route,
              arguments: upcomingMovies,
            );
          },
        ),
        BlocBuilder<UpcomingCubit, UpcomingState>(
          builder: (context, state) {
            if (state is UpcomingMoviesState) {
              upcomingMovies = state.upcoming;
              return SizedBox(
                height: hight * 0.35,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.upcoming.length,
                  itemBuilder: (context, index) {
                    MovieModel movie = state.upcoming[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          DetailsMoveisScreen.route,
                          arguments: movie.id,
                        );
                      },
                      child: ItemsWidget(movie: movie),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return CustomConstantWidget.verticalDivider();
                  },
                ),
              );
            } else {
              return CustomConstantWidget.indicator();
            }
          },
        ),
        _tittleCategoryMovies(
          text: "Trending actor on this week",
          onTap: () {},
        ),
        SizedBox(height: hight * 0.02),
        BlocBuilder<ActorsCubit, ActorsState>(
          builder: (context, state) {
            if (state is ActorsMoviesState) {
              return SizedBox(
                height: hight * 0.25,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.actors.length,
                  itemBuilder: (context, index) {
                    List<ActorsModel> actor = state.actors.where((element) {
                      return element.mediaType == "person";
                    }).toList();
                    return Column(
                      children: [
                        if (actor[index].name != "雷火剑")
                          CachedNetworkImage(
                            imageUrl:
                                "https://image.tmdb.org/t/p/w500${actor[index].profilePath}",
                            placeholder: (context, url) {
                              return CustomConstantWidget.indicator();
                            },
                            errorWidget: (context, url, error) {
                              return const Center(
                                child: Icon(Icons.error_outline),
                              );
                            },
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                height: hight * 0.16,
                                width: width * 0.32,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black45, width: 2),
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        SizedBox(height: hight * 0.01),
                        if (actor[index].name != "雷火剑")
                          Text(
                            actor[index].name.length > 19
                                ? "${actor[index].name.substring(0, 19)}...."
                                : actor[index].name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        if (actor[index].name != "雷火剑")
                          Text(
                            actor[index].knownForDepartment,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return CustomConstantWidget.verticalDivider();
                  },
                ),
              );
            } else {
              return CustomConstantWidget.indicator();
            }
          },
        ),
      ],
    );
  }

  Widget _tittleCategoryMovies({
    required String text,
    required Function() onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ),
        IconButton(
          onPressed: onTap,
          color: Colors.black87,
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
          ),
        ),
      ],
    );
  }
}
