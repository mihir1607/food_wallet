import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Hotel {
  final List tags;
  final String name;
  final String description;
  final String profileURL;
  final String type;
  final String status;

  Hotel({
    @required this.tags,
    @required this.name,
    @required this.description,
    @required this.profileURL,
    @required this.type,
    @required this.status,
  });
}

class HotelList with ChangeNotifier {
  List<Hotel> _items = [];

  List<Hotel> get items {
    return [..._items];
  }

  Future<void> fetchProducts() async {
    const url = 'http://10.0.2.2:3000' + '/index';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      final List<Hotel> loadedHotels = [];
      extractedData.forEach((hotelData) {
        loadedHotels.add(Hotel(
          tags: hotelData["Tags"],
          name: hotelData["name"],
          description: hotelData["description"],
          profileURL: hotelData["profileURL"],
          type: hotelData["Type"],
          status: hotelData["status"],
        ));
      });
      _items = loadedHotels;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
