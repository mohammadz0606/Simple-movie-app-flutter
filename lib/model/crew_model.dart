class CrewModel {
  late final dynamic id;
  late final String knownForDepartment;
  late final String name;
  late final String originalName;
  late final double popularity;
  late final String profilePath;
  late final String creditId;
  late final String department;
  late final String job;

  CrewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    knownForDepartment = json['known_for_department'].toString();
    name = json['name'].toString();
    originalName = json['original_name'].toString();
    popularity = json['popularity'];
    profilePath = json['profile_path'].toString();
    creditId = json['credit_id'].toString();
    department = json['department'].toString();
    job = json['job'].toString();
  }
}
