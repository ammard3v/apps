import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegeterainFree, veganFree }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentfilters});
  final Map<Filter, bool> currentfilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFreeFilterSet = false;
  var lactoseFreeFilterSet = false;
  var vegeterainFreeFilterSet = false;
  var veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    glutenFreeFilterSet = widget.currentfilters[Filter.glutenFree]!;
    lactoseFreeFilterSet = widget.currentfilters[Filter.lactoseFree]!;
    veganFreeFilterSet = widget.currentfilters[Filter.veganFree]!;
    vegeterainFreeFilterSet = widget.currentfilters[Filter.vegeterainFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('your Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop;
      //     if (identifier == 'meals') {
      //       Navigator.of(
      //         context,
      //       ).push(MaterialPageRoute(builder: (ctx) => Tabs()));
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: glutenFreeFilterSet,
            Filter.lactoseFree: lactoseFreeFilterSet,
            Filter.veganFree: veganFreeFilterSet,
            Filter.vegeterainFree: vegeterainFreeFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  glutenFreeFilterSet = isChecked;
                });
              },
              title: Text('Gluten-Free', style: TextStyle(color: Colors.amber)),
              subtitle: Text('only gluten free'),
            ),
            SwitchListTile(
              value: lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: TextStyle(color: Colors.amber),
              ),
              subtitle: Text('only lactose free'),
            ),
            SwitchListTile(
              value: vegeterainFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  vegeterainFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetrain-Free',
                style: TextStyle(color: Colors.amber),
              ),
              subtitle: Text('only vegetrain free'),
            ),
            SwitchListTile(
              value: veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  veganFreeFilterSet = isChecked;
                });
              },
              title: Text('Vegan-Free', style: TextStyle(color: Colors.amber)),
              subtitle: Text('only vegan free'),
            ),
          ],
        ),
      ),
    );
  }
}
