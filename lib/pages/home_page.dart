import 'package:flutter/material.dart';

import '../json_test/json_test.dart';

import '../models/popular_movies.dart'; 

import '../widgets/grid_view_builder_widget.dart';
import '../widgets/leading_widget.dart'; 

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final PopularMovies popularMovies = PopularMovies.fromJson( JsonTest.popularMovies );  
    final List<Movie> movies = popularMovies.movies; 

    print('jean: ${popularMovies.movies.length}');

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
                child: GridViewBuilder(movies: movies, heigthToLeftFree: 100)
              ),
            
            ],
          ),
        ),

      ),
    );
  }
}
 