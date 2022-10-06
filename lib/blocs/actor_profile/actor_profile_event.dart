part of 'actor_profile_bloc.dart';

abstract class ActorProfileEvent extends Equatable {
  final List<Object> _props;

  const ActorProfileEvent([this._props = const []]); 
  @override
  List<Object> get props => _props;
}


class NewActorProfileEvent extends ActorProfileEvent {
  final String actorBiography;
  final List<Movie> movies;
  NewActorProfileEvent({
    required this.actorBiography, 
    required this.movies
  }) : super([ actorBiography, movies]);
}