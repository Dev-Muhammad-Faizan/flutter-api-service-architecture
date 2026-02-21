import 'package:http/http.dart' as http;
import '../Models/posts.dart';
import '../Models/quotes.dart';
import '../Models/test.dart';

class ApiService {
  Future<Test> getUsersApi() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/users'));
    if (response.statusCode == 200) {
      return testFromJson(response.body);
    } else {
      throw Exception('Faild to load Data');
    }
  }

  Future<Quotes> getQuotesApi() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/quotes'));
    if (response.statusCode == 200) {
      return quotesFromJson(response.body);
    } else {
      throw Exception('Faild to load Data');
    }
  }

  Future<Posts> getPostsApi() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/posts'));
    if (response.statusCode == 200) {
      return postsFromJson(response.body);
    } else {
      throw Exception('Faild to load Data');
    }
  }
}
