import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'player_page.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'exenple Aplication',
      home: HomePge(),
    );
  }
}

class HomePge extends StatelessWidget {
  const HomePge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          //title: Text('Home'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: (){},
            )
          ],
        ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeaderSection(),
            MyPlayListSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomSection(),
    );
  }
}


class MyHeaderSection extends StatelessWidget {
  const MyHeaderSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.red ,
        image: DecorationImage(
          image: AssetImage('image/women.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            bottom: 30,
            child: Text(
                "Ariana Grande",
              style: GoogleFonts.arizonia(
                color: Colors.white,
                fontSize: 43,
                fontWeight: FontWeight.w800,
              ),
            ),),
          Positioned(
            right: 0,
              bottom: 20,
              child: MaterialButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerPage()));
            },
                color: Colors.blue,
                shape: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(17),
                  child: Icon(Icons.play_arrow_rounded,
                  color: Colors.white,),
                ),
          ))
        ],
      ),
    );
  }
}
class MyPlayListSection extends StatelessWidget {
  final List playList =
  [
    {
      'title':'Tueur de  Damso',
      'duration': '3,16',
      'played':false,
    },
    {
    'title':'Tous en Slip',
    'duration': '3,16',
    'played':true,
  },
    {
      'title':'Alors on Danse',
      'duration': '3,16',
      'played':false,
    },
    {
      'title':"Don't Worry be Happy",
      'duration': '3,16',
      'played':false,
    },
    {
      'title':'Marabou',
      'duration': '3,16',
      'played':false,
    },
    {
      'title':'Mouaka',
      'duration': '3,16',
      'played':false,
    },



  ];
  MyPlayListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 40, 20, 20),
      child: Column(
        children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 "Popular",
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 25,
                   fontWeight: FontWeight.w500,
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(right: 10),
                 child: Text("Show All",style:TextStyle(
                   color: Colors.blue
                 ),),
               )
             ],
           ),
        SizedBox(
          height: 20,
        ),
          Container(
            child: Column(
              children: playList.map((song){
                return Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(song['title'],
                      style: TextStyle(
                        color: song['played']? Colors.blue : Colors.grey,
                      ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(song['duration'],
                            style: TextStyle(
                              color: song['played']? Colors.blue : Colors.grey,
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: song['played']? Colors.blue : Colors.grey,))
                        ],
                      )

                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.pause,color: Colors.white,),
              label: ''
          ),
      BottomNavigationBarItem(
        icon: Text("Arian .Imagine..",
          style: TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        label: ''
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.arrow_circle_up_sharp,color: Colors.white),
        label: ''
      ),
    ]);
  }
}

