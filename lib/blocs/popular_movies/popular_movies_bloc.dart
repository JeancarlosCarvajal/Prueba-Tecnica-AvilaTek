import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/popular_movies.dart';
import '../../services/popular_movies_api.dart'; 

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc() : super( const PopularMoviesState( movies: [], isLoading: false, page: 0 ) ) {

    on<GetPopularMoviesEvent>((event, emit) => emit(state.copyWidth(
      movies: [ ...state.movies, ...event.movies ],
      page: event.page,
      isLoading: event.isLoading
    )));

    on<IsLoadingEvent>((event, emit) => emit(state.copyWidth(
      isLoading: event.isLoading
    )));
    
  }

  Future<void> getPopularMoviesByPage({ int page = 1 }) async {
    if( page > state.page && state.isLoading == false ){
      // print('jean: Cargando Populares desde la API ${state.isLoading}');
      print('jean: API Cargando Populares Pagina ${page}');
      add(IsLoadingEvent(isLoading: true));
      final dynamic resp = await PopularMoviesApi.getPopularMoviesJsonData( page: page );
      if(resp == false) return;
      final PopularMovies popularMovies = PopularMovies.fromJson(resp);
      final List<Movie> movies = popularMovies.movies; 
      print('jean: manejando estado pagin $page');
      add(GetPopularMoviesEvent( movies: movies, page: page, isLoading: false )); 
    }
  } 

}
