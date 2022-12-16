import 'package:http/http.dart' as https;
import 'package:rest_api/data/api_url.dart';

class GetTestApiRepo {
  //getPortRepo
  getPortRepo() async {
    try {
      return await https.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    } catch (error) {
      print('get_test_api_repo.getPostApi$error');
    }
  }

//getCommentsAPi
  getCommentsAPi() async {
    try {
      return await https.get(Uri.parse(APiUrl.getCommentsAPi));
    } catch (error) {
      print('get_test_api_repo.getCommentsAPi$error');
    }
  }
  ///getAlbumApi
  getAlbumApi() async {
    try {
      return await https.get(Uri.parse(APiUrl.getAlbumApi));
    } catch (error) {
      print('get_test_api_repo.getAlbumApi$error');
    }
  }

  getPhotoApi() async {
    try {
      return await https.get(Uri.parse(APiUrl.getPhotoApi));
    } catch (error) {
      print('get_test_api_repo.getPhotoApi$error');
    }
  }
  ///getTodoListApi
  getTodoListApi() async {
    try {
      return await https.get(Uri.parse(APiUrl.getTodoListApi));
    } catch (error) {
      print('get_test_api_repo.getTodoListApi$error');
    }
  }
  ///getUsersApi
  getUsersApi() async {
    try {
      return await https.get(Uri.parse(APiUrl.getUsersApi));
    } catch (error) {
      print('get_test_api_repo.getUsersApi$error');
    }
  }
}
