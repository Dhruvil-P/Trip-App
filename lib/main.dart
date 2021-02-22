import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_app/FadeAnimation.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(fontFamily: 'Roboto'),
  home: Homepage(),
));

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{
  PageController _pageController;

  void _onScroll() {

  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
      super.initState();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage('assets/images/one.jpg',
              'USA',
              "The U.S. is a country of 50 states covering a vast swath"
              " of North America, with Alaska in the northwest and Hawaii extending the nation’s presence into"
              " the Pacific Ocean. Major Atlantic Coast cities are New York, a global finance and culture center,"
              " and capital Washington, DC. Midwestern metropolis Chicago is known for influential architecture and"
              " on the west coast, Los Angeles' Hollywood is famed for filmmaking.",
              "1"),

          makePage('assets/images/three.jpg',
              'Canada',
              "Canada is a country in the northern part of North America."
              " Its ten provinces and three territories extend from the Atlantic to the Pacific and northward into"
              " the Arctic Ocean, covering 9.98 million square kilometres, making it the world's second-largest country"
              " by total area.",
              "2"),

          makePage('assets/images/Travel.jpg',
              'New Zealand',
              "New Zealand is an island country in the southwestern"
              " Pacific Ocean. It consists of two main landmasses—the North Island and the South Island —and more than"
              " 700 smaller islands, covering a total area of 268,021 square kilometres.",
              "3"),

          makePage('assets/images/Travel-1.jpg',
              'Australia',
              "Australia, officially the Commonwealth of Australia,"
              " is a sovereign country comprising the mainland of the Australian continent, the island of Tasmania, and"
              " numerous smaller islands. It is the largest country in Oceania and the world's sixth-largest country by"
              " total area.",
              "4"),
        ],
      ),
    );
  }
}

Widget makePage(image, title, description, number) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          stops: [0.3, 0.9],
          colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.2),
          ]
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                FadeAnimation(2, Text(number, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                Text('/4', style: TextStyle(color: Colors.white, fontSize: 15),),
              ],
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(1,
                    Text(title, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 20,),
                    FadeAnimation(1.5, Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.grey, size: 15,),
                        ),
                        Text('4.0', style: TextStyle(color: Colors.white70),),
                        Text('(2300)', style: TextStyle(color: Colors.white38, fontSize: 12),),
                      ],
                    )),
                    SizedBox(height: 20,),
                    FadeAnimation(2, Padding(
                      padding: const EdgeInsets.only(right: 1),
                      child: Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 13),),
                    )),
                    SizedBox(height: 20,),
                    FadeAnimation(2.5, Text('Read More', style: TextStyle(color: Colors.white),)),
                    SizedBox(height: 30,),
                  ],
                ),
            ),
          ],
        ),
      ),
    ),
  );
}