
import 'package:file_picker/file_picker.dart';
import 'package:multipart_request/multipart_request.dart';

Future<PlatformFile> onTapToChooseFile() async {
  FilePickerResult result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );
  PlatformFile file;
  return file = result.files.first;
}

void sendRequest(filePath) {
  var request = MultipartRequest();
  request.setUrl("http://mawyApi.codecaique.com/api/make_offer");
  request.addFile("file", filePath);
  Response response = request.send();

  response.onError = () {
    print("Error");
  };

  response.onComplete = (response) {
    print(response);
  };

  response.progress.listen((int progress) {
    print("progress from response object " + progress.toString());
  });
}


