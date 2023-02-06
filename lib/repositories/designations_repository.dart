import 'dart:convert';
import 'dart:io';
import '../helpers/api_endpoints.dart';
import 'package:http/http.dart' as http;

import '../helpers/shared_preferences.dart';

class DesignationsRepository {
  getAllDesignations() async {
    print("cat");
    var bearer = await Preferences().getToken();
    print("my hearders $bearer");
    var headers = {HttpHeaders.authorizationHeader: "Bearer $bearer"};

    var url = "${ApiEndPoints.baseUrl}${ApiEndPoints.designations}";

    var data = await http.get(Uri.parse(url), headers: headers);

    var response = await jsonDecode(data.body);
    print("hh${response}");
    return response;
  }
}
