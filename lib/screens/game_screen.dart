

import 'dart:math';

import 'package:flutter/material.dart';
import '../moddels/game_model.dart';
import '../widget/custom_image.dart';


class GameScreen extends StatefulWidget {
 

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

List<String> imges=[
  
  'assets/images/tom.png',
  'assets/images/tom.png',
  'assets/images/tom.png',
  'assets/images/tom.png',
  'assets/images/tom.png',
  'assets/images/jery.png',
  'assets/images/tom.png',
  'assets/images/tom.png',
  'assets/images/tom.png',
  'assets/images/tom.png',
  'assets/images/tom.png',
  'assets/images/tom.png'
];
int y=0;
int? x;

  Game game = Game();
  
  int tries =5;
  String? img1 ;
 
 
  String changeImg(String im)
    {
     
    
    img1 = im;
    
    
     return img1!;
      
    }
  
   @override
  void initState() {
    
    super.initState();
   
    
      imges.shuffle();
  }
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
     
     appBar: AppBar(
       backgroundColor: Colors.green,
       title: Text('find jery'),
       actions: [
         IconButton(onPressed:  (){
         setState(() {
           // imges.shuffle();
           img1='assets/images/meky.jpg';
          tries =5;
          // y=0;
         });
       }, 
         icon:Icon(Icons.reset_tv_outlined) )
       ],
     ),
    
     body: Stack(
       children: [
           Container(
              width: MediaQuery.of(context).size.width,
             height:MediaQuery.of(context).size.height,
             child: Image.asset('assets/images/garden.jpg',
             fit: BoxFit.cover,
             ),
           ),
       Column(
         
         children: [
           CircleAvatar(
             backgroundColor: Colors.amber,
             radius: 20,
             child: Text('${tries}')),
           Container(
             width: MediaQuery.of(context).size.width,
             height:MediaQuery.of(context).size.height-200, 
             child: Padding(
               padding: const EdgeInsets.only(top: 5),
               child: GridView.builder(
                 gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 3,
                 crossAxisSpacing: 5.0,
                 mainAxisSpacing: 5.0,
        ), 
                 itemBuilder: (BuildContext context,  index)=>GestureDetector(
                   onTap: (() {
                     setState(() {
                       x=index;
                       img1 = changeImg(imges[ index]);
                       if(tries>1){
                            
                            setState(() {
                       
                        tries--;
                       if(img1=='assets/images/jery.png')
         
                       {
                        
                        
                          showDialog(context: context, builder: (context)=>AlertDialog(
                         title: Text('Win'),
                         
                       ));
                      //  setState(() {
                      //    y=1;
                       
                      //  });
                       }
                      
                    });
                     }else{
                       showDialog(context: context, builder: (context)=>AlertDialog(
                         title: Text('Game Over'),
                       ));
                      
                      // setState(() {
                      //   y=1;
                      // });
                       
                     }
                     });
                       
                   }),
                   child: Center(
                     child:x==index? ImageScreen(image:'${img1}'):ImageScreen(image:'assets/images/meky.jpg')
                   ),
                 ),
                 itemCount:imges.length
                 ),
             ),
           ),
          
         ],
       ),
       ],
     )
      );

  }
}