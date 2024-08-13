import 'package:flutter/material.dart';
import '../data.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<String> _locations = ['Poluare', 'Japan', 'Moscow', 'London'];
  int _activeLocation = 1;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        bottom: true,
        minimum: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
            0, MediaQuery.of(context).size.width * 0.05, 0),
        child: _mainColumn(context),
      ),
    );
  }

  Widget _mainColumn(BuildContext _context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.black87,
              size: 35,
            ),
            Container(
              height: 39,
              width: 144,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/logo_discover.png'))),
            ),
            Icon(
              Icons.search,
              color: Colors.black87,
              size: 35,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(_context).size.height * 0.03,
              bottom: MediaQuery.of(_context).size.height * 0.03),
          child: _locationBar(_context),
        ),
        _articlesList(_context),
      ],
    );
  }

  Widget _locationBar(BuildContext _context) {
    return Container(
      height: MediaQuery.of(_context).size.height * 0.065,
      decoration: BoxDecoration(
        color: Color.fromRGBO(69, 69, 69, 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _locations.map((l) {
          bool _isActive = _locations[_activeLocation] == l ? true : false;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                l,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                  color: _isActive ? Colors.white : Colors.white54,
                ),
              ),
              _isActive
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.redAccent),
                      height: 5,
                      width: 30,
                    )
                  : Container()
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _articlesList(BuildContext _context) {
    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(_context).size.height * 0.05),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: MediaQuery.of(_context).size.height * 0.30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(articles[index].image)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            spreadRadius: 2,
                            blurRadius: 20,
                            offset: Offset(0, 6))
                      ]),
                      child: _articleInfoColum(_context),
                ),
              ));
        },
      ),
    );
  }

  Widget _articleInfoColum(BuildContext _context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _authorInfoRow(_context),
      ],
    )
  }

  Widget _authorInfoRow(BuildContext _context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        
      ],
    );

  }
}
