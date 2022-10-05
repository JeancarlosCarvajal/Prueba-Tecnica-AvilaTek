import 'dart:convert';

import '../models/popular_movies.dart';

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
  final List<Movie> knownFor;
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
    knownFor: List<Movie>.from(json["known_for"].map((x) => Movie.fromMap(x))),
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
