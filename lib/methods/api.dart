import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vibetag/utils/constant.dart';

class API {
  postData(data) async {
    return await http.post(
      Uri.parse(API_Url),
      body:data,
    );
  }

  getData({required Map<String,dynamic> data}) async {
    String url = API_Url;
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  _setHeader() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
