
import 'package:http/http.dart' as http;

import '../routes/routes_api.dart';


class ActorProfileByIdApi {

  static Future<dynamic> getActorProfileByIdJsonData({ required String actorId }) async {
    try {
      var url = Uri.https( 
        RoutesAPI.baseURL, 
        RoutesAPI.actorProfileByIdEndPont(actorId: actorId), {
          'api_key': RoutesAPI.apiKEY, 
          'append_to_response':'credits', 
        }
      );
      final responce = await http.get(url);
      print('jean actorProfileByIdEndPont: ${responce.statusCode}');
      if(responce.statusCode != 200) return false; 
      return responce.body;      
    } catch (e) {
      print('jean actorProfileByIdEndPont: ${e.toString()}');
      return false;
    }
  }

}