part of 'popular_movies_bloc.dart';

class PopularMoviesState extends Equatable {

  final List<Movie> movies;
  final int currentPage;
  final bool isLoading;
  final int totalPages;

  const PopularMoviesState({
    required this.movies,
    required this.currentPage, 
    required this.isLoading,
    required this.totalPages
  });
  
  @override
  List<Object> get props => [ movies, currentPage, isLoading, totalPages ];

  PopularMoviesState copyWidth({ 
    List<Movie>? movies,
    int? currentPage,
    bool? isLoading,
    int? totalPages,
  }) => PopularMoviesState(
    movies: movies ?? this.movies,
    currentPage: currentPage ?? this.currentPage,
    isLoading: isLoading ?? this.isLoading,
    totalPages: totalPages ?? this.totalPages
  );

}
