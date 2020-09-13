import 'package:http/http.dart' as http;

Future<void> makeSuggestion({int shopId, String content}) async {
  await http
      .post('http://mawyApi.codecaique.com/api/make_suggestion', body: {
    'shop_id': shopId.toString(),
    'content': content,
  });
}
