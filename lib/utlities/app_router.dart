import 'package:flutter/material.dart';
import 'package:stashpoints/features/stashpoints/widgets/custom_date_and_time_picker.dart';
import 'package:stashpoints/features/stashpoints/widgets/stashpoint_search.dart';

import '../features/stashpoints/stashpoints_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StashpointsView.route:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const StashpointsView());

      case CustomDateTimePicker.route:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const CustomDateTimePicker());

      case StashpointSearchView.route:
        final args = settings.arguments as StashpointSearchViewArgs;
        return MaterialPageRoute<dynamic>(
            builder: (_) =>  StashpointSearchView(
              args: args,
            ));

      default:
        return MaterialPageRoute<dynamic>(builder: (_) {
          return Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          );
        });
    }
  }
}
