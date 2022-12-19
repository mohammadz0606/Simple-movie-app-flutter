class ActorsModel {
  late final dynamic id;
  late final String name;
  late final String originalName;
  late final String mediaType;
  late final double popularity;
  late final int gender;
  late final String knownForDepartment;
  late final String profilePath;

  ActorsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].toString();
    originalName = json['original_name'].toString();
    mediaType = json['media_type'].toString();
    popularity = json['popularity'];
    gender = json['gender'];
    knownForDepartment = json['known_for_department'].toString();
    profilePath = json['profile_path'].toString();
  }
}
