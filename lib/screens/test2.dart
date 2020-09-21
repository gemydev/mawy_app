import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:path/path.dart';

void uploadFile(filePath) async {
  String fileName = basename(filePath.path);
  print("file base name:$fileName");
  try {
    FormData formData = new FormData.fromMap({
      "file": await MultipartFile.fromFile(filePath.path, filename: fileName),
    });
    Response response = await Dio().post(
        "http://mawyApi.codecaique.com/api/make_offer",
        data: formData);
    print("File upload response: $response");
  } catch (e) {
    print("expectation : $e");
  }
}

