
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Filters extends StatelessWidget{
  const Filters({super.key, required this.setPickUp, required this.setDropOff, required this.setCapacity});

  final Function()? setPickUp;
  final Function()? setDropOff;
  final Function()? setCapacity;

  @override
  Widget build(BuildContext context) {

    return  Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: setPickUp,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                ),
                child: Text("Pick up", style: TextStyle(fontWeight: FontWeight.bold),)),
          ),
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
              ),
              child: Text("Drop off", style: TextStyle(fontWeight: FontWeight.bold),)),
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
              ),
              child: Text("Capacity", style: TextStyle(fontWeight: FontWeight.bold),)),
        ),
      ],
    );
  }


}