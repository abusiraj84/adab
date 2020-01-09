


import 'dart:convert';

import 'package:adab/Modals/video.dart';
import 'package:http/http.dart' show Client;

import '../Modals/cat.dart';

class ApiService{
  final String baseUrl = "https://abusiraj84.000webhostapp.com/adabapi/public";
  Client client = Client();

 Future<List<Video>> get() async {
    final response = await client.get("$baseUrl/videos/get");
    if (response.statusCode == 200) {
      //print(videoFromJson(response.body));
      return videoFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Cat>> getCats() async {
    final response = await client.get("$baseUrl/cats/get");
    if (response.statusCode == 200) {
      //print(videoFromJson(response.body));
      return catFromJson(response.body);
    } else {
      return null;
    }
  }





    Future<List<Video>> getbyCatId( int catId) async {
    final response = await client.get("$baseUrl/videos/get/${catId.toString()}");
    if (response.statusCode == 200) {
      //print(videoFromJson(response.body));
      return videoFromJson(response.body);
    } else {
      return null;
    }
  }


//   Future<bool> post(Video data) async {
//     final response = await client.post(
//       "$baseUrl/category",
//       headers: {"content-type": "application/json"},
//       body: videoToJson(data),
//     );
//     if (response.statusCode == 201) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<bool> put(Video data) async {
//     final response = await client.put(
//       "$baseUrl/category/${data.id}",
//       headers: {"content-type": "application/json"},
//       body: videoToJson(data),
//     );
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<bool> delete(int id) async {
//     final response = await client.delete(
//       "$baseUrl/category/$id",
//       headers: {"content-type": "application/json"},
//     );
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
}