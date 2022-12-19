import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant/constant_widget.dart';
import '../model/movie_model.dart';
import '../screens/details_moveis.dart';

class SearchItemsWidget extends StatelessWidget {
  const SearchItemsWidget({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final MovieModel movies;

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          DetailsMoveisScreen.route,
          arguments: movies.id,
        );
      },
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: "https://image.tmdb.org/t/p/w500${movies.posterPath}",
              placeholder: (context, url) {
                return CustomConstantWidget.indicator();
              },
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: width * 0.29,
                  height: hight * 0.19,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      movies.title.length > 25
                          ? "${movies.title.substring(0, 25)}...."
                          : movies.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: hight * 0.01),
                    Text(
                      movies.overview,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
