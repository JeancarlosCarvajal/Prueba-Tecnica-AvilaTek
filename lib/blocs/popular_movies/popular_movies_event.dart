part of 'popular_movies_bloc.dart';

abstract class PopularMoviesEvent extends Equatable {
  final List<Object> _props;

  const PopularMoviesEvent([this._props = const []]); 
  @override
  List<Object> get props => _props;
}


class GetPopularMoviesEvent extends PopularMoviesEvent {
  final List<Movie> movies; 
  final int currentPage;
  final bool isLoading;
  final int totalPages;
  GetPopularMoviesEvent({ 
    required this.movies, 
    required this.currentPage,
    required this.isLoading,
    required this.totalPages
  }) : super([ movies, currentPage, isLoading, totalPages ]);
}

class IsLoadingEvent extends PopularMoviesEvent {
  final bool isLoading; 
  IsLoadingEvent({ required this.isLoading }) : super([ isLoading ]);
} 