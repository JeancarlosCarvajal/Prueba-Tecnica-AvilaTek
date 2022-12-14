import 'package:http/http.dart' as http;

import '../routes/routes_api.dart';


class PopularMoviesApi {

  static Future<dynamic> getPopularMoviesJsonData({ int page = 1 }) async {
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
      if(responce.statusCode != 200) return false; 
      return responce.body;      
    } catch (e) {
      return false;
    }
  }

}