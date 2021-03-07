import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hotels.dart' show HotelList;

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
    final hotel = Provider.of<HotelList>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/top-image.png',
              alignment: Alignment.topLeft,
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    // Image.asset(
                    //   'assets/images/french.png',
                    //   alignment: Alignment.bottomRight,
                    //   height: 60,
                    // ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 5,
                            color: Color(0xffffd2d2),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xffffd2d2)),
                      child: Image.asset(
                        'assets/images/french.png',
                        height: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
        actions: [],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Let's eat",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Healthy Food !",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, i) => Text(
                      hotel.items.toList()[i].name,
                    ),
                    itemCount: hotel.items.toList().length,
                  ),
                ),
              ],
            ),
    );
  }
}
