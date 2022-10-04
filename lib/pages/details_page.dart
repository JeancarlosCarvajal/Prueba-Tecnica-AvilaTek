import 'package:flutter/material.dart';

import '../json_test/json_test.dart';

import '../models/credits_by_idmovie.dart';
import '../models/popular_movies.dart';

import '../routes/routes_app.dart';

import '../widgets/leading_widget.dart';
import '../widgets/title_sub_title.dart';

class DetailsPage extends StatelessWidget {
   
  const DetailsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    // print('jean movie: ${movie}');
    // print('jean: ${JsonTest.creditsByMovieId}');
    final CreditsByIdMovie creditsByIdMovie = CreditsByIdMovie.fromJson( JsonTest.creditsByMovieId );  
    final List<Cast> castActors = creditsByIdMovie.cast.toList();
    print('jean: ${castActors.length}');
    return SafeArea(
      child: Scaffold(  
        body: Stack(
          children: [ 


            GestureDetector(
              onTap: () {
                print('jean: Click al Gesture Detector');
              },
              child: Hero(
                tag: movie.id,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage( 
                      image: NetworkImage(movie.fullPostering),
                      fit: BoxFit.cover
                    ),
                  ),
                  alignment: Alignment.center, 
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,  
                ),
              ),
            ), 
          

            Visibility(
              visible: true,
              child: Positioned(
                top: 25,
                left: 12,
                child: LeadingWidget( 
                  icon: Icons.close,
                  color: const Color.fromARGB(255, 195, 195, 195), 
                  onPressed: () { 
                    print('jean: Precionado Boton de la equis');
                  },
                ),
              ),
            ), 


            Visibility(
              visible: true,
              child: Positioned(
                bottom: 0,
                height: 250,
                child: _MovieTitleAndActos(movie: movie, castActors: castActors),
              ),
            ), 
            


          ],
        ),
      ),
    );
  }
}


class _MovieTitleAndActos extends StatelessWidget {
  const _MovieTitleAndActos({
    Key? key,
    required this.movie,
    required this.castActors,
  }) : super(key: key);

  final Movie movie;
  final List<Cast> castActors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ 
        Container(
          color: Colors.black.withOpacity(0.4), 
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 20, bottom: 0, left: 15, right: 15),
          child: TitleSubTitle(
            title: movie.title, 
            subTitle: movie.voteAverage, 
            isAverage: true, 
            sizeTitle: 35, 
            sizeSubTitle: 17, 
            maxLinesTitle: 1, 
            maxLinesSubTitle: 1, 
            heightTitle: 1.3,
          ),
        ), 
        Positioned(
          bottom: 0,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 170,
            child:   
            ListView.builder( 
              itemExtent: MediaQuery.of(context).size.width / 3,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: castActors.length >= 3 ? 3 : castActors.length,
              itemBuilder: (BuildContext context, int index) {
                  return _ActorPoster( actor: castActors[index] );
                },
              ), 
          )
        ) 
      ],
    );
  }
}


class _ActorPoster extends StatelessWidget {
  
  final Cast actor;
  
  const _ActorPoster({
    Key? key,  
    required this.actor, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), 
      ),
      width: 150,
      height: 230,
      child: Stack(
        children:  [
          GestureDetector(
            onTap: () => Navigator.pushNamed( context, RouteNames.profile, arguments: actor ),
            child: Hero(
              tag: actor.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(actor.fullProfilePath),
                  width: 110,
                  height: 138,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            child: TitleSubTitle(
              title: actor.name, 
              subTitle: actor.character, 
              isAverage: true, 
              sizeTitle: 10, 
              sizeSubTitle: 8, 
              maxLinesTitle: 1, 
              maxLinesSubTitle: 1, 
              width: 90,
            ),
          )
        ],
      ),
    );
  }
}
