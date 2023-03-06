import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vibetag/utils/constant.dart';

class API {
  postData(data) async {
    return await http.post(
      Uri.parse(API_Url),
      body: data,
    );
  }

  getData({required Map<String, dynamic> data}) async {
    String url = API_Url;
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  _setHeader() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  Future uploadImage({
    required String path,
    required String user_id,
  }) async {
    var req = http.MultipartRequest("POST", Uri.parse(API_Url));
    req.fields['type'] = 'update_user_avatar_picture';
    req.fields['user_id'] = user_id;
    req.files.add(
      await http.MultipartFile.fromPath(
        'avatar',
        path,
      ),
    );
    final result = await req.send();
    final response = await result.stream.bytesToString();
    return response;
  }

  Future MultiPartRequest({
    required String path,
    required Map<String, String> data,
    String fileName = 'image',
  }) async {
    var req = http.MultipartRequest("POST", Uri.parse(API_Url));
    req.fields.addAll(data);
    if (path != '') {
      req.files.add(
        await http.MultipartFile.fromPath(
          fileName,
          path,
        ),
      );
    }
    final result = await req.send();
    final response = await result.stream.bytesToString();
    return response;
  }
}
