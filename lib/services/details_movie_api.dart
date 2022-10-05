
import 'package:http/http.dart' as http;

import '../routes/routes_api.dart';


class DetailsMoviesApi {

  static Future<dynamic> getDetailsMoviesJsonData({ required movieId }) async {
    try {
      var url = Uri.https( 
        RoutesAPI.baseURL, 
        RoutesAPI.movieDetailsEndPont(movieId: movieId), {
          'api_key': RoutesAPI.apiKEY,
          'language': RoutesAPI.language, 
        }
      );
      final responce = await http.get(url);
      print('jean movieDetailsEndPont: ${responce.statusCode}');
      if(responce.statusCode != 200) return false; 
      return responce.body;
    } catch (e) {
      print('jean movieDetailsEndPont: ${e.toString()}');
      return false;
    }
  }

}