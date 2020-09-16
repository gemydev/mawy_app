class Notifications {
  List<Notification> data;
  int error;
  String message;

  Notifications({this.data, this.error, this.message});

  Notifications.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Notification>();
      json['data'].forEach((v) {
        data.add(new Notification.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class Notification {
  int id;
  String userId;
  String title;
  String message;
  Null image;
  String type;
  String createdAt;
  String updatedAt;

  Notification(
      {this.id,
        this.userId,
        this.title,
        this.message,
        this.image,
        this.type,
        this.createdAt,
        this.updatedAt});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    message = json['message'];
    image = json['image'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['message'] = this.message;
    data['image'] = this.image;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}