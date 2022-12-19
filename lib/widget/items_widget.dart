// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/model/movie_model.dart';

import '../constant/constant_widget.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
          placeholder: (context, url) {
            return CustomConstantWidget.indicator();
          },
          imageBuilder: (context, imageProvider) {
            return Container(
              width: width * 0.44,
              height: hight * 0.29,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        SizedBox(height: hight * 0.01),
        Text(
          movie.title.length > 19
              ? "${movie.title.substring(0, 19)}...."
              : movie.title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black45,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: hight * 0.001),
        Row(
          children: [
            const Icon(
              Icons.star,
              size: 16,
              color: Colors.yellow,
            ),
            SizedBox(width: width * 0.001),
            Text(movie.voteAverage.toString()),
          ],
        )
      ],
    );
  }
}
