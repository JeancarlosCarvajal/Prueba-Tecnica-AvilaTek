import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'details_movie_event.dart';
part 'details_movie_state.dart';

class DetailsMovieBloc extends Bloc<DetailsMovieEvent, DetailsMovieState> {
  DetailsMovieBloc() : super(DetailsMovieInitial()) {
    on<DetailsMovieEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
