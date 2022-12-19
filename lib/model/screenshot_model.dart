class ScreenshotModel {
  late final double aspectRatio;
  late final int height;
  late final String filePath;
  late final double voteAverage;
  late final int voteCount;
  late final int width;

  ScreenshotModel.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    filePath = json['file_path'].toString();
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }
}
