import 'package:flutter/material.dart';

import '../model/movie_model.dart';
import 'items_search_widget.dart';

class Searched extends SearchDelegate {
  final List<MovieModel> movies;
  Searched({
    required this.movies,
  });
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<MovieModel> fillterMovies = movies.where((element) {
      return element.title.startsWith(query) || element.title.contains(query);
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: query.isEmpty ? movies.length : fillterMovies.length,
        itemBuilder: (context, index) {
          var moviesdata = query.isEmpty ? movies[index] : fillterMovies[index];
          return SearchItemsWidget(movies: moviesdata);
        },
      ),
    );
  }
}
