part of 'popular_movies_bloc.dart';

class PopularMoviesState extends Equatable {

  final List<Movie> movies;
  final int page;
  final bool isLoading;

  const PopularMoviesState({
    required this.movies,
    required this.page, 
    required this.isLoading
  });
  
  @override
  List<Object> get props => [ movies, page, isLoading ];

  PopularMoviesState copyWidth({ 
    List<Movie>? movies,
    int? page,
    bool? isLoading
  }) => PopularMoviesState(
    movies: movies ?? this.movies,
    page: page ?? this.page,
    isLoading: isLoading ?? this.isLoading
  );

}
