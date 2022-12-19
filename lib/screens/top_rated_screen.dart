// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";

import 'package:movie_app/model/movie_model.dart';

import '../widget/items_search_widget.dart';
import '../widget/searched_movies.dart';

class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({Key? key}) : super(key: key);
  static const String route = "top_rated_screen";

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> dataMovies =
        ModalRoute.of(context)!.settings.arguments as List<MovieModel>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top rated movies".toUpperCase(),
          style: const TextStyle(
            color: Colors.black45,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: Searched(movies: dataMovies),
              );
            },
            color: Colors.black87,
            icon: const Icon(
              Icons.search_outlined,
            ),
          ),
          const SizedBox(width: 4.2),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: dataMovies.length,
          itemBuilder: (context, index) {
            MovieModel movies = dataMovies[index];
            return SearchItemsWidget(movies: movies);
          },
        ),
      ),
    );
  }
}
