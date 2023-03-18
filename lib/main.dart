import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:react_image/provider/image_provider.dart';
import 'package:react_image/widget/body_swiper.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ImagePr(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}

enum FilterOptions { all, favorite }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFavorite = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ImagePr>(context, listen: false).readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.red, Colors.yellow],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
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
                image.countFavorites.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              child: const Icon(Icons.favorite),
            );
          }),
        ),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                setState(() {
                  if (value == FilterOptions.favorite) {
                    isFavorite = true;
                    return;
                  }
                  isFavorite = false;
                });
              },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FilterOptions.all,
                      child: Text("Show all"),
                    ),
                    const PopupMenuItem(
                        value: FilterOptions.favorite,
                        child: Text("Favorite image")),
                  ])
        ],
      ),
      body: BodySwipe(isFavorite: isFavorite),
    );
  }
}
