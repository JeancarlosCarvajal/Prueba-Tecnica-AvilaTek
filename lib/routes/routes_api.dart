import 'package:flutter_dotenv/flutter_dotenv.dart';

class RoutesAPI {

  static String? get apiKEY          => dotenv.env['API_KEY'];
  static String  get language        => 'en-US';
  static String  get baseURL         => 'api.themoviedb.org';
  static String  get popularMoviesEndPoint => '/3/movie/popular';
  static String movieDetailsEndPont({ required String movieId }) => '/3/movie/$movieId/credits';
  static String actorProfileByIdEndPont({ required int actorId }) => '/3/person/$actorId';
  // static String  get moviesByActorEndPoint   => '/3/search/person';

}