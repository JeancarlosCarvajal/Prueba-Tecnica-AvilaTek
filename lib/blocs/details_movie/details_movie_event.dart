part of 'details_movie_bloc.dart';

abstract class DetailsMovieEvent extends Equatable {
  final List<Object> _props;

  const DetailsMovieEvent([this._props = const []]); 
  @override
  List<Object> get props => _props;
}


class GetCreditsMovieByIdEvent extends DetailsMovieEvent {
  final List<Cast> castActors;
  GetCreditsMovieByIdEvent({ required this.castActors }) : super([ castActors ]);
}