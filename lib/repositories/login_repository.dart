import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/api_endpoints.dart';

class LoginRepository {
  loginRepository({email, password}) async {
    var url = "${ApiEndPoints.baseUrl}${ApiEndPoints.login}";
    var body = {"email": email, "password": password};
    print(url);
    var data = await http.post(Uri.parse(url), body: body);
  
    var response =await jsonDecode(data.body);   
    return response;
  }
}
