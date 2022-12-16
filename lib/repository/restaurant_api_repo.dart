import 'package:rest_api/data/api_url.dart';
import 'package:http/http.dart' as https;
class RestaurantApiRepo {

  ///getRestaurantApi
  getRestaurantApi() async {
    try {
      return await https.get(Uri.parse(APiUrl.getRestaurantApi));
    } catch (error) {
      print('get_test_api_repo.getRestaurantApi$error');
    }
  }

}