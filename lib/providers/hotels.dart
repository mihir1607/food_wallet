import 'package:flutter/foundation.dart';

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
}
