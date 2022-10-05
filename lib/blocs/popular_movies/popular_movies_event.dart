part of 'popular_movies_bloc.dart';

abstract class PopularMoviesEvent extends Equatable {
  final List<Object> _props;

  const PopularMoviesEvent([this._props = const []]); 
  @override
  List<Object> get props => _props;
}


class GetPopularMoviesEvent extends PopularMoviesEvent {
  final List<Movie> movies; 
  GetPopularMoviesEvent({ required this.movies }) : super([ movies ]);
}