import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/popular_movies.dart';

import '../../services/popular_movies_api.dart'; 

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc() : super( const PopularMoviesState( movies: [], isLoading: false, currentPage: 0, totalPages: 1 ) ) {

    on<GetPopularMoviesEvent>((event, emit) => emit(state.copyWidth(
      movies: [ ...state.movies, ...event.movies ],
      currentPage: event.currentPage,
      isLoading: event.isLoading,
      totalPages: event.totalPages
    )));

    on<IsLoadingEvent>((event, emit) => emit(state.copyWidth(
      isLoading: event.isLoading
    )));
    
  }

  Future<void> getPopularMoviesByPage({ int page = 1 }) async {
    if( page > state.currentPage && state.isLoading == false ){
      if( state.currentPage > state.totalPages ) return; 
      add(IsLoadingEvent(isLoading: true));
      final dynamic resp = await PopularMoviesApi.getPopularMoviesJsonData( page: page );
      if(resp == false) return;
      final PopularMovies popularMovies = PopularMovies.fromJson(resp);
      final List<Movie> movies = popularMovies.movies; 
      add(GetPopularMoviesEvent( movies: movies, currentPage: page, isLoading: false, totalPages: popularMovies.totalPages )); 
    }
  } 

}
