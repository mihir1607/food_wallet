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
  Map<String, Hotel> _items = {};

  Map<String, Hotel> get items {
    return {..._items};
  }

  Future<void> fetchProducts() async {
    const url = 'http://10.0.2.2:3000' + '/index';
    try {
      final response = await http.get(url);
      print(response);
      print(json.decode((response.body)[0]));
    } catch (error) {
      // throw (error);
    }
    final response = await http.get(url);
    // String jsonsDataString = response.body.toString();
    // var _data = jsonDecode(jsonsDataString);
    // print('$response');
    // print(_data.toString());
    print(response);
    print(json.decode(response.body));
  }
}
