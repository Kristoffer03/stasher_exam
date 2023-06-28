
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stashpoints/features/stashpoints/model/stashpoints_model.dart';
import 'package:stashpoints/utlities/asset_images.dart';

class StashpointTile extends StatelessWidget{
  const StashpointTile({this.stashpointDetails, super.key});

  final Items? stashpointDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${stashpointDetails?.name}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            Text("${stashpointDetails?.rating}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
          ],
        ),
        Text("£${stashpointDetails?.address}", style: TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis),),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          decoration: BoxDecoration(
            color: stashpointDetails!.openTwentyfourSeven ? Colors.lightBlue : Colors.grey
          ),
          child: Text("24/7", style: TextStyle(color: Colors.white, fontSize: 13),),
        ),
        Text("£${stashpointDetails?.bookingFee}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
      ],
    );
  }

}