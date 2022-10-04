// To parse this JSON data, do
//
//     final moviesByActor = moviesByActorFromMap(jsonString);

import 'dart:convert';

class MoviesByActor {

  MoviesByActor({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  factory MoviesByActor.fromJson(String str) => MoviesByActor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MoviesByActor.fromMap(Map<String, dynamic> json) => MoviesByActor(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toMap() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toMap())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
  
}

class Result {

  Result({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.popularity,
    this.profilePath,
  });

  final bool adult;
  final int gender;
  final int id;
  final List<KnownFor> knownFor;
  final String knownForDepartment;
  final String name;
  final double popularity;
  final dynamic profilePath;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    adult: json["adult"],
    gender: json["gender"],
    id: json["id"],
    knownFor: List<KnownFor>.from(json["known_for"].map((x) => KnownFor.fromMap(x))),
    knownForDepartment: json["known_for_department"],
    name: json["name"],
    popularity: json["popularity"].toDouble(),
    profilePath: json["profile_path"],
  );

  Map<String, dynamic> toMap() => {
    "adult": adult,
    "gender": gender,
    "id": id,
    "known_for": List<dynamic>.from(knownFor.map((x) => x.toMap())),
    "known_for_department": knownForDepartment,
    "name": name,
    "popularity": popularity,
    "profile_path": profilePath,
  };

    get fullProfilePath { 
    return profilePath != null 
      ? 'https://image.tmdb.org/t/p/w500$profilePath' 
      : 'https://i.stack.imgur.com/GNhxO.png';
  } 
}

class KnownFor {
  KnownFor({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final dynamic backdropPath;
  final List<int> genreIds;
  final int id;
  final String mediaType;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final dynamic posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory KnownFor.fromJson(String str) => KnownFor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KnownFor.fromMap(Map<String, dynamic> json) => KnownFor(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    mediaType: json["media_type"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    releaseDate: DateTime.parse(json["release_date"]),
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toMap() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "media_type": mediaType,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "poster_path": posterPath,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
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
