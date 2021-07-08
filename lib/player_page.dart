import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
          onPressed: (){Navigator.pop(context);},
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text('Artist',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
            ),
            Text('Ariana Grande'),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
        ],
      ),

      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('image/women.png'),
              fit: BoxFit.cover,
            )
          ),
        child: Stack(
          children: [
            Positioned(
                left: 0,
                top: 400,
                //bottom: 30,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                  width: 390,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(50))
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('image/women.png'),
                              fit: BoxFit.cover,
                            ),
                        ),
                        width: 150,
                        height: 150,

                      ),
                      Column(
                        children: [
                          Text('Imagine',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text('Ariana Grande',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                          )
                        ],
                      ),
                      ProgressBar(
                        progress: Duration(milliseconds: 1000),
                        buffered: Duration(milliseconds: 2000),
                        total: Duration(milliseconds: 5000),
                        onSeek: (duration) {
                          print('User selected a new time: $duration');
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon:Icon(Icons.share,color: Colors.grey,), ),
                          IconButton(onPressed: (){}, icon:  Icon(Icons.fast_rewind),),
                          MaterialButton(onPressed: (){},
                            color: Colors.blue,
                            shape: CircleBorder(),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Icon(Icons.pause),
                            ),
                          ),
                          IconButton(onPressed: (){}, icon:  Icon(Icons.fast_forward_rounded ),),
                          IconButton(onPressed: (){}, icon: Icon(Icons.repeat,color: Colors.grey,),),
                        ],
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
