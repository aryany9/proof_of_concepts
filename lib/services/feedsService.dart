import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:proof_of_concepts/models/feedsModel.dart';

// This is the service class to call the API's using the defined functions.

class FeedService {
  static var client = http.Client();

  // I have create fetchList() for calling the given API
  static Future fetchList() async {
    try {
      var response = await client.get(Uri.parse(
          'https://run.mocky.io/v3/c4ab4c1c-9a55-4174-9ed2-cbbe0738eedf'));

      // We are checking if the API is working or not.
      if (response.statusCode == 200) {
        var jsonString = response.body;

        // if the statuscode is 200 that means API is working then we will pass it to the Model.
        return feedsModelFromJson(jsonString);
      } else {
        return null;
      }
    } on SocketException {
      return null;
    }
  }
}
