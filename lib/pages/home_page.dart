import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import '../blocs/popular_movies/popular_movies_bloc.dart';
import '../json_test/json_test.dart';
import '../models/popular_movies.dart';
import '../widgets/circular_progress_widget.dart';
import '../widgets/grid_view_builder_widget.dart';
import '../widgets/leading_widget.dart'; 

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final PopularMoviesBloc popularMoviesBloc = BlocProvider.of<PopularMoviesBloc>(context);
    // popularMoviesBloc.getPopularMoviesByPage();

    final PopularMovies popularMovies = PopularMovies.fromJson( JsonTest.popularMovies );  
    final List<Movie> movies = popularMovies.movies; 

          // BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          //   builder: (context, state) {
          //     return state.popularMovies == []
          //       ? const Center(child: CircularProgressIndicator())
          //       : GridViewBuilder(movies: state.popularMovies, heigthToLeftFree: 100);
          //   }
          // );

    print('jean movies amount: ${popularMoviesBloc.state.popularMovies.length}');

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SizedBox(
                height: 100, 
                child: Stack(
                  children: [
                  LeadingWidget(
                    icon: Icons.menu,
                    margin: 37,
                    onPressed: () { 
                      print('jean: Precionado Boton');
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Latest', 
                      textAlign: TextAlign.center, 
                      style: TextStyle( fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black) 
                    )
                  ),
                  ],
                ),
              ),

              Flexible(
                flex: 1,
                child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                  builder: (context, state) {
                    print('jean: ${state.popularMovies.length}');
                    return state.popularMovies.isEmpty
                      ? const CircularProgressMovie()
                      : GridViewBuilder(movies: state.popularMovies, heigthToLeftFree: 100);
                  }
                )
              ),
              
              // Flexible(
              //   flex: 1,
              //   child: GridViewBuilder(movies: movies, heigthToLeftFree: 100)
              // ),
            
            ],
          ),
        ),

      ),
    );
  }
}
