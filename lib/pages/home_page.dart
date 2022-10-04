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
    print('jean: ${popularMovies.movies.length}');
    return SafeArea(
      child: Scaffold( 
        appBar: AppBar(
          toolbarHeight: 100,
          leadingWidth: 100,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: LeadingWidget(
            icon: Icons.menu,
            margin: 37,
            onPressed: () { 
              print('jean: Precionado Boton');
            },
           ), 
          centerTitle: true,
          title: const Text( 'Latest', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black) ),
        ), 
        body: GridViewBuilder(movies: popularMovies.movies),
      ),
    );
  }
}
 