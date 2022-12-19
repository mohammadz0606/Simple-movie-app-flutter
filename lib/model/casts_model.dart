class CastsModel {
  late final dynamic id;
  late final String knownForDepartment;
  late final String name;
  late final String originalName;
  late final double popularity;
  late final String profilePath;
  late final int castId;
  late final String character;
  late final String creditId;
  late final int order;

  CastsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    knownForDepartment = json['known_for_department'].toString();
    name = json['name'].toString();
    originalName = json['original_name'].toString();
    popularity = json['popularity'];
    profilePath = json['profile_path'].toString();
    castId = json['cast_id'];
    character = json['character'].toString();
    creditId = json['credit_id'].toString();
    order = json['order'];
  }
}
