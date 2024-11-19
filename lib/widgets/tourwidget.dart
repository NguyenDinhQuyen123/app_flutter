import 'package:flutter/material.dart';

class Tourwidget extends StatefulWidget {
  final String time;
  final String title;
   final String title2;
  final String title3;
  final String title4;
  final String title5;
  const Tourwidget({
    super.key,
      required this.time,
      required this.title,
      required this.title2,
      required this.title3,
      required this.title4,
      required this.title5,
      
    });

  @override
  State<Tourwidget> createState() => _TourwidgetState();
}

class _TourwidgetState extends State<Tourwidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
         padding: const EdgeInsets.only(left: 10.0, right: 10,),
        child: Column(
          
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("images/tour/icondaucham.png",
                    color: const Color.fromARGB(255, 73, 231, 215),),
                    const SizedBox(width: 20,),
                    Text(widget.time, style: const TextStyle(
                      color: Color.fromARGB(255, 73, 231, 215)
                      ,fontSize: 20,
                    ),)
                  ],
                ),const SizedBox(height: 5,),
                Text(widget.title, style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 20,
                ),),
                const SizedBox(height: 5,),
                Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   
                  children: [
                 Text(widget.title2, style: TextStyle(
                  color: Colors.black.withOpacity(0.6), 
                  fontSize: 20,
                 ),),
                 const SizedBox(height: 5,),
                 Text(widget.title3, style: TextStyle(
                  color: Colors.black.withOpacity(0.6),fontSize: 20,
                 ),),
                 const SizedBox(height: 5,),
                 Text(widget.title4, style: TextStyle(
                  color: Colors.black.withOpacity(0.6),fontSize: 20,
                 ),),
                 const SizedBox(height: 5,),
                 Text(widget.title5, style: TextStyle(
                  color: Colors.black.withOpacity(0.6),fontSize: 20,
                 ),),
              ],
            )
              ],
            ),
        
          ],
        ),
      ),
      ],
    );
  }
}