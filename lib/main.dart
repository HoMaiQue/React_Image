import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:react_image/model/image.dart';
import 'package:react_image/provider/image_provider.dart';
import 'package:react_image/widget/body_swiper.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ImagePr(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<ImageModel> imageList = [
    ImageModel(
        id: "1",
        name: "Central Data Assistant",
        imageSrc: "assets/images/image1.jpg"),
    ImageModel(
        id: "2",
        name: "Product Metrics Administrator",
        imageSrc: "assets/images/image2.jpg"),
    ImageModel(
        id: "3",
        name: "Dynamic Configuration Engineer",
        imageSrc: "assets/images/image3.jpg"),
    ImageModel(
        id: "4",
        name: "Principal Identity Orchestrator",
        imageSrc: "assets/images/image4.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    print(12);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Favorite Image",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Consumer<ImagePr>(builder: (context, image, child) {
            return Badge(
              label: Text(
                image.favorite.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              child: const Icon(Icons.favorite),
            );
          }),
        ),
        actions: [
          PopupMenuButton(
              itemBuilder: (_) => [
                    const PopupMenuItem(child: Text("Show all")),
                    const PopupMenuItem(child: Text("Favorite image")),
                  ])
        ],
      ),
      body: BodySwipe(list: imageList),
    );
  }
}
