import 'package:flutter/material.dart';

import '../json_test/json_test.dart';
import '../models/credits_by_idmovie.dart';
import '../models/popular_movies.dart';
import '../widgets/leading_widget.dart';

class DetailsPage extends StatelessWidget {
   
  const DetailsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print('jean movie: ${movie}');

    // final CreditsByIdMovie creditsByIdMovie = CreditsByIdMovie.fromJson(JsonTest.creditsByMovieId);  

    // print('jean: ${creditsByIdMovie.cast. }');

    return SafeArea(
      child: Scaffold(  
        body: SingleChildScrollView(
          child: Stack(
            children: [


              Hero(
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


              const Center(
                child: Text( 
                  'Hola mundo',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50, height: 1.5),
                )
              ),


              Positioned(
                top: 10,
                left: 4,
                child: LeadingWidget( 
                  icon: Icons.close,
                  color: const Color.fromARGB(255, 221, 221, 221), 
                  onPressed: () { 
                    print('jean: Precionado Boton');
                  },
                ),
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}


class _MoviePoster extends StatelessWidget {
  
  final Movie movie;
  final Cast credits;
  final int index;
  
  const _MoviePoster({
    Key? key,   
    required this.movie, 
    required this.credits,
    required this.index, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int parImpar = index % 2;
    // print('jean: ${parImpar}');
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), 
      ),
      padding: EdgeInsets.only(bottom: parImpar == 1 ? 0 : 25, top: parImpar == 1 ? 25 : 0),
      width: 150,
      height: 230,
      child: Stack(
        children:  [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'profile', arguments: movie),
            child: Hero(
              tag: movie.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(credits.fullProfilePath),
                  width: 140,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            child: Container(
              alignment: Alignment.bottomLeft,
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13, height: 1.5), 
                  ),
                  Text(
                    '${(movie.voteAverage*10)}% User Score', 
                    maxLines: 1, 
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 10, height: 1) 
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}