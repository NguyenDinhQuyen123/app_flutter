import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

// chat
import 'package:three_screen/models/chat.dart';
import 'package:three_screen/widgets/chatwidget.dart';
// Exprineces
import 'package:three_screen/models/exprience.dart';
import 'package:three_screen/widgets/expriencewidgets.dart';
// Notifications
import 'package:three_screen/models/notifi.dart';
import 'package:three_screen/widgets/notifiwidget.dart';
// Tour
import 'package:three_screen/models/tour.dart';
import 'package:three_screen/widgets/tour_guide_widget.dart';
import 'package:three_screen/widgets/tourwidget.dart';
import 'package:three_screen/widgets/sign_in_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      home: TourGuideWidget(),
    );
  }
}

class TourPage extends StatefulWidget {
  const TourPage({super.key, required this.title});
  final String title;

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  List<dynamic> tours = [];
  String message = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://travel-api-8m3x.onrender.com/api/tours'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        setState(() {
          tours = jsonData;
          message = 'Data fetched successfully';
        });
      } else {
        setState(() {
          message = 'Error fetching data: ${response.statusCode}';
        });
      }
    } catch (error) {
      setState(() {
        message = 'Error fetching data: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Plenty of amazing tours are waiting for you',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Hi, where do you want to explore?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: tours.isEmpty
                ? Center(child: Text(message))
                : ListView.builder(
                    itemCount: tours.length,
                    itemBuilder: (context, index) {
                      final tour = tours[index];
                      return TourCard(tour: tour);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class TourCard extends StatelessWidget {
  final dynamic tour;

  const TourCard({required this.tour, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            tour['imageUrl'] ?? 'https://via.placeholder.com/150', // Use a placeholder if image URL is null
            // 'https://statics.vinwonders.com/dragon-bridge-3_1664459702.jpeg',
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        tour['title'] ?? 'No Title', // Handle null title
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        // Add functionality to save as favorite
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    const SizedBox(width: 4),
                    Text(
                        '${tour['likes'] ?? 0} likes'), // Provide default like count
                    const SizedBox(width: 16),
                    Text(tour['date'] ?? 'Unknown Date'), // Handle null date
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  tour['duration'] ??
                      'Unknown Duration', // Handle null duration
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$${tour['price']?.toString() ?? '0.00'}', // Safely format price
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Man hinh 1
class MyChatPage extends StatefulWidget {
  const MyChatPage({super.key, required this.title});
  final String title;

  @override
  State<MyChatPage> createState() => _MyChatPageState();
}

class _MyChatPageState extends State<MyChatPage> {
  @override
  Widget build(BuildContext context) {
    List<Chat> lsChats = [
      Chat("images/chat/n3.png", "Pena Valdez"),
      Chat("images/chat/n1.png", "Pena Valdez"),
      Chat("images/chat/n4.png", "Pena Valdez"),
      Chat("images/chat/n2.png", "Pena Valdez"),
      Chat("images/chat/n3.png", "Pena Valdez"),
      Chat("images/chat/n5.png", "Pena Valdez"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 172, 219, 251)),
            ),
            onPressed: () {
              // Điều hướng đến SecondPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
            child: const Text(
              " My exprience",
              style: TextStyle(color: Colors.pink),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 500, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Thanh trang thái (ví dụ 9:40, tín hiệu, wifi)
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "9:40",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.signal_cellular_4_bar,
                                size: 20, color: Colors.black),
                            SizedBox(width: 6),
                            Icon(Icons.wifi, size: 20, color: Colors.black),
                            SizedBox(width: 6),
                            Icon(Icons.battery_full,
                                size: 20, color: Colors.black),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Add Frriends bar
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.navigate_before,
                          size: 50,
                        ),
                        SizedBox(width: 120),
                        Text(
                          "Add Friends",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Done",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Thanh tim kiem
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search Friend',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // hinh anh
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          // Ảnh đại diện tròn 1
                          CircleAvatar(
                            radius: 30,
                            child: Image.asset("images/chat/n1.png",
                                width: double.infinity, fit: BoxFit.cover),
                          ),
                          Positioned(
                            top: 0, // Vị trí phía trên cùng
                            right: 0, // Vị trí góc trái
                            child: Image.asset(
                              "images/chat/Close.png", // Đường dẫn đến ảnh dấu "X"
                              width: 20, // Điều chỉnh kích thước dấu "X"
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Stack(
                        children: [
                          // Ảnh đại diện tròn 2
                          CircleAvatar(
                            radius: 30,
                            child: Image.asset("images/chat/n2.png",
                                width: double.infinity, fit: BoxFit.cover),
                          ),
                          Positioned(
                            top: 0, // Vị trí phía trên cùng
                            right: 0, // Vị trí góc trái
                            child: Image.asset(
                              "images/chat/Close.png", // Đường dẫn đến ảnh dấu "X"
                              width: 20, // Điều chỉnh kích thước dấu "X"
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        lsChats.length, // Số lượng ảnh từ danh sách lsPhotos
                    itemBuilder: (context, index) {
                      Chat chat = lsChats[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Chatwidget(avatar: chat.avatar, name: chat.name),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  // Thanh ngang cuoi trang
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset('images/chat/thanhngang.png')],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Man hinh 2
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<Exprience> lsExpriences = [
      Exprience(
          "images/expriences/hoian1.png",
          "images/expriences/hoian2.png",
          "images/expriences/hoian3.png",
          "2 Hour Bicycle Tour exploring Hoian",
          "Hoian, Vietnam",
          "Jan 25,2020",
          "1234 Likes"),
      Exprience(
          "images/expriences/fod1.png",
          "images/expriences/fod2.png",
          "images/expriences/fod3.png",
          "Food tour in Danang",
          "Danang, Vietnam",
          "Jan 20,2020",
          "234 Likes"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("My expriences"),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 172, 219, 251)),
            ),
            onPressed: () {
              // Điều hướng đến SecondPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThirddPage()),
              );
            },
            child: const Text(
              " Notifi",
              style: TextStyle(color: Colors.pink),
            ),
          ),
        ],
      ),
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 500, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                color: Colors.white,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "9:40",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    // SizedBox(width: 100,),
                    Row(
                      children: [
                        Icon(Icons.signal_cellular_4_bar_rounded,
                            size: 20, color: Colors.black),
                        SizedBox(width: 6),
                        Icon(Icons.wifi, size: 20, color: Colors.black),
                        SizedBox(width: 6),
                        Icon(Icons.battery_full_sharp,
                            size: 20, color: Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // My Ẽxrience
              Container(
                color: Colors.white,
                child: const Row(
                  children: [
                    Icon(
                      Icons.chevron_left,
                      size: 50,
                    ),
                    SizedBox(width: 150),
                    Text(
                      "My Expriences",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0), // Tạo khoảng cách 16 đơn vị hai bên
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), // Thêm padding bên trong Container
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.teal.withOpacity(0.8), width: 1),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.teal,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Add Experience",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // Exprience
              ListView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // Để tránh cuộn bên trong ListView
                shrinkWrap: true,
                itemCount: lsExpriences.length,
                itemBuilder: (context, index) {
                  Exprience experience = lsExpriences[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ExperienceWidgets(
                      avatar1: experience.avatar1,
                      avatar2: experience.avatar2,
                      avatar3: experience.avatar3,
                      title: experience.title,
                      local: experience.local,
                      date: experience.date,
                      like: experience.like,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset('images/chat/thanhngang.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Man hinh 3
class ThirddPage extends StatelessWidget {
  const ThirddPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<Notifi> lsNos = [
      Notifi(
          "./images/notifi/n1.png",
          "Yoo Jin chose you for the trip in DaNang,",
          "Jan 16",
          "images/notifi/v1.png",
          "images/notifi/local.png",
          " Vietnam on Jan 20, 2020"),
      Notifi(
          "./images/notifi/n1.png",
          "Yoo Jin pay upfront 50% for the trip in DaNang,",
          "Jan 16",
          "images/notifi/v2.png",
          "images/notifi/money.png",
          " Vietnamese on Jan 20, 2020"),
      Notifi("./images/notifi/n1.png", "Yoo Jin left a review for you,",
          "Jan 24", "images/notifi/v3.png", "images/notifi/pen.png", " "),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 172, 219, 251)),
            ),
            onPressed: () {
              // Điều hướng đến SecondPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FourdPage()),
              );
            },
            child: const Text(
              " Profile",
              style: TextStyle(
                color: Colors.pink,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 490, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Background image
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/notifi/danang.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // My trips
                  const Padding(
                    padding: EdgeInsets.only(top: 140, right: 20, left: 10),
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white),
                    ),
                  ),
                  // Search
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 70, right: 10, left: 490),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color.fromARGB(255, 196, 192, 192)
                          .withOpacity(0.3),
                      child: const Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                  // App bar với nút back và tín hiệu di động
                  const SafeArea(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "9:41",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          // Các icon tín hiệu
                          Row(
                            children: [
                              Icon(Icons.signal_cellular_alt,
                                  color: Colors.white),
                              SizedBox(width: 5),
                              Icon(Icons.wifi, color: Colors.white),
                              SizedBox(width: 5),
                              Icon(Icons.battery_full, color: Colors.white),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Để tránh cuộn bên trong ListView
                itemCount: lsNos.length,
                itemBuilder: (context, index) {
                  Notifi no = lsNos[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Notifiwidget(
                      avatar: no.avatar,
                      title: no.title,
                      date: no.date,
                      circle: no.circle,
                      icon: no.icon,
                      title1: no.title1,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 250,
              ),
              Image.asset(
                "images/notifi/TabBar.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Image.asset("images/chat/thanhngang.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Man hinh 4
class FourdPage extends StatelessWidget {
  const FourdPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 172, 219, 251)),
            ),
            onPressed: () {
              // Điều hướng đến SecondPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FivePage()),
              );
            },
            child: const Text(
              "Trip Detail",
              style: TextStyle(color: Colors.pink),
            ),
          ),
        ],
      ),
      // Body
      body: Container(
        color: Colors.grey[200], // Màu nền của body
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 490, vertical: 40),
            child: Container(
              color: Colors.white, // Màu nền cho phần chứa Padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // App bar với nút back và tín hiệu di động
                  const SafeArea(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "9:41",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          // Các icon tín hiệu
                          Row(
                            children: [
                              Icon(Icons.signal_cellular_alt,
                                  color: Colors.black),
                              SizedBox(width: 5),
                              Icon(Icons.wifi, color: Colors.black),
                              SizedBox(width: 5),
                              Icon(Icons.battery_full, color: Colors.black),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Edit Profile
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          "SAVE",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 77, 207, 194),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Hinh anh
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Image.asset("images/avatar.png"),
                          Positioned(
                            top: -10,
                            right: -20,
                            child: Image.asset(
                              "images/cam.png",
                              width: 60,
                              height: 60,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // PassWord
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TextField(
                          decoration: InputDecoration(
                            labelText: "PassWord",
                            labelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 30,
                            ),
                            hintText: "**********",
                            hintStyle: TextStyle(fontSize: 15),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Change password
                        const Row(
                          children: [
                            Text(
                              "Change password",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 77, 207, 194),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // Adress
                        const TextField(
                          decoration: InputDecoration(
                            labelText: "Address",
                            labelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 30,
                            ),
                            hintText: "123 Xo Viet Nghe Tinh",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              height: 2,
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            // Danang
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  hintText: 'Danang',
                                  hintStyle: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 37, 35, 35)
                                              .withOpacity(0.9),
                                      fontSize: 20),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            //
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  hintText: 'Vietnam',
                                  hintStyle: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 37, 35, 35)
                                              .withOpacity(0.9),
                                      fontSize: 20),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Phone number
                        const TextField(
                          decoration: InputDecoration(
                            labelText: "Phone number",
                            labelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 30,
                            ),
                            hintText: "(+84)  912345678",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              height: 2,
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // change avaible
                        const Row(
                          children: [
                            Text(
                              "Change Available time",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 77, 207, 194),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        Center(
                          child: Image.asset("images/chat/thanhngang.png"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Man hinh 5
class FivePage extends StatelessWidget {
  const FivePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trip Detail"),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 172, 219, 251)),
            ),
            onPressed: () {
              // Điều hướng đến SecondPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SixPage()),
              );
            },
            child: const Text(
              "Tour Detail",
              style: TextStyle(color: Colors.pink),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 540, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Thanh trang thái (ví dụ 9:40, tín hiệu, wifi)
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "9:40",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.signal_cellular_4_bar,
                                size: 20, color: Colors.black),
                            SizedBox(width: 6),
                            Icon(Icons.wifi, size: 20, color: Colors.black),
                            SizedBox(width: 6),
                            Icon(Icons.battery_full,
                                size: 20, color: Colors.black),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Add Photos bar
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: const Row(
                      children: [
                        Icon(Icons.close),
                        SizedBox(width: 180),
                        Text(
                          "Trip detail",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Hinh anh
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Card(
                        child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              "images/detail/danang.png",
                              width: 425,
                              fit: BoxFit.cover,
                            ),
                            const Positioned(
                              left: 8,
                              bottom: 5,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, color: Colors.white),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Danang, Vietnam",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Avatar
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: Image.asset("images/detail/avatar.png"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Date",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                width: 200,
                              ),
                              Text(
                                "Feb 2, 2020",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 17,
                                ),
                              )
                            ],
                          ),
                        ),
                        // Thoi gian
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Time",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                width: 200,
                              ),
                              Text(
                                "8:00 AM - 10:00 AM",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 17,
                                ),
                              )
                            ],
                          ),
                        ),
                        // Guide
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Guide",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(
                                width: 195,
                              ),
                              Text(
                                "Emmy",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 86, 227, 213),
                                  fontSize: 17,
                                ),
                              )
                            ],
                          ),
                        ),
                        // Number
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Number of Travelers",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(
                                width: 80,
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 17,
                                ),
                              )
                            ],
                          ),
                        ),
                        // Atrraction
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    "Atractions",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // buton
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Chip(
                                      avatar: const Icon(
                                        Icons.location_on,
                                        color:
                                            Color.fromARGB(255, 79, 212, 199),
                                      ),
                                      label: const Text('Ho Guom'),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      elevation: 2.0,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Chip(
                                      avatar: const Icon(
                                        Icons.location_on,
                                        color:
                                            Color.fromARGB(255, 79, 212, 199),
                                      ),
                                      label: const Text('Ho Hoan Kiem'),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      elevation: 2.0,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Chip(
                                      avatar: const Icon(
                                        Icons.location_on,
                                        color:
                                            Color.fromARGB(255, 79, 212, 199),
                                      ),
                                      label: const Text('Pho 12 Pho Kim Ma'),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      elevation: 2.0,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Free",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          color:
                                              Color.fromARGB(255, 84, 234, 219),
                                        ),
                                        Text(
                                          "20.00",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 84, 234, 219),
                                            fontSize: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Chip(
                                avatar: Icon(
                                  Icons.check,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                label: const Text(
                                  'Mark Finished',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                elevation: 2.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Center(
                    child: Image.asset("images/chat/thanhngang.png"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Man hinh 6
class SixPage extends StatelessWidget {
  const SixPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<Tour> lsTours = [
      Tour(
          "6:00 AM",
          "Lorem Ipsum is simply dummy text of the",
          "printing and typesetting industry. Lorem Ipsum",
          "has been the industry's standard dummy text",
          "ever since the 1500s, when an unknown printer",
          "took a galley of type and scrambled."),
      Tour(
          "10:00 AM",
          "Lorem Ipsum is simply dummy text of the",
          "printing and typesetting industry. Lorem Ipsum",
          "has been the industry's standard dummy text",
          "ever since the 1500s, when an unknown printer",
          "took a galley of type and scrambled."),
      Tour(
          "1:00 AM",
          "Lorem Ipsum is simply dummy text of the",
          "printing and typesetting industry. Lorem Ipsum",
          "has been the industry's standard dummy text",
          "ever since the 1500s, when an unknown printer",
          "took a galley of type and scrambled."),
      Tour(
          "8:00 AM",
          "Lorem Ipsum is simply dummy text of the",
          "printing and typesetting industry. Lorem Ipsum",
          "has been the industry's standard dummy text",
          "ever since the 1500s, when an unknown printer",
          "took a galley of type and scrambled."),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tour Detail"),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 172, 219, 251)),
            ),
            onPressed: () {
              // Điều hướng đến SecondPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
            child: const Text(
              "",
              style: TextStyle(color: Colors.pink),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 500, vertical: 40),
              child: Column(
                children: [
                  Stack(children: [
                    Image.asset("images/tour/ho.png",
                        width: double.infinity, fit: BoxFit.cover),
                    Positioned(
                      top: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 290,
                          ),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.share,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.bookmark_border,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        left: 50,
                        right: 50,
                        bottom: 0,
                        child: Image.asset(
                          "images/tour/icon.png",
                          width: 50,
                        )),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  // Danang - BaNa
                  Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "DaNang - BaNa - HoiAn",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$400.00',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 59, 232, 214),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Icon ngooi sao
                        Row(
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 246, 228, 71),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 246, 228, 71),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 246, 228, 71),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 246, 228, 71),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 246, 228, 71),
                                  size: 20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "145 Reviews",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(
                              width: 230,
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$450.00',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(0.4)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Provider",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 45,
                            ),
                            const Text(
                              "dulichviet",
                              style: TextStyle(
                                color: Color.fromARGB(255, 57, 221, 204),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),

                        //card
                        Card(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 10, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "Summary",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Itinerary",
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Da Nang - Ba Na - Hoi An",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Duration",
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "2 days, 2 nights",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Departure Date",
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Feb 12",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Departure Place",
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Ho Chi Minh",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        //Schedule
                        Row(
                          children: [
                            Image.asset("images/tour/iconsach.png"),
                            const SizedBox(width: 15),
                            const Text(
                              "Schedule",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 25),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Day 1 and day 2
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Thêm logic khi nhấn nút Day 1
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 28, 213, 194),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Day 1',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 20),
                            TextButton(
                              onPressed: () {
                                // Thêm logic khi nhấn nút Day 2
                              },
                              child: const Text(
                                'Day 2',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Ho Chi Minh Da Nang
                        const Row(
                          children: [
                            Text(
                              " Ho Chi Minh - Da Nang",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // List View
                          ],
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics:
                                const NeverScrollableScrollPhysics(), // Để tránh cuộn bên trong ListView
                            itemCount: lsTours.length,
                            itemBuilder: (context, index) {
                              Tour tour = lsTours[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Tourwidget(
                                  time: tour.time,
                                  title: tour.title,
                                  title2: tour.title2,
                                  title3: tour.title3,
                                  title4: tour.title4,
                                  title5: tour.title5,
                                ),
                              );
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "images/tour/icontien.png",
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Price",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20.0, right: 25),
                          child: Table(
                            border: TableBorder.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const TableRow(children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Adult (>10 years old)',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '\$400.00',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ]),
                              const TableRow(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Child (5 - 10 years old)',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '\$320.00',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              const TableRow(children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Child (<5 years old)',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Free',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ])
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.only(left: 35, right: 35),
                          child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Thêm logic khi nhấn nút
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 60, 197, 183),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 22),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'BOOK THIS TOUR',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
