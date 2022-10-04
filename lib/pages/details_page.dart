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
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: LeadingWidget( 
            icon: Icons.close,
            color: const Color.fromARGB(255, 202, 202, 202), 
            onPressed: () { 
              print('jean: Precionado Boton');
            },
           ), 
          centerTitle: true,
          title: const Text( 'Latest', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black) ),
        ), 
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                // opacity: 1,
                image: NetworkImage(movie.fullPostering),
                fit: BoxFit.cover
              ),
            ),
            alignment: Alignment.center, 
            height: MediaQuery.of(context).size.height - 80,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Center(child: Text( 'Hola mundo' )),
            
            // GridView.builder(
            //   itemCount: creditsByIdMovie.cast.length >= 3 ? 3 : creditsByIdMovie.cast.length,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     mainAxisExtent: 250,
            //     crossAxisSpacing: 15, // entre columnas
            //     // mainAxisSpacing: 10, // arriba abajo 
            //   ),
            //   itemBuilder: (BuildContext context, int index) { 
            //     return _MoviePoster(credits: creditsByIdMovie.cast[index], index: index, movie: movie,); 
            //   },   
            // ),

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