import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../blocs/popular_movies/popular_movies_bloc.dart';

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
    super.initState();
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {},
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
                    scrollController.addListener(() {
                      if(scrollController.position.pixels >= (scrollController.position.maxScrollExtent-500)){
                        if(state.isLoading == false){
                          popularMoviesBloc.getPopularMoviesByPage( page: (state.currentPage + 1) );
                        }
                      }
                    });
                    return state.movies.isEmpty
                      ? const CircularProgressMovie()
                      : GridViewBuilder( movies: state.movies, heigthToLeftFree: 100, scrollController: scrollController );
                  }
                )
              ),
            ],
          ),
        ),

      ),
    );
  }
}
