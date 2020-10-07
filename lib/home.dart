import 'package:flutter/material.dart';
import 'package:the_master_app/func.dart';
import 'browsers.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Building {
  int id;
  String name;
  String place;
  IconData icon;

  Building({this.id, this.name, this.place, this.icon});
}

checkID(int val) {

//  if (val == 11)
//    return photoEdit();
//  else if(val==3)
//    return wallets();
//  else if(val==1)
//    return social();
   if(val==4)
    return browsers();
//  else if(val==6)
//    return travelApps();
//  else
    return false;
}

class CardPage extends StatelessWidget {
  final Building building;
  CardPage({this.building});
  Widget build(context) {
//    if (building.id == 10)
//      return travelApps();
//    else if (building.id == 11)
//      return photoEdit();
//    else if (building.id == 3)
//      return wallets();
//    else if (building.id == 1)
//      return social();
    if (building.id == 4)
      return browsers();
//    else if (building.id == 6)
//      return travelApps();
    else
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(
              ' Page under Development :/ \n\n Your Developers are working on it 24x7.\n Sorry for the delay.\n Get back here soon!',
              style: TextStyle(color: Colors.red, fontSize: 20.0),
            ),
          ),
        ),
      );
  }
}

class SearchList extends StatefulWidget {
  SearchList({Key key}) : super(key: key);
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  Icon menuOption = Icon(
    Icons.menu,
    color: Color(0xffd11b5d),
  );
  Widget appBarTitle = Text(
    "Categories",
    style: TextStyle(color: Colors.white, fontSize: 27),
  );

  Icon actionIcon = Icon(
    Icons.search,
    color: Color(0xffd11b5d),
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  List<Building> _list;
  List<Building> _searchList = List();

  bool _IsSearching;
  String _searchText = "";
  _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();
  }

  void init() {
    _list = List();
    _list.add(
      Building(
          id: 1, name: "Social", place: "Social", icon: FontAwesomeIcons.users),
    );
    _list.add(
      Building(
        id: 2,
        name: "Messengers",
        place: "message text video call chat",
        icon: FontAwesomeIcons.comments,
      ),
    );
    _list.add(
      Building(
          id: 3,
          name: "Wallets",
          place: "Money transfer payment bill electricity recharge pay cash",
          icon: FontAwesomeIcons.rupeeSign),
    );
    _list.add(
      Building(
          id: 4,
          name: "Browsers",
          place: "internet search google surfing private incognito",
          icon: FontAwesomeIcons.globeAsia),
    );
    _list.add(
      Building(
          id: 5,
          name: "Food",
          place:
              "Zomato, Swiggy, drink tasty hungry yum yummy chicken paneer mushroom taste",
          icon: FontAwesomeIcons.pizzaSlice),
    );
    _list.add(
      Building(
          id: 6,
          name: "Local Travel",
          place: "ola uber car bike auto taxi nearby ",
          icon: FontAwesomeIcons.car),
    );
    _list.add(
      Building(
          id: 7,
          name: "Movies and Series",
          place: "movie movies series tv video ",
          icon: FontAwesomeIcons.play),
    );
    _list.add(
      Building(
          id: 8,
          name: "Music",
          place: "songs music sound voice youtube spotify wynk",
          icon: FontAwesomeIcons.headphones),
    );
    _list.add(
      Building(
          id: 9,
          name: "  Online\nShopping",
          place:
              "", //name all type of clothes present, watches, books names of sites etc //** LOL (pehli baar ache kaam k liye comment dekha)
          icon: FontAwesomeIcons.shoppingCart),
    );
    _list.add(
      Building(
          id: 10,
          name: "Travelling and Hotels",
          place:
              "stay resort hotel travel train flight bus taxi car room suite hospitality",
          icon: FontAwesomeIcons.umbrellaBeach),
    );
    _list.add(
      Building(
          id: 11,
          name: "Photo Editing",
          place:
              "crop photo pic pics pictures edit bright contrast filters frame collage ",
          icon: FontAwesomeIcons.cameraRetro), //or use photo_filter
    );
    _list.add(
      Building(
          id: 12,
          name: "Video Editing",
          place: " transition animation video edit editting ",
          icon: FontAwesomeIcons.icons),
    );
    _list.add(
      Building(
          id: 13,
          name: "Writing and Reading",
          place: "poem article novel snippets story breakup",
          icon: FontAwesomeIcons.featherAlt),
    );
    _list.add(
      Building(
          id: 14,
          name: "Health and Fitness",
          place: "health fitness exercise water ",
          icon: FontAwesomeIcons.heartbeat),
    );
    _list.add(
      Building(
          id: 15,
          name: "Education and Learning",
          place: "health fitness exercise water ",
          icon: FontAwesomeIcons.bookReader),
    );
    _list.add(
      Building(
          id: 16,
          name: "Government Services",
          place: "PAN passport Licence  ",
          icon: FontAwesomeIcons.heartbeat),
    );
    _list.add(
      Building(
          id: 17,
          name: "Dating",
          place:
              "love sex hookup hug kiss friend girlfriend boyfriend boy girl man women heart date dating coffee  ",
          icon: FontAwesomeIcons.kissWinkHeart),
    );
    _list.add(
      Building(
          id: 18,
          name: "Games",
          place: "play fun game arcade adventure  ",
          icon: FontAwesomeIcons
              .gamepad), //counselling and depression, finance and trading
    );
    _searchList = _list;
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Scaffold(
      key: key,
      appBar: buildBar(context),
      body: GridView.builder(
          itemCount: _searchList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: Uiitem(_searchList[index]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CardPage(building: _searchList[index])));
                });
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          )

          /* GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        childAspectRatio: 8.0 / 9.0,
        children: _IsSearching ? _buildSearchList() : _buildList(),
      ),*/
          //drawer: Navigationdrawer(),
          ),
      bottomNavigationBar: footer1(),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }

  List<Building> _buildList() {
    return _list; //_list.map((contact) =>  Uiitem(contact)).toList();
  }

  List<Building> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList =
          _list; //_list.map((contact) =>  Uiitem(contact)).toList();
    } else {
      /*for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }*/

      _searchList = _list
          .where((element) =>
              element.name.toLowerCase().contains(_searchText.toLowerCase()) ||
              element.place.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      print('${_searchList.length}');
      return _searchList; //_searchList.map((contact) =>  Uiitem(contact)).toList();
    }
  }

//  Widget buildFooter(BuildContext context) {
//    return BottomAppBar(
//      child: Center(
//        child: Text(
//          "S H E R A",
//          style: TextStyle(color: Color(0xffd11b5d)),
//        ),
//      ),
//      color: Colors.black12,
//    );
//  }

  Widget buildBar(BuildContext context) {
    return AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0xffd11b5d),
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: appBarTitle,
        iconTheme: IconThemeData(color: Color(0xffd11b5d)),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(
                    Icons.close,
                    color: Color(0xffd11b5d),
                  );
                  this.appBarTitle = TextField(
                    controller: _searchQuery,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        hintText: "Search here..",
                        hintStyle: TextStyle(color: Colors.white)),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Color(0xffd11b5d),
      );
      this.appBarTitle = Text(
        "Categories",
        style: TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class Uiitem extends StatelessWidget {
  final Building building;
  Uiitem(this.building);

  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      margin: EdgeInsets.fromLTRB(9, 9, 9, 9),
      elevation: 10.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
              colors: [Color(0xff420420), Color(0xffd11b5d)],

              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 20.0 / 13,
//              icon: Icon(Icons.volume_up),
              child: Center(
                child: FaIcon(
                  this.building.icon,
//                color: Color(0xff00008b),
//                color: Color(0xff03256c),
                  color: Colors.white,

                  size: 45,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 1.0),
              child: Text(
                this.building.name,
                style: TextStyle(
//                          color: Color(0xff00008b),
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.5),
              ),
            ),
            SizedBox(height: 0.0),
          ],
        ),
      ),
    );
  }
}
