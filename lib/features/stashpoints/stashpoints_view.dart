import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stashpoints/features/stashpoints/view_model/stashpoint_view_model.dart';
import 'package:stashpoints/features/stashpoints/widgets/custom_date_and_time_picker.dart';
import 'package:stashpoints/features/stashpoints/widgets/filters.dart';
import 'package:stashpoints/features/stashpoints/widgets/location_name_header.dart';
import 'package:stashpoints/features/stashpoints/widgets/location_tile.dart';
import 'package:stashpoints/features/stashpoints/widgets/stashpoint_search.dart';
import 'package:stashpoints/features/stashpoints/widgets/stashpoint_tile.dart';
import 'package:stashpoints/utlities/enum.dart';
import '../../components/app_error.dart';
import '../../components/app_loading.dart';

class StashpointsView extends StatefulWidget {
  const StashpointsView({Key? key}) : super(key: key);

  static const String route = 'stashpoint-view-page';

  @override
  State<StashpointsView> createState() => _StashpointsViewState();
}

class _StashpointsViewState extends State<StashpointsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StashpointViewModel>(context, listen: false).getStashpoints();
    });
  }

  @override
  Widget build(BuildContext context) {
    StashpointViewModel stashpointViewModel = context.watch<StashpointViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stashpoints"),
      ),
      body: _ui(stashpointViewModel, context),
    );
  }

  _ui(StashpointViewModel stashpointViewModel, BuildContext context) {
    if (stashpointViewModel.loading) {
      return AppLoading();
    }
    if (stashpointViewModel.userError != null) {
      return AppError(error: stashpointViewModel.userError);
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          LocationNameHeader(
            onTap: () {
              Navigator.pushNamed(context, StashpointSearchView.route,
                  arguments: StashpointSearchViewArgs(
                      searchTerm:
                      stashpointViewModel.stashParamsModel?.name ?? ''));
            },
          ),
          Filters(
              setPickUp: () async {
                Navigator.pushNamed(context, CustomDateTimePicker.route).then((value){
                  if(value != null){
                    stashpointViewModel.updateStashParamsModel(StashParamsEnum.pickup, value);
                  }
                });
              },
              setDropOff: () async{
                Navigator.pushNamed(context, CustomDateTimePicker.route).then((value){
                  if(value != null){
                    stashpointViewModel.updateStashParamsModel(StashParamsEnum.dropoff, value);
                  }
                });
              },
              setCapacity: () {}),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(
                    height: 40,
                  ),
              itemBuilder: (context, index) {
                return StashpointTile(
                  stashpointDetails:
                  stashpointViewModel.stashpointsModel?.items[index],
                );
              },
              itemCount:
              stashpointViewModel.stashpointsModel?.items.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
