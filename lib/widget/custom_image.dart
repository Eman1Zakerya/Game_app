import 'package:flutter/material.dart';



 

  @override
  Widget  ImageScreen({
    required String image 
  }) =>
  
    CircleAvatar(
      
          radius: 50,
          backgroundImage: AssetImage(image ), 
      );
  
      
  void changeTo(cur_image )
  {
      
  }
 
