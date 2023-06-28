import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stashpoints/features/stashpoints/stashpoints_view.dart';
import 'package:stashpoints/features/stashpoints/view_model/stashpoint_view_model.dart';
import 'package:stashpoints/utlities/app_router.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final _navigatorKey = GlobalKey<NavigatorState>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StashpointViewModel>(
          create: (_) => StashpointViewModel(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: MaterialApp(
          title: "Stasher",
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
          home: Navigator(
            key: _navigatorKey,
            initialRoute: StashpointsView.route,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        ),
      ),
    );
  }
}
