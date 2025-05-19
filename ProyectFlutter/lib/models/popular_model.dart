class PopularModel {
  String backdropPath;
  int id;
  String originalLanguage;
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
      backdropPath: 'https://image.tmdb.org/t/p/w500/${movie['backdrop_path']}' 
      ?? 'https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-5529.jpg', 
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