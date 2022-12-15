import 'package:vibetag/methods/api.dart';

class AuthMethod {
  Future<Map<String, dynamic>> getUser({required String userId}) async {
    return await API().getData(
      data: {},
    );
  }
}
