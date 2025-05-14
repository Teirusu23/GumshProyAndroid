class PopularModel {
  String backdropPath;
  int id;
  OriginalLanguage originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  PopularModel({
    required this.backdropPath,  //Qué indican las llaves. Indican que los parametros son nombrados, no son posicionales.
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

  factory
  PopularModel.fromMap(Map<String,dynamic> movie){
    return PopularModel(
      backdropPath: "https://image.tmdb.org/t/p/w500/${movie["background_path"]}" 
      ?? 'https://support.microsoft.com/images/en-us/9b313b0b-ea7c-400a-92cb-f725d84c83ba', 
      id: movie["id"], 
      originalLanguage: movie["original_language"], 
      originalTitle: movie["original_title"], 
      overview: movie["overview"], 
      popularity: movie["popularity"], 
      posterPath: movie["posterPath"], 
      releaseDate: movie["releaseDate"], 
      title: movie["title"], 
      video: movie["video"], 
      voteAverage: movie['vote_avarage'], 
      voteCount: movie["voteCount"]);
  }
}

enum OriginalLanguage {
  EN,
  JA
}
