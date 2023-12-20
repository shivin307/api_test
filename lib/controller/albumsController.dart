import 'dart:convert';

import '../model/albumsModel.dart';
import 'package:http/http.dart' as http;

class AlbumsContoller {
  static Future<List<WeatherResponse>> fetchData() async {
    List<WeatherResponse> albums = [];
    final Map<String, dynamic> data = {
      'prompt': {
        'text': "what is the weather now in india give me 5 line of details?",
      }
    };

    const url =
        'https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText?key=AIzaSyA94-L2B4q9jgvlJ06buAJIXs1KXRUCB2s';
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data));

    if (response.statusCode == 200) {
      print('fetchData Called');
      Map<String, dynamic> json = jsonDecode(response.body)['candidates'][0];
      print(json);
      WeatherResponse weatherResponse = WeatherResponse.fromJson(json);
      albums = [weatherResponse]; // Create a list with a single WeatherResponse instance

      // albums = json.map((e) => Albums.fromJson(e)).toList();
      // print('fetchData Sucessful');
      return albums;
    } else {
      print('statusCode:${response.statusCode}');
      return albums;
    }
  }
}
