
import 'package:http/http.dart' as http;

import '../routes/routes_api.dart';


class DetailsMoviesApi {

  static Future<dynamic> getDetailsMoviesJsonData({ required int movieId }) async {
    try {
      var url = Uri.https( 
        RoutesAPI.baseURL, 
        RoutesAPI.movieDetailsEndPont(movieId: movieId.toString()), {
          'api_key': RoutesAPI.apiKEY,
          'language': RoutesAPI.language, 
        }
      );
      print('jean: ${url}');
      final responce = await http.get(url);
      print('jean movieDetailsEndPont: ${responce.statusCode}');
      if(responce.statusCode != 200) return false; 
      return responce.body;
    } catch (e) {
      print('jean error movieDetailsEndPont: ${e.toString()}');
      return false;
    }
  }

}