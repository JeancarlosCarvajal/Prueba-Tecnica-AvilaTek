part of 'actor_profile_bloc.dart';

class ActorProfileState extends Equatable {

  final String actorBiography;
  final List<Movie> movies;

  const ActorProfileState({
    required this.actorBiography, 
    required this.movies
  });
  
  @override
  List<Object> get props => [ actorBiography, movies ];

  ActorProfileState copyWidth({ 
    String? actorBiography,
    List<Movie>? movies,
  }) => ActorProfileState(
    actorBiography : actorBiography ?? this.actorBiography,
    movies : movies ?? this.movies,
  ); 

}
