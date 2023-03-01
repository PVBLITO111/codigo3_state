import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  double sliderValue = 14.0;
  bool isSelected = false;
  bool isSubRayar = false;
  int group = 3, indexImage = 0;
  List<String> images = [
    "https://images.pexels.com/photos/15735519/pexels-photo-15735519.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/12906891/pexels-photo-12906891.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/11703558/pexels-photo-11703558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/13187382/pexels-photo-13187382.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/13468026/pexels-photo-13468026.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                data,
                style: TextStyle(
                  fontSize: sliderValue,
                  decoration: isSubRayar == true
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  color: group == 1
                      ? Colors.green
                      : group == 2
                          ? Colors.red
                          : Colors.blue,
                ),
                textAlign:
                    isSelected == true ? TextAlign.justify : TextAlign.left,
              ),
              Slider(
                  value: sliderValue,
                  min: 10,
                  max: 40,
                  onChanged: (double value) {
                    sliderValue = value;
                    setState(() {});
                  }),
              // Checkbox(
              //   value: isSelected,
              //   onChanged: (bool? value) {
              //     isSelected = value!;
              //     setState(() {});
              //   },
              // ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('update'),
              ),
              CheckboxListTile(
                value: isSelected,
                title: const Text('Justificar texto'),
                subtitle: const Text('Puedes justificar el texto principal'),
                onChanged: (bool? value) {
                  isSelected = value!;
                  setState(() {});
                },
              ),
              CheckboxListTile(
                value: isSubRayar,
                title: const Text('Subrayae texto'),
                subtitle: const Text('Puedes sub rayar el texto principal'),
                onChanged: (bool? value) {
                  isSubRayar = value!;
                  setState(() {});
                },
              ),
              RadioListTile(
                  value: 1,
                  title: const Text('Color verde'),
                  groupValue: group,
                  onChanged: (int? value) {
                    setState(() {
                      group = value!;
                    });
                  }),
              RadioListTile(
                  value: 2,
                  title: const Text('Color rojo'),
                  groupValue: group,
                  onChanged: (int? value) {
                    setState(() {
                      group = value!;
                    });
                  }),
              RadioListTile(
                  value: 3,
                  title: const Text('Color azul'),
                  groupValue: group,
                  onChanged: (int? value) {
                    setState(() {
                      group = value!;
                    });
                  }),
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.yellow,
                child: Image.network(
                  images[indexImage],
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (indexImage > 0) {
                        indexImage--;
                        setState(() {});
                      }
                    },
                    child: const Text('Anterior'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (indexImage < (images.length - 1)) {
                        indexImage++;
                        setState(() {});
                      }
                    },
                    child: const Text('Siguiente'),
                  ),
                ],
              ),
              indexImage == (images.length - 1)
                  ? ElevatedButton(
                      onPressed: () {
                        indexImage = Random().nextInt(images.length);
                        setState(() {});
                      },
                      child: const Text('Aleatorio'),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}
