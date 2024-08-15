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
          return Stack(
            children: <Widget>[
              Padding(
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
                    child: _articleInfoColum(_context, index),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: MediaQuery.of(_context).size.width * 0.10,
                child: _socialInfoContainer(_context, index),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _articleInfoColum(BuildContext _context, int _index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 30, 0),
          child: _authorInfoRow(_context, _index),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              30, MediaQuery.of(_context).size.height * 0.05, 30, 0),
          child: _detaiInfoRow(_context, _index),
        )
      ],
    );
  }

  Widget _authorInfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('https://i.pravatar.cc/303')),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    articles[_index].author,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '3 Hours Ago',
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 20,
            ),
            Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 20,
                ))
          ],
        )
      ],
    );
  }

  Widget _detaiInfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: Icon(
            Icons.play_arrow,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(_context).size.width * 0.50,
                  child: Text(
                    articles[_index].title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3, bottom: 3),
                  child: Text(
                    articles[_index].location,
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                _ratingWidget(_context, _index),
              ],
            ))
      ],
    );
  }

  Widget _socialInfoContainer(BuildContext _context, int _index) {
    return Container(
      height: MediaQuery.of(_context).size.height * 0.08,
      width: MediaQuery.of(_context).size.width * 0.70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite_border,
                color: Colors.redAccent,
              ),
              Text(
                articles[_index].likes.toString(),
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.mode_comment,
                color: Colors.grey,
              ),
              Text(
                articles[_index].comments.toString(),
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.share,
                color: Colors.grey,
              ),
              Text(
                articles[_index].shares.toString(),
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _ratingWidget(BuildContext _context, int _index) {
    return Row(
        children: List<Widget>.generate(5, (_currentIndex) {
      double _fillAmount = articles[_index].rating - _currentIndex;
      Icon _startIcon;
      if (_fillAmount >= 1) {
        _startIcon = Icon(
          Icons.star,
          color: Colors.amberAccent,
          size: 15,
        );
      } else if (_fillAmount >= 0.5) {
        _startIcon = Icon(
          Icons.star_half,
          color: Colors.amberAccent,
          size: 15,
        );
      } else {
        _startIcon = Icon(
          Icons.star_border,
          color: Colors.amberAccent,
          size: 15,
        );
      }
      return _startIcon;
    }));
  }
}
