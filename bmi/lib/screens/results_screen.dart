import 'package:bmi/navigation/app_router.dart';
import 'package:bmi/services/bmi.dart';
import 'package:bmi/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BMI args = ModalRoute.of(context)!.settings.arguments as BMI;

    // print("args: ${args.calculateBMI()}");
    // print("args: ${args.getInterpretation()}");
    // print("args: ${args.getResult()}");

    // print("args: $args");

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
                      args.getResult().toUpperCase(),
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      args.calculateBMI(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      args.getInterpretation(),
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
