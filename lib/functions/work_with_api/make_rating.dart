import 'package:http/http.dart' as http;

Future<void> makeRating(
    {String userName, int ratingNumber, int offerId}) async {
  http.Response response = await http.get(
    'http://mawyApi.codecaique.com/api/make_rating?user=$userName&offer_id=${offerId.toString()}&rate_number=${ratingNumber.toString()}',
  );
  if (response.statusCode != 200) {
    throw Exception('Can not make rating');
  }
}
