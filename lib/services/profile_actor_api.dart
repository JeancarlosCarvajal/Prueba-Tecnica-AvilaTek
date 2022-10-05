import 'package:movie_app/routes/routes_api.dart';
import 'package:http/http.dart' as http;


class MoviesByActorApi {

  Future<dynamic> getMoviesByActorJsonData({ required String actorName, int page = 1 }) async {
    try {
      var url = Uri.https( 
        RoutesAPI.baseURL, 
        RoutesAPI.popularEndPoint, {
          'api_key': RoutesAPI.apiKEY,
          'language': RoutesAPI.language,
          'page': '$page',
          'query': actorName
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