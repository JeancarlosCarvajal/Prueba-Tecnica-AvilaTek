part of 'popular_movies_bloc.dart';

class PopularMoviesState extends Equatable {

  final List<Movie> movies;
  final int page;

  const PopularMoviesState({
    required this.movies,
    int? page, 
  }) :
    page = page ?? 1;
  
  @override
  List<Object> get props => [ movies ];

  PopularMoviesState copyWidth({ 
    List<Movie>? movies,
    int? page
  }) => PopularMoviesState(
    movies: movies ?? this.movies,
    page: page ?? this.page
  );

}
