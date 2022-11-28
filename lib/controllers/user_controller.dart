import 'package:iWarden/helpers/dio_helper.dart';

class UserController {
  final dio = DioHelper.defaultApiClient;
  Future<dynamic> getMe() async {
    final response = await DioHelper.defaultApiClient.get('/warden/get-me');
    return response;
  }
}
