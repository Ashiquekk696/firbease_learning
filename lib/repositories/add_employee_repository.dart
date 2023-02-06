import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../helpers/api_endpoints.dart';
import '../helpers/shared_preferences.dart';

class AddEmployeeReposiotry {
  Future addEmployeeREpository(
      {firstName,
      lastName,
      dateOfBirth,
      designationId,
      gender,
      mobile,
      presentAddress,
      email,
      File? profilePicture,
      resume}) async {
    var token = await Preferences().getToken();
    String baseUrl = ApiEndPoints.baseUrl;

    print("addemployee${baseUrl + ApiEndPoints.employees}");
    var request = http.MultipartRequest(
        'POST', Uri.parse(baseUrl + ApiEndPoints.employees));
    if (profilePicture != null) {
      request.files.add(http.MultipartFile(
        'profile_picture',
        File(profilePicture.path).readAsBytes().asStream(),
        File(profilePicture.path).lengthSync(),
        filename: profilePicture.path.split('/').last,
      ));
    }
    if (resume != null) {
      request.files.add(http.MultipartFile(
        'resume',
        File(resume.path).readAsBytes().asStream(),
        File(resume.path).lengthSync(),
        filename: resume.path.split('/').last,
      ));
    }
    request.headers.addAll({"Authorization": "Bearer $token"});

    request.headers.addAll({
      "Accept": "application/json",
    });
    request.fields["first_name"] = firstName.toString();
    request.fields["last_name"] = lastName.toString();
    request.fields["join_date"] = "2021-08-06".toString();
    request.fields["date_of_birth"] = dateOfBirth.toString();
    request.fields["designation_id"] = designationId.toString();
    request.fields["gender"] = gender.toString();
    request.fields["email"] = email;
    request.fields["mobile"] = mobile;
    request.fields["landline"] = "422133344";
    request.fields["present_address"] = presentAddress;
    request.fields["permanent_address"] = 'HHHHHHHH';
    request.fields["status"] = 'Temporary';
    // request.fields["profile_picture"] = profilePicture?.path??"";
    //request.fields["resume"] = resume;
    var streamData = await request.send();
    var response = await http.Response.fromStream(streamData);
    final responseData = json.decode(response.body);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return responseData;
    }
  }
}
