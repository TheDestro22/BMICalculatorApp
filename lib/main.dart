import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyState();
}

class _MyState extends State<MyApp> {
  double weight = 50;
  double age = 30;
  double height = 160;
  Color male_pressed = Colors.blue;
  Color female_pressed = Colors.pink;
  Color male = Colors.black;
  Color female = Colors.black;
  int gender = 0;
  double numRes = 0;
  String result = '00';
  String state = 'Normal';
  Color ColState = Colors.green;

  @override
  void initState() {
    super.initState();
    weightinitState();
    ageinitState();
    heightinitState();
  }

  void weightinitState() {
    weightController.text = weight.toString();
    weightController.addListener(_updateWeightFromTextField);
  }

  void ageinitState() {
    ageController.text = age.toString();
    ageController.addListener(_updateAgeFromTextField);
  }

  void heightinitState() {
    heightController.text = height.toString();
    heightController.addListener(_updateHeightFromTextField);
  }

  @override
  void dispose() {
    agedispose();
    weightdispose();
    heightdispose();
    super.dispose();
  }

  void weightdispose() {
    weightController.removeListener(_updateWeightFromTextField);
    weightController.dispose();
  }

  void agedispose() {
    ageController.removeListener(_updateAgeFromTextField);
    ageController.dispose();
  }

  void heightdispose() {
    heightController.removeListener(_updateHeightFromTextField);
    heightController.dispose();
  }

  void _updateWeightFromTextField() {
    setState(() {
      weight = double.tryParse(weightController.text) ?? 0;
    });
  }

  void _updateAgeFromTextField() {
    setState(() {
      age = double.tryParse(ageController.text) ?? 0;
    });
  }

  void _updateHeightFromTextField() {
    setState(() {
      height = double.tryParse(heightController.text) ?? 0;
    });
  }

  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();

///////////////////////////////////////////////////////////////////////////////
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF31363f), fontFamily: 'Inter'),
      title: 'BMI Insight',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF31363f),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BMI Insight',
                      style: TextStyle(
                          fontSize: 50,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Oswald',
                          color: Colors.white),
                    )
                  ],
                ),

///////////////////////////////////////////////////////////////////////////////
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      width: 186,
                      height: 181,
                      padding: EdgeInsets.only(top: 3, bottom: 3),
                      margin: EdgeInsets.fromLTRB(29, 30, 10, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                'Age',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                          Container(
                            width: 112,
                            height: 30,
                            child: TextField(
                              controller: ageController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 10),
                                  hintText: '30',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              onChanged: (value) {
                                _updateAgeFromTextField();
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  padding: EdgeInsets.only(top: 10),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                      ageController.text = age.toString();
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 30,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                        ageController.text = age.toString();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.minimize,
                                      size: 30,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
////////////////////////////////////////////////////////////////////////////////
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      width: 186,
                      height: 181,
                      padding: EdgeInsets.only(top: 3, bottom: 3),
                      margin: EdgeInsets.fromLTRB(10, 30, 0, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                'Weight (KG)',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                          Container(
                            width: 112,
                            height: 30,
                            child: TextField(
                              controller: weightController,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 10),
                                  hintText: '50.0',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              onChanged: (value) {
                                _updateWeightFromTextField();
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  padding: EdgeInsets.only(top: 10),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                      weightController.text = weight.toString();
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 30,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                        weightController.text =
                                            weight.toString();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.minimize,
                                      size: 30,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
///////////////////////////////////////////////////////////////////////////////
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  width: 402,
                  height: 161,
                  padding: EdgeInsets.only(top: 3, bottom: 3),
                  margin: EdgeInsets.fromLTRB(29, 10, 30, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 115, top: 5),
                              child: Text(
                                'Height (cm)',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          Container(
                            width: 130,
                            height: 100,
                            child: TextField(
                              controller: heightController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 30),
                                  hintText: '160',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold)),
                              onChanged: (value) {
                                _updateHeightFromTextField();
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              padding: EdgeInsets.only(top: 10),
                              onPressed: () {
                                setState(() {
                                  height++;
                                  heightController.text = height.toString();
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                size: 50,
                              )),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    height--;
                                    heightController.text = height.toString();
                                  });
                                },
                                icon: Icon(
                                  Icons.minimize,
                                  size: 50,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
///////////////////////////////////////////////////////////////////////////////
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  width: 402,
                  height: 230,
                  padding: EdgeInsets.only(top: 3, bottom: 3),
                  margin: EdgeInsets.fromLTRB(29, 20, 30, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 115, top: 5),
                              child: Text(
                                'Gender',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                          Container(
                              width: 200,
                              height: 180,
                              child: Center(
                                  child: Text(
                                'I\'m a',
                                style: TextStyle(
                                    fontSize: 70, fontWeight: FontWeight.bold),
                              ))),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(
                                    0), // No elevation
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        CircleBorder()), // Circular shape
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Colors
                                        .transparent), // Transparent background
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent), // No overlay color
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(Colors
                                        .transparent), // Transparent foreground
                                side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide.none), // No side border
                              ),
                              onPressed: () {
                                setState(() {
                                  male = Colors.blue;
                                  female = Colors.black;
                                });
                              },
                              child: Icon(
                                Icons.male_outlined,
                                color: male,
                                size: 60,
                              )),
                          ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(
                                    0), // No elevation
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        CircleBorder()), // Circular shape
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return Colors
                                        .pink; // Background color when hovered
                                  }
                                  return Colors
                                      .transparent; // Default background color
                                }), // Transparent background
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent), // No overlay color
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(Colors
                                        .transparent), // Transparent foreground
                                side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide.none), // No side border
                              ),
                              onPressed: () {
                                setState(() {
                                  male = Colors.black;
                                  female = Colors.pink;
                                });
                              },
                              child: Icon(Icons.female_outlined,
                                  color: female, size: 60))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  width: 402,
                  height: 161,
                  padding: EdgeInsets.only(top: 3, bottom: 3),
                  margin: EdgeInsets.fromLTRB(29, 20, 30, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 0, top: 0),
                              child: Text(
                                'Your result is',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )),
                          Padding(
                              padding: EdgeInsets.only(left: 0, top: 0),
                              child: Text(
                                '$result',
                                style: TextStyle(
                                    fontSize: 55, fontWeight: FontWeight.bold),
                              )),
                          Padding(
                              padding: EdgeInsets.only(left: 0, top: 0),
                              child: Text(
                                '$state',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: ColState),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        numRes = (weight / ((height / 100) * (height / 100)));
                        result = numRes.toStringAsFixed(1);
                        if (numRes <= 18.4) {
                          state = 'Underweight';
                          ColState = Colors.yellow.shade300;
                        } else if (numRes >= 18.5 && numRes <= 24.9) {
                          state = 'Normal';
                          ColState = Colors.green;
                        } else if (numRes >= 25 && numRes <= 39.9) {
                          state = 'Overweight';
                          ColState = Colors.orange.shade300;
                        } else {
                          state = 'Obese';
                          ColState = Colors.red;
                        }
                      });
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ))
              ],
            ),
          )),
    );
  }
}
