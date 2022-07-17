import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double height = 100.0;
  int age=25;
  int weight=70;
  bool isMale=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale?  const Color(0xffFFC107) : const Color(0xff343A40),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: const [
                              Icon(
                                Icons.male,
                                size: 100,
                                color: Colors.white,
                              ),
                              Text(
                                "MALE",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale?  const Color(0xff343A40) : const Color(0xffFFC107),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: const [
                              Icon(
                                Icons.female,
                                size: 100,
                                color: Colors.white,
                              ),
                              Text(
                                "FEMALE",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "HEIGHT",
                              style:
                              TextStyle(fontSize: 40, color: Colors.black),
                            ),
                            Text(
                              "${height.round()}",
                              style: const TextStyle(
                                  fontSize: 40, color: Colors.black),
                            ),
                            Slider(
                              onChanged: (double value) {
                                setState(() {});
                                height = value;
                              },
                              value: height,
                              min: 50.0,
                              max: 200.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "AGE",
                              style:
                              TextStyle(fontSize: 40, color: Colors.black),
                            ),
                            Text(
                              "$age",
                              style:
                              const TextStyle(fontSize: 40, color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: () {
                                  age--;
                                  setState(() {
                                  });
                                },
                                  child:const Icon(Icons.remove,color: Colors.black,),
                                  backgroundColor: Colors.white,
                                  mini: true,
                                  heroTag: "1",
                                ),
                                const SizedBox(width: 20,),
                                FloatingActionButton(onPressed: () {
                                  age++;
                                  setState(() {

                                  });
                                },
                                  child:const Icon(Icons.add,color: Colors.black,),
                                  backgroundColor: Colors.white,
                                  mini: true,
                                  heroTag: "2",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Weight",
                              style:
                              TextStyle(fontSize: 40, color: Colors.black),
                            ),
                            Text(
                              "$weight",
                              style:
                              const TextStyle(fontSize: 40, color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: () {
                                  weight--;
                                  setState(() {

                                  });
                                },
                                  child:const Icon(Icons.remove,color: Colors.black,),
                                  backgroundColor: Colors.white,
                                  mini: true,
                                  heroTag: "3",
                                ),
                                const SizedBox(width: 20,),
                                FloatingActionButton(onPressed: () {
                                  weight++;
                                  setState(() {

                                  });
                                },
                                  child:const Icon(Icons.add,color: Colors.black,),
                                  backgroundColor: Colors.white,
                                  mini: true,
                                  heroTag: "4",
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
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 10,
              ),
              child: MaterialButton(
                //height: 30,
                minWidth: double.infinity,
                onPressed: () {
                  double result=weight/pow(height/100,2);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        ResultScreen(
                          bmi: result,
                          gender: isMale?"Male":"Female",
                          weight: weight.toDouble(),
                        ),
                  ),);
                },
                child: const Text("Calculate"),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
