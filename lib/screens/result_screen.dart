import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  //ResultScreen({Key? key}) : super(key: key);

  double bmi;
  String gender;
  double weight;

  ResultScreen({
    required this.bmi,
    required this.gender,
    required this.weight,
  });
  String bmiStates(double bmi){
    if(bmi<18.5)
    {
      return "under weight";
    }else if(bmi<24.9){
      return "Normal";
    }else if(bmi<30){
      return "over weight";
    }else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(100),
        child: Card(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text("Result   :- ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                  const SizedBox(width: 20,),
                  Text("${bmi.round()}",style: const TextStyle(fontSize: 20,),),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text("Gender   :- ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                  const SizedBox(width: 20,),
                  Text("$gender",style: const TextStyle(fontSize: 20,),),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text("Weight   :- ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                  const SizedBox(width: 20,),
                  Text("$weight",style: const TextStyle(fontSize: 20,),),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text("states  :- ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                  const SizedBox(width: 20,),
                  FittedBox(
                    child: Text(bmiStates(bmi),style: const TextStyle(fontSize: 20,),),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
