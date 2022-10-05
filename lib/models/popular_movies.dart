import 'dart:convert';

class PopularMovies {

  PopularMovies({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalMovies,
  });

  final int page;
  final List<Movie> movies;
  final int totalPages;
  final int totalMovies;

  factory PopularMovies.fromJson(String str) => PopularMovies.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PopularMovies.fromMap(Map<String, dynamic> json) => PopularMovies(
    page: json["page"],
    movies: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalMovies: json["total_results"],
  );

  Map<String, dynamic> toMap() => {
    "page": page,
    "results": List<dynamic>.from(movies.map((x) => x.toMap())),
    "total_pages": totalPages,
    "total_results": totalMovies,
  };
}

class Movie {
  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    String? mediaType,
    this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    double? popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,

    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  }) :
    mediaType = mediaType ?? '',
    popularity = popularity ?? 0.0; 

  final bool adult;
  final dynamic backdropPath;
  final List<int> genreIds;
  final int id;
  final String mediaType;
  final OriginalLanguage? originalLanguage;
  final String originalTitle;
  final String overview;
  final double? popularity;
  final dynamic posterPath;
  final dynamic releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  final String? character;
  final String? creditId;
  final int? order;
  final Department? department;
  final Job? job;
     
  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
    adult: json["adult"],
    backdropPath: json["backdrop_path"] ?? '',
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    mediaType: json["media_type"] ?? '',
    originalLanguage: originalLanguageValues.map[json["original_language"]],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"] == null ? 0.0 : json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    releaseDate: json["release_date"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],

    character: json["character"],
    creditId: json["credit_id"],
    order: json["order"],
    department: departmentValues.map[json["department"]],
    job: jobValues.map[json["job"]],
  );

  Map<String, dynamic> toMap() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "media_type": mediaType,
    "original_language": originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,

    "character": character,
    "credit_id": creditId,
    "order": order,
    "department": departmentValues.reverse[department],
    "job": job == null ? null : jobValues.reverse[job],
  };

  get fullPostering { 
    return posterPath != null 
      ? 'https://image.tmdb.org/t/p/w500$posterPath' 
      : 'https://i.stack.imgur.com/GNhxO.png';
  }
 
  get fullBackdropPath {
    return backdropPath != null 
      ? 'https://image.tmdb.org/t/p/w500$backdropPath' 
      : 'https://i.stack.imgur.com/GNhxO.png';
  }

}


enum Department { PRODUCTION, WRITING }

final departmentValues = EnumValues({
    "Production": Department.PRODUCTION,
    "Writing": Department.WRITING
});

enum Job { EXECUTIVE_PRODUCER, PRODUCER, SCREENPLAY, WRITER }

final jobValues = EnumValues({
    "Executive Producer": Job.EXECUTIVE_PRODUCER,
    "Producer": Job.PRODUCER,
    "Screenplay": Job.SCREENPLAY,
    "Writer": Job.WRITER
});


enum OriginalLanguage { en, es, ja, te }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.en,
  "es": OriginalLanguage.es,
  "ja": OriginalLanguage.ja,
  "te": OriginalLanguage.te
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse => reverseMap;

}
