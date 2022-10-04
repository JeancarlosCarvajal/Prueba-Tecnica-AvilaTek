import 'package:flutter/material.dart'; 

import '../json_test/json_test.dart';

import '../models/credits_by_idmovie.dart';
import '../models/movies_by_actor.dart';
import '../models/popular_movies.dart'; 

import '../widgets/grid_view_builder_widget.dart';
import '../widgets/leading_widget.dart'; 

class ProfilePage extends StatelessWidget {

  const ProfilePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Cast actor = ModalRoute.of(context)!.settings.arguments as Cast;
    // final   test = JsonTest.moviesByActor;
    final MoviesByActor moviesByActor = MoviesByActor.fromMap( JsonTest.moviesByActor );  
    final List<Movie> moviesActors = moviesByActor.results.first.knownFor;
    print('jean: ${ moviesByActor.results.first.knownFor.length }');
    return SafeArea(
      child: Scaffold( 
        body: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 320, 
              child: _HeaderActor(actor: actor),
            ), 
            GridViewBuilder( movies: moviesActors, heigth: 370, bottom: 0 ), 
          ],
        ),
      ),
    );
  }
}

class _HeaderActor extends StatelessWidget {
  const _HeaderActor({
    Key? key,
    required this.actor,
  }) : super(key: key);

  final Cast actor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity, 
          child: LeadingWidget(
            icon: Icons.arrow_back_ios_new,
            margin: 37,
            onPressed: () {  
              Navigator.pop(context);
            },
          ),
        ),
        Row( 
          children: [
            Column(
              children: [
                Hero( 
                  tag: actor.id,
                  child: Container(
                    width: 90,
                    height: 90, 
                    padding: const EdgeInsets.all(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: FadeInImage(
                        placeholder: const AssetImage('assets/no-image.jpg'), 
                        image: NetworkImage( actor.fullProfilePath ), 
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 90, 
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 90, 
                    child: Text(
                      actor.name,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis, 
                      style: const TextStyle( color: Colors.black, fontWeight: FontWeight.bold), 
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 90, 
                    padding: const EdgeInsets.only(right: 20), 
                    child: const Text( 
                      // actor.name, // for test
                      'Duis Lorem amet irure ipsum cillum nostrud tempor. Sunt in aliquip tempor nostrud non mollit laboris. Nulla labore deserunt aute Lorem reprehenderit culpa esse consectetur tempor aliquip.',
                      maxLines: 4,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis, 
                      style: TextStyle( color: Colors.black, height: 1.3  ), 
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(bottom: 0),
          child: const Text( 'Casted on', style: TextStyle( fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black) )
        ), 
      ],
    );
  }
}

 
