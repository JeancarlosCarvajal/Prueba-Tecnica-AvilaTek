part of 'details_movie_bloc.dart';

class DetailsMovieState extends Equatable {

  final List<Cast> castActors;

  const DetailsMovieState({
    required this.castActors,
  });
  
  @override
  List<Object> get props => [ castActors ];

  DetailsMovieState copyWidth({ 
    List<Cast>? castActors,
  }) => DetailsMovieState(
    castActors: castActors ?? this.castActors,
  ); 

} 
