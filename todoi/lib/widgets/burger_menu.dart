import 'package:flutter/material.dart';

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: IconButton(
              // iconSize: 30,
              icon: Icon(
                Icons.list,
                size: 30.0,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Todoi",
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      ),
    );
  }
}
