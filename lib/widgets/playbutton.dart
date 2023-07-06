import 'package:flutter/material.dart';
import 'package:web_app/responsive_ui.dart';


class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: (){},
        color: Colors.white,
         padding:  !Responsive.isDesktop(context)
             ? const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0)
             : const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
        child: Row(
            children:[Icon(Icons.play_arrow,size: 30,),
              Text("Play",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600),),]));

  }
}