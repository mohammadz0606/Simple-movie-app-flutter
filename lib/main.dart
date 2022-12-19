import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/controller/actors_movies/actors_cubit.dart';
import 'package:movie_app/controller/crews_movies/crews_cubit.dart';
import 'package:movie_app/controller/popular_movies/popular_cubit.dart';
import 'package:movie_app/controller/top_rated_moves/top_rated_cubit.dart';
import 'package:movie_app/screens/details_moveis.dart';
import 'package:movie_app/screens/popular_screen.dart';
import 'package:movie_app/screens/top_rated_screen.dart';
import 'package:movie_app/screens/upcoming_screen.dart';
import 'package:movie_app/services/web_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/cast_movies/cast_cubit.dart';
import 'controller/details_movies/details_cubit.dart';
import 'controller/movies/movies_cubit.dart';
import 'controller/sreenshot_movies_image/movies_image_cubit.dart';
import 'controller/upcoming_movies/upcoming_cubit.dart';
import 'screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MovieApp());
}

//2ba5c535fbab6c354967c44dfb2142d4
class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesCubit(
            webServices: WebServices(),
          ),
        ),
        BlocProvider(
          create: (context) => TopRatedCubit(
            webServices: WebServices(),
          ),
        ),
        BlocProvider(
          create: (context) => PopularCubit(
            webServices: WebServices(),
          ),
        ),
        BlocProvider(
          create: (context) => UpcomingCubit(
            webServices: WebServices(),
          ),
        ),
        BlocProvider(
          create: (context) => ActorsCubit(
            webServices: WebServices(),
          ),
        ),
        BlocProvider(
          create: (context) => DetailsCubit(
            webServices: WebServices(),
          ),
        ),
        BlocProvider(
          create: (context) => MoviesImageCubit(
            webServices: WebServices(),
          ),
        ),
        BlocProvider(
          create: (context) => CastCubit(
            webServices: WebServices(),
          ),
        ),
        BlocProvider(
          create: (context) => CrewsCubit(
            webServices: WebServices(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black87,
            ),
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        home: const HomePage(),
        routes: {
          TopRatedScreen.route: (context) => const TopRatedScreen(),
          PopularScreen.route: (context) => const PopularScreen(),
          UpcomingScreen.route: (context) => const UpcomingScreen(),
          DetailsMoveisScreen.route: (context) => const DetailsMoveisScreen(),
        },
      ),
    );
  }
}
