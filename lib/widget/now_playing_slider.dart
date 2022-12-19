import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constant/constant_widget.dart';
import '../model/movie_model.dart';
import '../screens/details_moveis.dart';

class NowPlayingSlider extends StatelessWidget {
  const NowPlayingSlider({
    Key? key,
    required this.nowPlaying,
  }) : super(key: key);
  final List<MovieModel> nowPlaying;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: nowPlaying.length,
      itemBuilder: (BuildContext context, int index, _) {
        MovieModel movie = nowPlaying[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailsMoveisScreen.route,
              arguments: movie.id,
            );
          },
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return CustomConstantWidget.indicator();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                  left: 15,
                ),
                child: Text(
                  movie.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
      ),
    );
  }
}
