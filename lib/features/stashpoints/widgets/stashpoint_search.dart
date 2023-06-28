
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stashpoints/utlities/enum.dart';

import '../../../components/app_error.dart';
import '../../../components/app_loading.dart';
import '../view_model/stashpoint_view_model.dart';
import 'location_tile.dart';

class StashpointSearchViewArgs{
  StashpointSearchViewArgs({required this.searchTerm});
  String? searchTerm;
}

class StashpointSearchView extends StatelessWidget{
  StashpointSearchView({required this.args, super.key});
  final StashpointSearchViewArgs args;
  static const String route = 'stashpoint-search-view-page';


  @override
  Widget build(BuildContext context) {
    StashpointViewModel productViewModel = context.watch<StashpointViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stashpoints"),
      ),
      body: _ui(productViewModel, context),
    );
  }

  _ui(StashpointViewModel productViewModel, BuildContext context) {
    if (productViewModel.loading) {
      return AppLoading();
    }
    if (productViewModel.userError != null) {
      return AppError(error: productViewModel.userError);
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Form(
                child: TextFormField(
                  initialValue: args.searchTerm,
                  onChanged: (value) {
                    productViewModel.placeAutocomplete(value);
                  },
                  autofocus: true,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      hintText: "Search your location",
                      prefixIcon: Icon(Icons.location_pin),
                      iconColor: Colors.grey),
                )
            ),
          ),


          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 40,
              ),
              itemBuilder: (context, index) {
                return LocationTile(
                    location: "${productViewModel.autoCompleteModel?.predictions[index].description}",
                    onViewItem: () {
                      productViewModel.placeCoordinates("${productViewModel.autoCompleteModel?.predictions[index].placeId}");
                      Navigator.pop(context);
                    });
              },
              itemCount:
              productViewModel.autoCompleteModel?.predictions.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }

}