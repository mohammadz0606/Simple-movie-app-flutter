class MovieModel {
  late final String backdropPath;
  late final dynamic id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final dynamic voteAverage;
  late final int voteCount;

  MovieModel.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'].toString();
    id = json['id'];
    originalLanguage = json['original_language'].toString();
    originalTitle = json['original_title'].toString();
    overview = json['overview'].toString();
    popularity = json['popularity'];
    posterPath = json['poster_path'].toString();
    releaseDate = json['release_date'].toString();
    title = json['title'].toString();
    video = json['video'] as bool;
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
