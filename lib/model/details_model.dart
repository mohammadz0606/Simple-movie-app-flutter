class DetailsMovies {
  late final String backdropPath;
  late final int budget;
  late final String homepage;
  late final dynamic id;
  late final String imdbId;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final int revenue;
  late final int runtime;
  late final String status;
  late final String tagline;
  late final String title;
  late final double voteAverage;
  late final int voteCount;

  DetailsMovies.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'].toString();
    budget = json['budget'] as int;
    homepage = json['homepage'].toString();
    id = json['id'];
    imdbId = json['imdb_id'].toString();
    originalLanguage = json['original_language'].toString();
    originalTitle = json['original_title'].toString();
    overview = json['overview'].toString();
    popularity = json['popularity'];
    posterPath = json['poster_path'].toString();
    releaseDate = json['release_date'].toString();
    revenue = json['revenue'];
    runtime = json['runtime'];
    status = json['status'].toString();
    tagline = json['tagline'].toString();
    title = json['title'].toString();
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
