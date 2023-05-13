import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vibetag/screens/chat_screens/constants.dart';
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

  getToken({
    String role = '',
    String channel = 'new_test_call',
  }) async {
    String url = 'https://lime-rich-bison.cyclic.app/access_token' +
        '?appId=${appId}&appCertificate=${certificate}&channelName=${channel}';
    final result = await http.get(Uri.parse(url));

    print(jsonDecode(result.body)['token']);
    return jsonDecode(result.body)['token'];
  }

  createAlertPush({
    required String body,
    required String title,
    String imageUrl = '',
    required String fcm,
    required Map<String, String> mapData,
  }) async {
    var data = {
      'to': '/topics/${fcm}',
      'data': mapData,
      'notification': {
        'body': body,
        'title': title,
        'imageUrl': imageUrl,
      },
    };
    String url = 'https://fcm.googleapis.com/fcm/send';
    try {
      final result = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Authorization':
              'key=AAAAu4HbT2Q:APA91bHrN0Yk-2UrGPzSX23dBnWA-bIS3l7pMfN6_5OnbMIN4vPPYXhMNeHZbJ9jEFfB-RCw7ftAWluSamuEzdupa4vrYCmPlpBUxSu2Mfv1CMb8a_b1H7NpNMrZZOyZsoKm2EP87JRu'
        },
      );
      return jsonDecode(result.body);
    } catch (e) {
      print(e);
      return {'error': e};
    }
  }

  createPushUpNotification({
    required String body,
    required String title,
    String imageUrl = '',
    required String fcm,
  }) async {
    final data = {
      'to': '/topics/${fcm}',
      'notification': {
        'body': body,
        'title': title,
        'image': imageUrl,
      }
    };
    String url = 'https://fcm.googleapis.com/fcm/send';
    try {
      final result = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Authorization':
              'key=AAAAu4HbT2Q:APA91bHrN0Yk-2UrGPzSX23dBnWA-bIS3l7pMfN6_5OnbMIN4vPPYXhMNeHZbJ9jEFfB-RCw7ftAWluSamuEzdupa4vrYCmPlpBUxSu2Mfv1CMb8a_b1H7NpNMrZZOyZsoKm2EP87JRu'
        },
      );
      return jsonDecode(result.body);
    } catch (e) {
      print(e);
      return {'error': e};
    }
  }
}
