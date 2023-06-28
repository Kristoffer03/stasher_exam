import 'package:flutter/material.dart';

class LocationTile extends StatelessWidget {
  const LocationTile(
      {Key? key, required this.location, required this.onViewItem})
      : super(key: key);

  final String location;
  final VoidCallback onViewItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onViewItem,
      horizontalTitleGap: 0,
      leading: Icon(Icons.location_pin),
      title: Text(
        location,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
