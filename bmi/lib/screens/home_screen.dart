import 'package:bmi/test.dart';
import 'package:bmi/theme/color_scheme.dart';
import 'package:bmi/widgets/custom_card.dart';
import 'package:bmi/widgets/gender_card_content.dart';
import 'package:bmi/widgets/recalculate_bmi_button.dart';
import 'package:bmi/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum GenderCardId { maleIcon, femaleIcon }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Color maleIconColor = customColorScheme.secondary;
  late Color femaleIconColor = customColorScheme.secondary;

  int height = 180;
  int weight = 60;
  int age = 36;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tester();

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("BMI"),
        // backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      onTap: () {
                        _changeGenderCardActiveColor(GenderCardId.maleIcon);
                      },
                      color: maleIconColor,
                      cardChild: const GenderCardContent(
                          icon: FontAwesomeIcons.mars, label: "Male"),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      onTap: () {
                        _changeGenderCardActiveColor(GenderCardId.femaleIcon);
                      },
                      color: femaleIconColor,
                      cardChild: const GenderCardContent(
                          icon: FontAwesomeIcons.venus, label: "Female"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                color: Theme.of(context).colorScheme.secondary,
                cardChild: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "HEIGHT",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "cm",
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 2,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor:
                                Theme.of(context).colorScheme.tertiary,
                            thumbColor: Theme.of(context).colorScheme.tertiary,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: _changeHeightValue,
                            divisions: 220 - 120,
                            min: 120.0,
                            max: 220.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      color: Theme.of(context).colorScheme.secondary,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            weight.toString(),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  _changeWeightValue(true);
                                },
                                icon: Icons.add,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  _changeWeightValue(false);
                                },
                                icon: Icons.remove,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      color: Theme.of(context).colorScheme.secondary,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            age.toString(),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  _changeAgeValue(true);
                                },
                                icon: Icons.add,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  _changeAgeValue(false);
                                },
                                icon: Icons.remove,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RecalculateBMIButton()
          ],
        ),
      ),
    );
  }

  void _changeWeightValue(bool isIncrease) {
    int newValue = weight;
    if (isIncrease) {
      newValue++;
    } else {
      newValue--;
    }

    if (newValue < 0 || newValue > 200) return;

    setState(() {
      weight = newValue;
    });
  }

  void _changeAgeValue(bool isIncrease) {
    int newValue = age;
    if (isIncrease) {
      newValue++;
    } else {
      newValue--;
    }

    if (newValue < 0 || newValue > 120) return;

    setState(() {
      age = newValue;
    });
  }

  void _changeHeightValue(double value) {
    final intValue = value.toInt();

    setState(() {
      height = intValue;
    });
  }

  void _changeGenderCardActiveColor(GenderCardId cardId) {
    maleIconColor = femaleIconColor = customColorScheme.secondary;

    switch (cardId) {
      case GenderCardId.maleIcon:
        {
          maleIconColor = customColorScheme.secondaryContainer;
          break;
        }
      case GenderCardId.femaleIcon:
        {
          femaleIconColor = customColorScheme.secondaryContainer;
          break;
        }
      default:
        break;
    }

    setState(() {});
  }
}
