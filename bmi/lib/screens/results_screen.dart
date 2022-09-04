import 'package:bmi/navigation/app_router.dart';
import 'package:bmi/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI - ResultsScreen"),
        // backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Center(child: Text("Results")),
            Expanded(
              child: Container(
                child: Text(
                  "Your results",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CustomCard(
                color: Theme.of(context).colorScheme.secondary,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Overweight".toUpperCase(),
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "33",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      "Your BMI result is quite high. Chill...",
                      // style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                AppRouter.toHome(context);
              },
              child: Text(
                "Go Back",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
