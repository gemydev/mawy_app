class Categories {
  List<Category> allCategory;
  int error;
  String message;

  Categories({this.allCategory, this.error, this.message});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['all_category'] != null) {
      allCategory = new List<Category>();
      json['all_category'].forEach((v) {
        allCategory.add(new Category.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allCategory != null) {
      data['all_category'] = this.allCategory.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class Category {
  int id;
  String name;
  String image;
  String createdAt;
  String updatedAt;

  Category({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}