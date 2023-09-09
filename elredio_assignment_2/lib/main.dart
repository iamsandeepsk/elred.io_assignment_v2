import 'package:elredio_assignment_2/features/artist/view_model/artist_view_model.dart';
import 'package:elredio_assignment_2/features/change_design/view/change_design.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/change_design/view_model/change_design_view_model.dart';
import 'resource/resource.dart';

  /// USED TO GET CONTEXT IN WIGEET TREE AND NAVIGATOR STATE
GlobalKey<NavigatorState> navigatorKey=GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ///
        ChangeNotifierProvider(
          create: (context) => ChangeDesignViewModel(),
        ),
        ///
        ChangeNotifierProvider(
          create: (context) => ArtistViewModel(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: AppStrings.appName,

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ChangeDesign(),
      ),
    );
  }
}
