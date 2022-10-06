
import 'package:http/http.dart' as http;

import '../routes/routes_api.dart';


class ActorProfileByIdApi {

  static Future<dynamic> getActorProfileByIdJsonData({ required int actorId }) async {
    try {
      var url = Uri.https( 
        RoutesAPI.baseURL, 
        RoutesAPI.actorProfileByIdEndPont(actorId: actorId), {
          'api_key': RoutesAPI.apiKEY, 
          'append_to_response':'credits', 
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