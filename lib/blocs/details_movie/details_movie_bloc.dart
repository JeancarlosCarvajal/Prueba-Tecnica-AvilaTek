import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/models/credits_by_idmovie.dart';

import '../../services/details_movie_api.dart';

part 'details_movie_event.dart';
part 'details_movie_state.dart';

class DetailsMovieBloc extends Bloc<DetailsMovieEvent, DetailsMovieState> {
  DetailsMovieBloc() : super(const DetailsMovieState(castActors: [])) {

    on<GetCreditsMovieByIdEvent>((event, emit) => emit(state.copyWidth(
      castActors: event.castActors
    )));
    
  }

  Future<void> getDetailsMovieById({ int movieId = 1 }) async {
    add(GetCreditsMovieByIdEvent( castActors: const [] ));
    final dynamic resp = await DetailsMoviesApi.getDetailsMoviesJsonData( movieId: movieId  );
    if(resp == false) return;
    final CreditsByIdMovie creditsByIdMovie = CreditsByIdMovie.fromJson(resp);
    final List<Cast> castActors = creditsByIdMovie.cast.toList(); 
    add(GetCreditsMovieByIdEvent( castActors: castActors ));  
  }

}
