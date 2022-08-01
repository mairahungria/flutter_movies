import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/movie_details/models/settings_model.dart';
import 'features/movie_details/controllers/movie_details_controller.dart';
import 'shared/resources/strings.dart';
import 'shared/resources/theme.dart';
import 'shared/services/client_http.dart';
import 'features/home/controllers/home_controller.dart';
import 'features/home/home_page.dart';
import 'features/movie_details/movie_details_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ClientHttp()),
        ChangeNotifierProvider(
          create: (context) => HomeController(context.read()),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieDetailsController(context.read()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.appTitle,
        theme: appTheme(),
        initialRoute: Strings.routeHome,
        onGenerateRoute: (settings) {
          if (settings.name == Strings.routeMovieDetails) {
            final _data = settings.arguments as Settings;
            return MaterialPageRoute(
                builder: (context) => MovieDetailsPage(data: _data));
          }
          return null;
        },
        routes: {
          Strings.routeHome: (_) => const HomePage(),
        },
      ),
    );
  }
}
