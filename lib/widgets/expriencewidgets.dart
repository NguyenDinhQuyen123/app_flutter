import 'package:flutter/material.dart';

class ExperienceWidgets extends StatefulWidget {
  final String avatar1;
  final String avatar2;
  final String avatar3;
  final String title;
  final String local;
  final String date;
  final String like;

  const ExperienceWidgets({
    super.key,
    required this.avatar1,
    required this.avatar2,
    required this.avatar3,
    required this.title,
    required this.local,
    required this.date,
    required this.like,
  });

  @override
  State<ExperienceWidgets> createState() => _ExperienceWidgetsState();
}

class _ExperienceWidgetsState extends State<ExperienceWidgets> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            
          Row(
            children: [
              // Cột bên trái với 1 hình ảnh lớn
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1,
                child: Image.asset(
                  widget.avatar1,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                ),
              ),
              const SizedBox(width: 8),
              // Cột bên phải với 2 hàng
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    // Hình ảnh thứ hai
                    AspectRatio(aspectRatio: 2,
                    child: Image.asset(
                      widget.avatar2,
                      
                      fit: BoxFit.cover,
                    ),
                    ),
                    const SizedBox(height: 6),
                    // Hình ảnh thứ ba
                    Image.asset(
                      widget.avatar3,
                      width: double.infinity,
                   
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ],
          ),
            // Khung dữ liệu bên dưới
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Icon(Icons.more_horiz),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Địa điểm
                  Row(
                    children: [
                      const Icon(Icons.location_pin,color: Colors.teal,),
                      const SizedBox(width: 5),
                      // ignore: prefer_const_constructors
                      Text(widget.local, style: TextStyle(
                        color:Colors.teal,
                      ),),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Ngày và nút yêu thích
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.date),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            child: isFavorite
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,color: Colors.green,
                                  ),
                          ),
                          const SizedBox(width: 5),
                          Text(widget.like),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
