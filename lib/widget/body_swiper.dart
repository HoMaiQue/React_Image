import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:provider/provider.dart';
import 'package:react_image/model/image.dart';
import 'package:react_image/provider/image_provider.dart';

class BodySwipe extends StatelessWidget {
  const BodySwipe({super.key, required this.list});
  final List<ImageModel> list;
  @override
  Widget build(BuildContext context) {
    return Swiper(
      layout: SwiperLayout.STACK,
      itemHeight: 650,
      itemWidth: 350,
      itemCount: list.length,
      itemBuilder: (BuildContext context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.white12,
              title: InkWell(
                onTap: () {
                  Provider.of<ImagePr>(context, listen: false).updateFavorite();
                },
                child: const Icon(
                  Icons.favorite,
                  size: 30,
                ),
              ),
              subtitle: const Text("Like Image"),
              trailing: Text(
                list[index].name,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            child: Image.asset(
              list[index].imageSrc,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
