import 'dart:convert';

import 'popular_movies.dart';

class ActorProfileById {
    ActorProfileById({
      required this.adult,
      required this.alsoKnownAs,
      required this.biography,
      this.birthday,
      this.deathday,
      required this.gender,
      this.homepage,
      required this.id,
      required this.imdbId,
      required this.knownForDepartment,
      required this.name,
      this.placeOfBirth,
      required this.popularity,
      this.profilePath,
      required this.credits,
    });

    final bool adult;
    final List<String> alsoKnownAs;
    final String biography;
    final dynamic birthday;
    final dynamic deathday;
    final int gender;
    final String? homepage;
    final int id;
    final String imdbId;
    final String knownForDepartment;
    final String name;
    final String? placeOfBirth;
    final double popularity;
    final String? profilePath;
    final Credits credits;

    factory ActorProfileById.fromJson(String str) => ActorProfileById.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ActorProfileById.fromMap(Map<String, dynamic> json) => ActorProfileById(
        adult: json["adult"],
        alsoKnownAs: List<String>.from(json["also_known_as"].map((x) => x)),
        biography: json["biography"],
        birthday: json["birthday"] != null ? DateTime.parse(json["birthday"]) : '',
        deathday: json["deathday"] ?? '',
        gender: json["gender"],
        homepage: json["homepage"] ?? '',
        id: json["id"],
        imdbId: json["imdb_id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"] ?? '',
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
        credits: Credits.fromMap(json["credits"]),
    );

    get fullProfilePath { 
      return profilePath != null 
        ? 'https://image.tmdb.org/t/p/w500$profilePath' 
        : 'https://i.stack.imgur.com/GNhxO.png';
    } 

    Map<String, dynamic> toMap() => {
        "adult": adult,
        "also_known_as": List<dynamic>.from(alsoKnownAs.map((x) => x)),
        "biography": biography,
        "birthday": birthday != null ? "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}" : '',
        "deathday": deathday,
        "gender": gender,
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "known_for_department": knownForDepartment,
        "name": name,
        "place_of_birth": placeOfBirth,
        "popularity": popularity,
        "profile_path": profilePath,
        "credits": credits.toMap(),
    };
}

class Credits {
    Credits({
      required this.cast,
      required this.crew,
    });

    final List<Movie> cast;
    final List<Movie> crew;

    factory Credits.fromJson(String str) => Credits.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Credits.fromMap(Map<String, dynamic> json) => Credits(
        cast: List<Movie>.from(json["cast"].map((x) => Movie.fromMap(x))),
        crew: List<Movie>.from(json["crew"].map((x) => Movie.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "cast": List<dynamic>.from(cast.map((x) => x.toMap())),
        "crew": List<dynamic>.from(crew.map((x) => x.toMap())),
    };
}
