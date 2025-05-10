import 'package:bmicalc/main.dart';
import 'package:flutter/material.dart';
import 'package:bmicalc/icon_content.dart';
import 'package:bmicalc/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

Color maleColorSelected = Colors.purpleAccent;
Color femaleColorSelected = Colors.purpleAccent;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? maleColorSelected
                        : inactiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? femaleColorSelected
                        : inactiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              color: activeCardColor,
              cardChild: const Center(child: Text('Height Section')),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    color: activeCardColor,
                    cardChild: const Center(child: Text('Weight')),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    color: activeCardColor,
                    cardChild: const Center(child: Text('Age')),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: bottomContainerColor,
            height: bottomContainerHeight,
            width: double.infinity,
            child: const Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic here if needed
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
