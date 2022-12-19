import 'dart:convert';

import 'package:movie_app/model/actors_model.dart';
import 'package:movie_app/model/casts_model.dart';
import 'package:movie_app/model/crew_model.dart';
import 'package:movie_app/model/screenshot_model.dart';

import '../model/details_model.dart';
import '../model/movie_model.dart';
import 'package:http/http.dart' as http;

class WebServices {
  final String _baseUrl = "https://api.themoviedb.org/3";
  final String _key = "2ba5c535fbab6c354967c44dfb2142d4";

  Future<List<MovieModel>> getNowPlayingMovies() async {
    http.Response response = await http.get(
      Uri.parse("$_baseUrl/movie/now_playing?api_key=$_key"),
    );

    return (jsonDecode(response.body)["results"] as List).map((moviesData) {
      return MovieModel.fromJson(moviesData);
    }).toList();
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    http.Response response = await http.get(
      Uri.parse("$_baseUrl/movie/top_rated?api_key=$_key"),
    );

    return (jsonDecode(response.body)["results"] as List).map(
      (topRated) {
        return MovieModel.fromJson(topRated);
      },
    ).toList();
  }

  Future<List<MovieModel>> getPopularMovies() async {
    http.Response response = await http.get(
      Uri.parse("$_baseUrl/movie/popular?api_key=$_key"),
    );

    return (jsonDecode(response.body)["results"] as List).map(
      (popular) {
        return MovieModel.fromJson(popular);
      },
    ).toList();
  }

  Future<List<MovieModel>> getUpcomingMovies() async {
    http.Response response = await http.get(
      Uri.parse("$_baseUrl/movie/upcoming?api_key=$_key"),
    );
    return (jsonDecode(response.body)["results"] as List).map((upcoming) {
      return MovieModel.fromJson(upcoming);
    }).toList();
  }

  Future<List<ActorsModel>> getActorsMovies() async {
    http.Response response = await http.get(
      Uri.parse("$_baseUrl/trending/person/week?api_key=$_key"),
    );
    return (jsonDecode(response.body)["results"] as List).map((actors) {
      return ActorsModel.fromJson(actors);
    }).toList();
  }

  Future<DetailsMovies> getDetailsMovies({required int movieId}) async {
    http.Response response = await http.get(
      Uri.parse("$_baseUrl/movie/$movieId?api_key=$_key"),
    );
    return DetailsMovies.fromJson(jsonDecode(response.body));
  }

  Future<List<ScreenshotModel>> getScreenshotMovies({
    required int movieId,
  }) async {
    http.Response response = await http.get(
      Uri.parse("$_baseUrl/movie/$movieId/images?api_key=$_key"),
    );
    return (jsonDecode(response.body)["backdrops"] as List).map(
      (screenImage) {
        return ScreenshotModel.fromJson(screenImage);
      },
    ).toList();
  }

  Future<List<CastsModel>> getCastMovies({
    required int movieId,
  }) async {
    http.Response response = await http.get(
      Uri.parse("$_baseUrl/movie/$movieId/credits?api_key=$_key"),
    );

    return (jsonDecode(response.body)["cast"] as List).map(
      (creditsMovies) {
        return CastsModel.fromJson(creditsMovies);
      },
    ).toList();
  }

  Future<List<CrewModel>> getCrewMovies({
    required int movieId,
  }) async {
    http.Response response = await http.get(
      Uri.parse("$_baseUrl/movie/$movieId/credits?api_key=$_key"),
    );
    return (jsonDecode(response.body)["crew"] as List).map(
      (crewMovies) {
        return CrewModel.fromJson(crewMovies);
      },
    ).toList();
  }
}
