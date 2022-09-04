import 'package:bmi/constants.dart';
import 'package:bmi/navigation/app_router.dart';
import 'package:flutter/material.dart';

class RecalculateBMIButton extends StatelessWidget {
  const RecalculateBMIButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Calculating...");
        AppRouter.toResults(context);
      },
      child: Container(
        child: Center(
          child: Text(
            "Calculate".toUpperCase(),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        color: Theme.of(context).colorScheme.tertiary,
        margin: const EdgeInsets.only(
          top: 10.0,
        ),
        width: double.infinity,
        height: bottomContainerHeight,
        padding: EdgeInsets.only(bottom: 10),
      ),
    );
  }
}
