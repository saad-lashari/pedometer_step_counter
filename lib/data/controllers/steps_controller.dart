// import 'package:cypherkicks/components/snackbar.dart';
// import 'package:cypherkicks/data/controllers/workout_controller.dart';
// import 'package:cypherkicks/data/local_db/local_db.dart';
// import 'package:cypherkicks/models/steps_data_model.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:pedometer/pedometer.dart';

// import '../../models/workout_model.dart';

// class StepsController extends GetxController implements GetxService {
//   List<StepsDataModel> stepsList = [];
//   int totalSteps = 0;
//   static DateTime? currentDate;
//   String formattedCurrentDate = DateFormat('yyyy-MM-dd').format(currentDate!);
//   // stepData for today
//   int stepcountFortoday = 0;
//   // saved stepcount value in shared preferences
//   int preservedvalue = 0;
//   double tokens = 0;
//   double distance = 0.0;
//   double caloriesBurned = 0.0;

//   List<WorkoutModel> workoutList = [];

//   updateStepscount(StepCount event) {
//     totalSteps = event.steps;
//     // todayStepcount
//     stepcountforToday(event.steps);
//     update();
//   }

//   void stepcountforToday(int steps) async {
//     DateTime now = DateTime.now();
//     String formatNow = DateFormat('yyyy-MM-dd').format(now);
//     if (formatNow != formattedCurrentDate) {
//       stepsList.add(StepsDataModel(
//           stepsCount: stepcountFortoday,
//           time: formattedCurrentDate.toString()));
//    //   PreferencesService().saveStepsList(stepsList);
//     //  PreferencesService().savedailysteps(steps);
//       // log('this is the stepsList saved : ${stepsList.toString()}');
//       // to get the stepcounter to zero
//      // PreferencesService().getDailySteps();
//       formattedCurrentDate = formatNow;
//     //  PreferencesService().saveDate(formattedCurrentDate);
//       workoutList.add(WorkoutModel(
//           date: formatNow,
//           distance: distance.toString(),
//           minutes: WorkoutController.i.duration));

//     //  PreferencesService().saveWorkoutList(workoutList);
//       WorkoutController.i.stopTimer(resets: true);
//       update();
//     }
//     stepcountFortoday = steps - preservedvalue;
//     tokens = stepcountFortoday * 0.001;
//     distance = stepcountFortoday * 0.414 / 1000;
//     caloriesBurned = stepcountFortoday * 0.04;
//     // log('formattedDate date is $formatNow');
//     // log("Number of steps on $formattedCurrentDate: $stepcountFortoday");
//   }

//   onStepcountError(error) {
//     // log('error is here $error');
//     showSnackbar(Get.context!, '$error');
//     update();
//   }

//   static StepsController get i => Get.put(StepsController());
// }
