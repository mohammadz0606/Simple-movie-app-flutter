import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant/constant_widget.dart';
import 'package:movie_app/controller/details_movies/details_cubit.dart';

import '../controller/cast_movies/cast_cubit.dart';
import '../controller/crews_movies/crews_cubit.dart';
import '../controller/sreenshot_movies_image/movies_image_cubit.dart';

class DetailsMoveisScreen extends StatefulWidget {
  static const String route = "details_movies_screen";
  const DetailsMoveisScreen({Key? key}) : super(key: key);

  @override
  State<DetailsMoveisScreen> createState() => _DetailsMoveisScreenState();
}

class _DetailsMoveisScreenState extends State<DetailsMoveisScreen> {
  @override
  void didChangeDependencies() {
    int movieId = ModalRoute.of(context)!.settings.arguments as int;
    BlocProvider.of<DetailsCubit>(context).getDetailsMovies(
      movieId: movieId,
    );
    BlocProvider.of<MoviesImageCubit>(context).getScreenshotMovies(
      movieId: movieId,
    );
    BlocProvider.of<CastCubit>(context).getCastMovies(
      movieId: movieId,
    );
    BlocProvider.of<CrewsCubit>(context).getCrewMovies(
      movieId: movieId,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is GetDetailsMovies) {
          return Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  expandedHeight: 450,
                  pinned: true,
                  stretch: true,
                  backgroundColor: Colors.transparent,
                  leading: const BackButton(
                    color: Colors.white,
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      state.detailsMovies.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    background: CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500${state.detailsMovies.backdropPath}",
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return CustomConstantWidget.indicator();
                      },
                      imageBuilder: (context, imageProvider) {
                        return Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(-0.1, 0),
                              child: IconButton(
                                onPressed: () {},
                                color: Colors.amber.shade800,
                                icon: const Icon(
                                  Icons.play_circle_outlined,
                                  size: 67,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.5,
                          horizontal: 9,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _bulidTextTitle(text: "Overview"),
                            SizedBox(height: hight * 0.012),
                            Text(
                              state.detailsMovies.overview,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: hight * 0.021),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _bulidManyItems(
                                  hight: hight,
                                  text: "release date",
                                  textData: state.detailsMovies.releaseDate,
                                ),
                                _bulidManyItems(
                                  hight: hight,
                                  text: "run time",
                                  textData:
                                      state.detailsMovies.runtime.toString(),
                                ),
                                _bulidManyItems(
                                  hight: hight,
                                  text: "budget",
                                  textData:
                                      state.detailsMovies.budget.toString(),
                                ),
                              ],
                            ),
                            SizedBox(height: hight * 0.021),
                            _bulidTextTitle(text: "Screenshot"),
                            SizedBox(height: hight * 0.012),
                            BlocBuilder<MoviesImageCubit, MoviesImageState>(
                              builder: (context, state) {
                                if (state is GetScreenshotMovies) {
                                  return SizedBox(
                                    height: hight * 0.2,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        var image = state.screenshots[index];
                                        return Card(
                                          elevation: 0,
                                          borderOnForeground: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  "https://image.tmdb.org/t/p/w500${image.filePath}",
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) {
                                                return CustomConstantWidget
                                                    .indicator();
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return CustomConstantWidget
                                            .verticalDivider();
                                      },
                                      itemCount: state.screenshots.length,
                                    ),
                                  );
                                } else {
                                  return CustomConstantWidget.indicator();
                                }
                              },
                            ),
                            SizedBox(height: hight * 0.021),
                            _bulidTextTitle(text: "Casts"),
                            SizedBox(height: hight * 0.012),
                            BlocBuilder<CastCubit, CastState>(
                              builder: (context, state) {
                                if (state is GetCastMovies) {
                                  return SizedBox(
                                    height: hight * 0.20,
                                    width: double.infinity,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        var cast = state.casts[index];
                                        return Column(
                                          children: [
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://image.tmdb.org/t/p/w500${cast.profilePath}",
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) {
                                                  return CustomConstantWidget
                                                      .indicator();
                                                },
                                                errorWidget:
                                                    (context, url, error) {
                                                  return const Center(
                                                    child: Icon(
                                                        Icons.error_outline),
                                                  );
                                                },
                                                imageBuilder:
                                                    (context, imageProvider) {
                                                  return Container(
                                                    width: 105,
                                                    height: 105,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black45,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Text(
                                              cast.name.length > 19
                                                  ? "${cast.name.substring(0, 19)}...."
                                                  : cast.name,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              cast.character.length > 17
                                                  ? "${cast.character.substring(0, 17)}..."
                                                  : cast.character,
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
                                        return CustomConstantWidget
                                            .verticalDivider();
                                      },
                                      itemCount: state.casts.length,
                                    ),
                                  );
                                } else {
                                  return CustomConstantWidget.indicator();
                                }
                              },
                            ),
                            SizedBox(height: hight * 0.021),
                            _bulidTextTitle(text: "Crew"),
                            SizedBox(height: hight * 0.012),
                            BlocBuilder<CrewsCubit, CrewsState>(
                              builder: (context, state) {
                                if (state is GetCrewMoviesState) {
                                  return SizedBox(
                                      height: hight * 0.20,
                                      width: double.infinity,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          var crews = state.crews[index];
                                          return Column(
                                            children: [
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "https://image.tmdb.org/t/p/w500${crews.profilePath}",
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) {
                                                    return CustomConstantWidget
                                                        .indicator();
                                                  },
                                                  errorWidget:
                                                      (context, url, error) {
                                                    return const Center(
                                                      child: Icon(
                                                          Icons.error_outline),
                                                    );
                                                  },
                                                  imageBuilder:
                                                      (context, imageProvider) {
                                                    return Container(
                                                      width: 105,
                                                      height: 105,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black45,
                                                            width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Text(
                                                crews.name.length > 19
                                                    ? "${crews.name.substring(0, 19)}...."
                                                    : crews.name,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                crews.job.length > 17
                                                    ? "${crews.job.substring(0, 17)}..."
                                                    : crews.job,
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
                                          return CustomConstantWidget
                                              .verticalDivider();
                                        },
                                        itemCount: state.crews.length,
                                      ));
                                } else {
                                  return CustomConstantWidget.indicator();
                                }
                              },
                            ),
                            const SizedBox(height: 200),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: CustomConstantWidget.indicator(),
          );
        }
      },
    );
  }

  Column _bulidManyItems({
    required double hight,
    required String text,
    required String textData,
  }) {
    return Column(
      children: [
        Text(
          text.toUpperCase(),
          style: const TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: hight * 0.011),
        Text(
          textData,
          style: TextStyle(
            color: Colors.amber.shade800,
          ),
        ),
      ],
    );
  }

  Text _bulidTextTitle({required String text}) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.2,
      ),
    );
  }
}
