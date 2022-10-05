part of 'popular_movies_bloc.dart';

class PopularMoviesState extends Equatable {

  final List<Movie> popularMovies;

  const PopularMoviesState({
    required this.popularMovies,
  });
  
  @override
  List<Object> get props => [ popularMovies ];


  PopularMoviesState copyWidth({ 
    List<Movie>? popularMovies,
  }) => PopularMoviesState(
    popularMovies: popularMovies ?? this.popularMovies,
  );

}
