import 'package:flutter_dotenv/flutter_dotenv.dart';

class RoutesAPI {

  static String? get apiKEY => dotenv.env['API_KEY'];
  static String get language => 'en-US';
  static String get baseURL => 'api.themoviedb.org';
  static String get popularEndPoint => '/3/movie/popular';
  static String detailsEndPont({ required String movieId }) => '/3/movie/$movieId/credits';
  static String get moviesByActor => '/3/search/person';

}