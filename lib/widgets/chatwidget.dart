import 'package:flutter/material.dart';

class Chatwidget extends StatefulWidget {
  final String avatar;
  final String name;
  const Chatwidget({super.key, required this.avatar, required this.name});
  @override
  State<Chatwidget> createState() => _ChatwidgetState();
}

class _ChatwidgetState extends State<Chatwidget> {
  List<bool> isCheckedList = [
    false,
    false,
    false
  ]; // Mỗi phần tử tương ứng với một bức ảnh
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: CircleAvatar(
              radius: 40, // Tăng bán kính để làm cho avatar lớn hơn
              child: ClipOval(
                child: Image.asset(
                  widget.avatar,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          const SizedBox(
            width: 20,
          ),
          //
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // name
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 200,
            ),
            Positioned(
              right: 50,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isCheckedList[0] = !isCheckedList[
                        0]; // Chỉ thay đổi trạng thái của bức ảnh 1
                  });
                },
                child: Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCheckedList[0]
                        ? const Color.fromARGB(255, 14, 235, 213)
                        : Colors.transparent, // Đổi màu khi tick
                    border: Border.all(
                        color: Colors.grey, width: 2), // Viền của hình tròn
                  ),

                  child: isCheckedList[0]
                      ? const Icon(Icons.check,
                          size: 35.0,
                          color: Colors
                              .white) // Hiển thị icon tick với kích thước lớn hơn
                      : const Icon(Icons.circle_outlined,
                          size: 35.0,
                          color: Colors
                              .transparent), // Không tick với kích thước lớn hơn
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
