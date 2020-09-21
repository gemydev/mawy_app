import 'package:dio/dio.dart';
import 'package:path/path.dart';

void uploadFileByDio(filePath) async {

  String fileName = basename(filePath.path);
  print("File base name: $fileName");

  try {
    FormData formData =
    new FormData.fromMap({"file": fileName});

    Response response =
    await Dio().post('http://mawyApi.codecaique.com/api/make_offer', data: formData);
    print("File upload response: $response");

  } catch (e) {
    print("Exception Caught: $e");
  }
}