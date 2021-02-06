import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hotels.dart';

class HotelIndex extends StatefulWidget {
  static const routeName = '/hotel_list';
  @override
  _HotelIndexState createState() => _HotelIndexState();
}

class _HotelIndexState extends State<HotelIndex> {
  var _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<HotelList>(context).fetchProducts();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels'),
      ),
    );
  }
}
