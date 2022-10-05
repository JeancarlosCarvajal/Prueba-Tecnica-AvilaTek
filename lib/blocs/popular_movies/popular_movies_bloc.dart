import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/popular_movies.dart';
import '../../services/popular_movies_api.dart'; 

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc() : super( const PopularMoviesState(popularMovies: []) ) {

    on<GetPopularMoviesEvent>((event, emit) => emit(state.copyWidth(
      popularMovies: [ ...event.movies, ...state.popularMovies ]
    )));
    
  }

  Future<void> getPopularMoviesByPage({ int page = 1 }) async {
    final dynamic resp = await PopularMoviesApi.getPopularMoviesJsonData( page: page );
    if(resp == false) return;
    final PopularMovies popularMovies = PopularMovies.fromJson(resp);
    final List<Movie> movies = popularMovies.movies; 
    add(GetPopularMoviesEvent( movies: movies ));  
  }

}
