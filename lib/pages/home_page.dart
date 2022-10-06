import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../blocs/popular_movies/popular_movies_bloc.dart';

import '../json_test/json_test.dart';

import '../models/popular_movies.dart';

import '../widgets/circular_progress_widget.dart';
import '../widgets/grid_view_builder_widget.dart';
import '../widgets/leading_widget.dart'; 

class HomePage extends StatefulWidget {
   
  const HomePage({Key? key}) : super(key: key);
 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController(); 
  late PopularMoviesBloc popularMoviesBloc;

  @override
  void initState() {
    popularMoviesBloc = BlocProvider.of<PopularMoviesBloc>(context);
    popularMoviesBloc.getPopularMoviesByPage();

    // scrollController.addListener(() { 
    //   // print('jean: Scroll Controller ${scrollController.offset}');
    //   final size = MediaQuery.of(context).size;
    //   // print('jean pantalla 1: ${ size.height }');  
    //   print('jean position pixels ${scrollController.position.pixels}'); // ver cuanto he recorrido del scroll
    //   print('jean position extent ${scrollController.position.maxScrollExtent}'); // ver el ancho total de este scroll
    //   if(scrollController.position.pixels >= (scrollController.position.maxScrollExtent-500)){
    //     // print('jean Debo recargar el scroll, llamar Provider');
    //     if(popularMoviesBloc.state.isLoading == false){
    //       print('jean: Cargando a la pagina ${(popularMoviesBloc.state.page + 1)}');
    //       // popularMoviesBloc.getPopularMoviesByPage( page: (popularMoviesBloc.state.page + 1) );
    //     }
    //   }
    // });
    super.initState();
  }
  @override
  void dispose() {
    print('jean: Haciendo dispoce en Home');
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    bool isLoading = false;

    // final PopularMoviesBloc popularMoviesBloc = BlocProvider.of<PopularMoviesBloc>(context);
    // popularMoviesBloc.getPopularMoviesByPage();
    // print('jean movies amount: ${popularMoviesBloc.state.movies.length}');

    final PopularMovies popularMovies = PopularMovies.fromJson( JsonTest.popularMovies );  
    final List<Movie> movies = popularMovies.movies; 

    // BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
    //   builder: (context, state) {
    //     return state.popularMovies == []
    //       ? const Center(child: CircularProgressIndicator())
    //       : GridViewBuilder(movies: state.popularMovies, heigthToLeftFree: 100);
    //   }
    // );


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
                    print('jean cargando pagina: ${state.isLoading}');
                    scrollController.addListener(() { 
                      print('jean position pixels ${scrollController.position.pixels}'); // ver cuanto he recorrido del scroll
                      print('jean position extent ${scrollController.position.maxScrollExtent}'); // ver el ancho total de este scroll
                      if(scrollController.position.pixels >= (scrollController.position.maxScrollExtent-500)){
                        // print('jean Debo recargar el scroll, llamar Provider');
                        if(state.isLoading == false){
                          // isLoading = true;
                          print('jean: Cargando a la pagina Antes ${(state.page)}'); 
                          print('jean: Cargando a la pagina ${(state.page + 1)}');
                          popularMoviesBloc.getPopularMoviesByPage( page: (state.page + 1) );
                        }
                      }
                    });
                    return state.movies.isEmpty
                      ? const CircularProgressMovie()
                      : GridViewBuilder( movies: state.movies, heigthToLeftFree: 100, scrollController: scrollController );
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
