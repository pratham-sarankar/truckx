import 'dart:convert';

import 'package:transport/app/data/models/place.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PlaceRepository {
  Future<List<Place>> searchPlaces(String query) async {
    final String apiKey = dotenv.env['GOOGLE_PLACES_API_KEY'] ?? "";
    const String apiUrl =
        'https://maps.googleapis.com/maps/api/place/textsearch/json';
    final response =
        await http.get(Uri.parse('$apiUrl?query=$query&key=$apiKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      final List<Place> places = (data['results'] as List)
          .map((placeData) => Place.fromJson(placeData))
          .toList();
      return places;
    } else {
      throw Exception('Failed to load places');
    }
  }
}
