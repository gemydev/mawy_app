class User {
  UserData userData;
  int error;
  String message;

  User({this.userData, this.error, this.message});

  User.fromJson(Map<String, dynamic> json) {
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user_data'] = this.userData.toJson();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class UserData {
  int id;
  String firstName;
  String lastName;
  String userName;
  String shopName;
  String passwords;
  String phone;
  String name;
  String image;
  String state;
  String firebaseToken;
  String createdAt;
  String updatedAt;
  String pakaId;

  UserData(
      {this.id,
        this.firstName,
        this.lastName,
        this.userName,
        this.shopName,
        this.passwords,
        this.phone,
        this.name,
        this.image,
        this.state,
        this.firebaseToken,
        this.createdAt,
        this.updatedAt,
        this.pakaId});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['user_name'];
    shopName = json['shop_name'];
    passwords = json['passwords'];
    phone = json['phone'];
    name = json['name'];
    image = json['image'];
    state = json['state'];
    firebaseToken = json['firebase_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pakaId = json['paka_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_name'] = this.userName;
    data['shop_name'] = this.shopName;
    data['passwords'] = this.passwords;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['image'] = this.image;
    data['state'] = this.state;
    data['firebase_token'] = this.firebaseToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['paka_id'] = this.pakaId;
    return data;
  }
}