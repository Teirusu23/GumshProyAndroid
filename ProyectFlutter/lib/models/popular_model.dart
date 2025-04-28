class PopularModel {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  PopularModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

}

class Result {
  String backdropPath;
  int id;
  OriginalLanguage originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Result({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

}

enum OriginalLanguage {
  EN,
  JA
}
