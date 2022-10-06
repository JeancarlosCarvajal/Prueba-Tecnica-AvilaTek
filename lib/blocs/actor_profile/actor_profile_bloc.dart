import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/actor_profile_by_id.dart';

import '../../models/popular_movies.dart';

import '../../services/actor_profile_by_id_api.dart';

part 'actor_profile_event.dart';
part 'actor_profile_state.dart';

class ActorProfileBloc extends Bloc<ActorProfileEvent, ActorProfileState> {
  ActorProfileBloc() : super(const ActorProfileState(actorBiography: '', movies: [])) {

    on<NewActorProfileEvent>((event, emit) => emit(state.copyWidth(
      actorBiography: event.actorBiography,
      movies: event.movies
    )));
    
  }

  Future<void> getNewActorProfileById({ required int actorId }) async {
    add(NewActorProfileEvent( actorBiography: '', movies: const [] ));  
    final dynamic resp = await ActorProfileByIdApi.getActorProfileByIdJsonData(actorId: actorId);
    if(resp == false) return;
    final ActorProfileById actorProfileById = ActorProfileById.fromJson(resp);
    final String biography = actorProfileById.biography; 
    final List<Movie> movies = actorProfileById.credits.cast; 
    add(NewActorProfileEvent( actorBiography: biography, movies: movies ));  
  } 

}
