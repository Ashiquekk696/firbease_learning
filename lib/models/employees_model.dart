class EmployeeModel {
  EmployeeDataModel? data;

  EmployeeModel({this.data});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new EmployeeDataModel.fromJson(json['data'])
        : null;
  }


}

class EmployeeDataModel {
  int? currentPage;
  List<EmployeeSubDataModel>? employeeDetails = [];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  // Null? prevPageUrl;
  int? to;
  int? total;

  EmployeeDataModel(
      {this.currentPage,
      this.employeeDetails,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      //this.prevPageUrl,
      this.to,
      this.total});

  EmployeeDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      employeeDetails = <EmployeeSubDataModel>[];
      json['data'].forEach((v) {
        employeeDetails!.add(new EmployeeSubDataModel.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    // prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class EmployeeSubDataModel {
  int? id;
  String? firstName;
  String? lastName;
  String? joinDate;
  String? dateOfBirth;
  int? designationId;
  String? gender;
  int? mobile;
  int? landline;
  String? email;
  String? presentAddress;
  String? permanentAddress;
  String? profilePicture;
  String? resume;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? profileImage;
 
  EmployeeSubDataModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.joinDate,
      this.dateOfBirth,
      this.designationId,
      this.gender,
      this.mobile,
      this.landline,
      this.email,
      this.presentAddress,
      this.permanentAddress, 
      this.profilePicture,
      this.resume,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.profileImage});

  EmployeeSubDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    joinDate = json['join_date'];
    dateOfBirth = json['date_of_birth'];
    designationId = json['designation_id'];
    gender = json['gender'];
    mobile = json['mobile'];
    landline = json['landline'];
    email = json['email'];
    presentAddress = json['present_address'];
    permanentAddress = json['permanent_address'];
    profilePicture = json['profile_picture'];
    resume = json['resume'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    profileImage = json['profile_image'];
    
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
