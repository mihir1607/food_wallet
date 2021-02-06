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
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<HotelList>(context).fetchProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : null,
    );
  }
}
