import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/stashpoint_view_model.dart';

class LocationNameHeader extends StatelessWidget {
  LocationNameHeader({this.onTap, super.key});

  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    StashpointViewModel productViewModel = context.watch<StashpointViewModel>();

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5,),
                        Text(productViewModel.stashParamsModel?.name ??
                            "Search your location", style: TextStyle(overflow: TextOverflow.ellipsis),),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }


}