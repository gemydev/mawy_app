class User {
  int id;
  String firstName;
  String lastName;
  String userName;
  String phone;
  String email;
  String image;
  String state;
  String passwords;
  String address;
  String shopName;
  String createdAt;
  String updatedAt;
  int error;
  String message;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.userName,
    this.phone,
    this.email,
    this.image,
    this.state,
    this.passwords,
    this.address,
    this.shopName,
    this.createdAt,
    this.updatedAt,
    this.error,
    this.message,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['user_name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    state = json['state'];
    passwords = json['passwords'];
    address = json['address'];
    shopName = json['shop_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_name'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['image'] = this.image;
    data['state'] = this.state;
    data['passwords'] = this.passwords;
    data['address'] = this.address;
    data['shop_name'] = this.shopName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

