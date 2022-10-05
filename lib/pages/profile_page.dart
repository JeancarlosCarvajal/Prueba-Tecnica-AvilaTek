import 'package:flutter/material.dart'; 

import '../json_test/json_test.dart';

import '../models/actor_profile_by_id.dart';
import '../models/credits_by_idmovie.dart';
import '../trash_can/movies_by_actor.dart';
import '../models/popular_movies.dart'; 

import '../widgets/grid_view_builder_widget.dart';
import '../widgets/leading_widget.dart'; 

class ProfilePage extends StatelessWidget {

  const ProfilePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Cast actor = ModalRoute.of(context)!.settings.arguments as Cast;
    // final   test = JsonTest.moviesByActor;
    // final MoviesByActor moviesByActor = MoviesByActor.fromMap( JsonTest.moviesByActor );  
    final ActorProfileById actorProfileById = ActorProfileById.fromMap( JsonTest.actorProfileById );  
    final String actorBiography = actorProfileById.biography;
    // final List<Movie> movies = moviesByActor.results.first.knownFor;
    final List<Movie> movies = actorProfileById.credits.cast;
    print('jean movies actor: ${ movies.length }'); 
    // print('jean castMovies actor: ${ castMovies.length }');
    return SafeArea(
      child: Scaffold( 
        body:  Column( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container( // 170 + 99 + 15 padding = 284
              height: 284, 
              padding: const EdgeInsets.only(bottom: 15),
              child: _HeaderActor(actor: actor, actorBiography: actorBiography),
            ),
            
            Flexible(
              flex: 1,
              child: GridViewBuilder(movies: movies, heigthToLeftFree: 284, bottom: 0)
            ),
          
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
    required this.actorBiography,
  }) : super(key: key);

  final Cast actor;
  final String actorBiography;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      Container( // boton azul alto = 99
        alignment: Alignment.topLeft,
        child: LeadingWidget( 
          icon: Icons.arrow_back_ios_new,
          margin: 37, // boton azul, 37x2 padding = 74 mas 25 diametro son 99 por aqui
          onPressed: () { 
            print('jean: Precionado Boton');
            Navigator.pop(context);
          },
        ),
      ),
      
      Container( // alto definido 130 + 40 = 170
        height: 170,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [  

            Row( // profile image and name-desc. alto 130
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox( // alto definido 130
                    height: 130,
                    child: Column( // profile image
                      children: [
                        Hero( 
                          tag: actor.id,
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(45),
                              child: FadeInImage(
                                placeholder: const AssetImage('assets/no-image.jpg'), 
                                image: NetworkImage( actor.fullProfilePath ), 
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ), 
                        const Spacer(), 
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container( // name-desc artist. alto igual que profile image 130
                    padding: const EdgeInsets.only(left: 10),
                    child: Column( 
                      children: [
                        Container( // Artist name
                          alignment: Alignment.topLeft, 
                          child: Text(
                            actor.name,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis, 
                            style: const TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, height: 1), 
                          ),
                        ),
                        Container( // Artist desc
                          alignment: Alignment.topLeft,  
                          padding: const EdgeInsets.only(top: 4),
                          child: Text( 
                            actorBiography, 
                            // 'Duis Lorem amet irure ipsum cillum nostrud tempor. Sunt in aliquip tempor nostrud non mollit laboris. Nulla labore deserunt aute Lorem reprehenderit culpa esse consectetur tempor aliquip.',
                            maxLines: 5,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis, 
                            style: TextStyle( color: Colors.black, height: 1.3  ), 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container( // casted on. alto 40
              width: double.infinity,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.only(bottom: 0),
              child: const Text( 'Casted on', style: TextStyle( fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black) )
            ), 
 
          ],
        )
      ),
      
      ],
    );
  }
}
 