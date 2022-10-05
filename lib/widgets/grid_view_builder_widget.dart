import 'package:flutter/material.dart';

import '../models/popular_movies.dart';
import '../routes/routes_app.dart';
import 'title_sub_title.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({
    Key? key, 
    required this.movies, 
    this.heigthToLeftFree = 100, 
    this.bottom = 65,
  }) : super(key: key);

  // final PopularMovies popularMovies;
  final List<Movie> movies;
  final double heigthToLeftFree;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        alignment: Alignment.center, 
        height: MediaQuery.of(context).size.height - heigthToLeftFree,
        width: double.infinity, 
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: bottom),
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 250,
            crossAxisSpacing: 15, 
          ),
          itemBuilder: (BuildContext context, int index) { 
            return _MoviePoster(movie: movies[index], index: index); 
          },   
        ),
      ),
    
    
    );
  }
}


class _MoviePoster extends StatelessWidget {
  
  final Movie movie;
  final int index;
  
  const _MoviePoster({
    Key? key,  
    required this.movie, 
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int parImpar = index % 2;
    // print('jean: ${parImpar}');
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), 
      ),
      padding: EdgeInsets.only(bottom: parImpar == 1 ? 0 : 25, top: parImpar == 1 ? 25 : 0),
      width: 150,
      // height: 230,
      child: Stack(
        children:  [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteNames.details, arguments: movie),
            child: Hero(
              tag: movie.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(movie.fullPostering),
                  width: 150,
                  // height: 230,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),


          Positioned(
            bottom: 5,
            left: 10,
            child: TitleSubTitle(
              title: movie.title, 
              subTitle: movie.voteAverage, 
              isAverage: true, 
              sizeTitle: 13, 
              sizeSubTitle: 10, 
              maxLinesTitle: 1, 
              maxLinesSubTitle: 1, 
            ),
          )


        ],
      ),
    );
  }
}

