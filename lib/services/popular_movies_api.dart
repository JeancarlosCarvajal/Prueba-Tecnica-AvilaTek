import 'package:movie_app/routes/routes_api.dart';
import 'package:http/http.dart' as http;


class PopularMoviesApi {

  Future<dynamic> getPopularMoviesJsonData({ int page = 1 }) async {
    try {
      var url = Uri.https( 
        RoutesAPI.baseURL, 
        RoutesAPI.popularMoviesEndPoint, {
          'api_key': RoutesAPI.apiKEY,
          'language': RoutesAPI.language,
          'page': '$page'
        }
      );
      final responce = await http.get(url);
      print('jean popularMoviesEndPoint: ${responce.statusCode}');
      if(responce.statusCode != 200) return false; 
      return responce.body;      
    } catch (e) {
      print('jean popularMoviesEndPoint: ${e.toString()}');
      return false;
    }
  }

}