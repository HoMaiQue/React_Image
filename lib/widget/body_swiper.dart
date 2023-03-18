import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:provider/provider.dart';
import 'package:react_image/model/image.dart';
import 'package:react_image/provider/image_provider.dart';

class BodySwipe extends StatelessWidget {
  BodySwipe({super.key, required this.isFavorite});
  bool isFavorite;
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ImagePr>(context);
    final list = isFavorite ? data.getFavorite() : data.list;
    if (list.isEmpty) {
      return Container(
        child: const Center(
          child: Text("List is empty"),
        ),
      );
    }
    return Swiper(
      layout: SwiperLayout.STACK,
      itemHeight: 650,
      itemWidth: 350,
      itemCount: list.length,
      itemBuilder: (BuildContext context, index) {
        return ChangeNotifierProvider.value(
          value: list[index],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.white12,
                title: Consumer<ImageModel>(
                  builder: (BuildContext context, image, child) {
                    return InkWell(
                      onTap: () {
                        image.onToggleFavorite();
                        Provider.of<ImagePr>(context, listen: false)
                            .handleCountFavorites();
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 30,
                        color: image.isFavorite ? Colors.red : Colors.white,
                      ),
                    );
                  },
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
          ),
        );
      },
    );
  }
}
