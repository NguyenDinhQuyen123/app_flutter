import 'package:flutter/material.dart';

class Notifiwidget extends StatefulWidget {
  final String avatar;
  final String title;
  final String date;
  final String circle;
  final String icon;
  final String title1;
  const Notifiwidget({
    super.key,
    required this.avatar,
    required this.title,
    required this.date,
    required this.circle,
    required this.icon,
    required this.title1,
    });

  @override
  State<Notifiwidget> createState() => _NotifiwidgetState();
}

class _NotifiwidgetState extends State<Notifiwidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Row(
      children: [
        // Anh avatar
        Stack(
          children: [
            CircleAvatar(
              radius: 40,
            child: Image.asset(widget.avatar, width: double.infinity,fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 0, // Vị trí phía trên cùng
              right: 0, // Vị trí góc trái
              child: CircleAvatar(
                radius: 15,
                child:Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(widget.circle, width: double.infinity,fit: BoxFit.cover,),
                    Image.asset(widget.icon,width: 15, fit: BoxFit.cover,),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 40,),
        // Tieu de
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          
        children: [
          // Lời văn
          Text(widget.title, style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
          Text(widget.title1, 
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            ),
          ),
          Text(widget.date, style: TextStyle(
            fontSize: 17, 
            color: Colors.black.withOpacity(0.8)
          ),
          ),
          
  ],
),
      ],
      ),
      const SizedBox(height: 30,),
      Image.asset("images/notifi/t1.png",width: double.infinity,fit: BoxFit.cover, ),
      ],
    );
    
  }
}