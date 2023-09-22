// import 'dart:async';
// import 'dart:developer';

// import 'package:cypherkicks/data/local_db/local_db.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pedometer/pedometer.dart';
// import 'package:intl/intl.dart';

// import 'components/bar_chart.dart';

// // void main() {
// //   Get.put(PedometerController());
// //   runApp(PedometerApp());
// // }

// class PedometerApp extends StatelessWidget {
//   const PedometerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(PedometerController());
//     return GetMaterialApp(
//       title: 'Pedometer App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Pedometer'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               BarChartWidget(),
//               GetBuilder<PedometerController>(
//                 builder: (controller) => Text(
//                   'Steps: ${controller.currentStepCount}',
//                   style: const TextStyle(fontSize: 24),
//                 ),
//               ),
//               TextButton(
//                   onPressed: () {
//                     Get.find<PedometerController>()._startListening();
//                   },
//                   child: const Text('Start lisning')),
//               TextButton(
//                   onPressed: () {
//                     Get.find<PedometerController>()._stopListening();
//                   },
//                   child: const Text('Stop lisning')),
//               TextButton(
//                   onPressed: () {
//                     List<StepsData> data =
//                         Get.find<PedometerController>().weekSteps;

//                     for (var data in data) {
//                       log('${data.days}:${data.steps}');
//                     }
//                     // log('${data[1].days}:${data[1].steps}');
//                   },
//                   child: const Text('show data')),
//               TextButton(
//                   onPressed: () {
//                     Get.find<PedometerController>().clear();
//                   },
//                   child: const Text('Clear Data')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class PedometerController extends GetxController {
// //   List<StepsData> weekSteps = [];
// //   //final Pedometer _pedometer = Pedometer();
// //   late StreamSubscription<StepCount> _stepCountSubscription;
// //   int currentStepCount = 0;
// //   int lastdaySteps = 0;
// //   int _totalSteps = 0;
// //   String _currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

// //   @override
// //   void onInit() {
// //     super.onInit();
// //     _startListening();
// //   }

// //   @override
// //   void onClose() {
// //     _stopListening();
// //     super.onClose();
// //   }

// //   void _startListening() {
// //     _stepCountSubscription = Pedometer.stepCountStream.listen(_onStepCount);
// //     update();
// //   }

// //   void clear() {
// //     weekSteps.clear();
// //     update();
// //   }

// //   void _stopListening() {
// //     _stepCountSubscription.cancel();
// //     update();
// //   }

// //   void _onStepCount(StepCount stepCount) async {
// //     String lastdate = DateFormat('yyyy-MM-dd').format(stepCount.timeStamp);
// //     _checkDateChange(lastdate, stepCount.steps);

// //     currentStepCount = stepCount.steps - _totalSteps;
// //     tokens(currentStepCount.toString());
// //     caloriesBurned(currentStepCount.toString());
// //     steptoMiles(currentStepCount.toString());
// //     update();
// //     // log(lastdate);
// //     // log(_currentDate);
// //   }

// //   void _checkDateChange(String date, int totalSteps) {
// //     if (_currentDate != date) {
// //       _totalSteps = totalSteps;
// //       _saveStepsForPreviousDay();
// //       currentStepCount = 0;
// //       _currentDate = date;
// //     }
// //   }

// //   void _saveStepsForPreviousDay() {
// //     // log('Steps for $_currentDate: $ currentStepCount');

// //     String day = datetoDayconvert(_currentDate);
// //     log('Steps for $day: $currentStepCount');

// //     weekSteps.add(StepsData(day, currentStepCount.toDouble()));
// //     update();

// //     LocalDatabase().setSteps(currentStepCount);
// //   }

// //   // date to day converter Extract the first three letters
// //   String datetoDayconvert(String dateString) {
// //     DateTime date = DateTime.parse(dateString);
// //     String weekDay = DateFormat.E().format(date);
// //     String abbreviatedWeekDay =
// //         weekDay.substring(0, 3); // Extract the first three letters
// //     return abbreviatedWeekDay;
// //   }

// // // calories count method
// //   String caloriesBurned(String steps) {
// //     int distance = int.parse(steps.toString());
// //     double caloriesBurned = distance * 0.04;
// //     String roundedvalue = caloriesBurned.toStringAsFixed(2);
// //     log('calories:$roundedvalue');
// //     return roundedvalue;
// //   }

// // //miles count method
// //   String steptoMiles(String steps) {
// //     int distance = int.parse(steps.toString());
// //     double miles = distance * (0.414 / 1000);
// //     String roundedvalue = miles.toStringAsFixed(2);
// //     log('miles:$roundedvalue');
// //     return roundedvalue;
// //   }

// // // tokens count method
// //   String tokens(String steps) {
// //     int distance = int.parse(steps.toString());
// //     double token = distance * 0.04;
// //     String roundedvalue = token.toStringAsFixed(2);
// //     log('tokens:$roundedvalue');
// //     return roundedvalue;
// //   }
// // }
