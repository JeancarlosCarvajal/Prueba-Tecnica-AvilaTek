import 'package:movie_app/routes/routes_api.dart';
import 'package:http/http.dart' as http;


class DetailsMoviesApi {

  Future<dynamic> getDetailsMoviesJsonData({ required movieId }) async {
    try {
      var url = Uri.https( 
        RoutesAPI.baseURL, 
        RoutesAPI.detailsEndPont(movieId: movieId), {
          'api_key': RoutesAPI.apiKEY,
          'language': RoutesAPI.language, 
        }
      );
      final responce = await http.get(url);
      print('jean: ${responce.statusCode}');
      if(responce.statusCode != 200) return false; 
      return responce.body;
    } catch (e) {
      print('jean: ${e.toString()}');
      return false;
    }
  }

}