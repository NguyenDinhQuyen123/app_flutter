import 'package:flutter/material.dart';  
import 'dart:convert';  
import 'package:http/http.dart' as http;  

class TourGuideWidget extends StatefulWidget {  
  const TourGuideWidget({super.key});  

  @override  
  State<TourGuideWidget> createState() => _TourGuideWidgetState();  
}  

class _TourGuideWidgetState extends State<TourGuideWidget> {  
  Future<List<Guide>> fetchGuides() async {  
    final response = await http.get(Uri.parse('https://travel-api-8m3x.onrender.com/api/guides'));  

    if (response.statusCode == 200) {  
      List<dynamic> body = json.decode(response.body);  
      return body.map((dynamic item) => Guide.fromJson(item)).toList();  
    } else {  
      throw Exception('Failed to load guides');  
    }  
  }  

  late Future<List<Guide>> futureGuides;  

  @override  
  void initState() {  
    super.initState();  
    futureGuides = fetchGuides();  
  }  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('Book Your Own Guide'),  
        actions: [  
          IconButton(  
            icon: const Icon(Icons.search),  
            onPressed: () {  
              // Implement search functionality  
            },  
          ),  
        ],  
      ),  
      body: FutureBuilder<List<Guide>>(  
        future: futureGuides,  
        builder: (context, snapshot) {  
          if (snapshot.connectionState == ConnectionState.waiting) {  
            return const Center(child: CircularProgressIndicator());  
          } else if (snapshot.hasError) {  
            return Center(child: Text('Error: ${snapshot.error}'));  
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {  
            return const Center(child: Text('No guides available.'));  
          } else {  
            return GridView.builder(  
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                crossAxisCount: 2, // Set to 2 for two columns  
                childAspectRatio: 0.8, // Adjust this to your preference  
              ),  
              itemCount: snapshot.data!.length,  
              itemBuilder: (context, index) {  
                final guide = snapshot.data![index];  
                return GuideCard(guide: guide);  
              },  
            );  
          }  
        },  
      ),  
    );  
  }  
}  

class GuideCard extends StatelessWidget {  
  final Guide guide;  

  const GuideCard({super.key, required this.guide});  

  @override  
  Widget build(BuildContext context) {  
    return Card(  
      margin: const EdgeInsets.all(10),  
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: [  
          Image.network(guide.imageUrl, fit: BoxFit.cover, height: 120, width: double.infinity),  
          Padding(  
            padding: const EdgeInsets.all(8.0),  
            child: Column(  
              crossAxisAlignment: CrossAxisAlignment.start,  
              children: [  
                Text(  
                  guide.name,  
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),  
                ),  
                Text(  
                  guide.location,  
                  style: const TextStyle(color: Colors.grey),  
                ),  
                Row(  
                  children: [  
                    const Icon(  
                      Icons.star,  
                      color: Colors.yellow,  
                      size: 16,  
                    ),  
                    Text('${guide.rating} (${guide.reviews} Reviews)'),  
                  ],  
                ),  
              ],  
            ),  
          ),  
        ],  
      ),  
    );  
  }  
}  

class Guide {  
  final String id;  
  final String name;  
  final String location;  
  final String imageUrl;  
  final double rating;  
  final int reviews;  

  Guide({  
    required this.id,  
    required this.name,  
    required this.location,  
    required this.imageUrl,  
    required this.rating,  
    required this.reviews,  
  });  

  factory Guide.fromJson(Map<String, dynamic> json) {  
    return Guide(  
      id: json['_id'],  
      name: json['name'],  
      location: json['location'],  
      imageUrl: json['imageUrl'],  
      rating: json['rating'].toDouble(),  
      reviews: json['reviews'],  
    );  
  }  
}