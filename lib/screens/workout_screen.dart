import 'package:cypherkicks/models/work_history_model.dart';
import 'package:cypherkicks/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/controllers/pedometer_controller.dart';
import '../utils/themes/themes.dart';

class Workout extends StatelessWidget {
  const Workout({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PedometerController>(
      builder: (controller) => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ksecondary, kprimary])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Text(
                      'Start Workout',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: kwhiteColor, fontSize: 30),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    Container(
                      // width: Get.width,
                      padding: EdgeInsets.all(paddingDefault(context)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kcontainer1),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Running',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: kwhiteColor, fontSize: 20),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Container(
                                height: MediaQuery.of(context).size.height * .2,
                                width: MediaQuery.of(context).size.width * .35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5, color: const Color(0xFF9C52AF)),
                                  shape: BoxShape.circle,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.currentStepCount.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              color: kwhiteColor, fontSize: 20),
                                    ),
                                    const Divider(
                                      endIndent: 20,
                                      indent: 20,
                                      color: Color(0xFF9C52AF),
                                      thickness: 5,
                                    ),
                                    Text(
                                      "Steps",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              color: const Color(0xFF554762),
                                              fontSize: 20),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(paddingDefault(context)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: kcontainer1),
                              child: Column(
                                children: [
                                  Text(
                                    controller.burnedCalories,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: kwhiteColor, fontSize: 20),
                                  ),
                                  const Divider(
                                    endIndent: 20,
                                    indent: 20,
                                    color: Color(0xFF9C52AF),
                                    thickness: 5,
                                  ),
                                  Text(
                                    "Calories",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: const Color(0xFF554762),
                                            fontSize: 20),
                                  )
                                ],
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(paddingDefault(context)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: kcontainer1),
                              child: Column(
                                children: [
                                  Text(
                                    '0:0'.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: kwhiteColor, fontSize: 20),
                                  ),
                                  const Divider(
                                    endIndent: 20,
                                    indent: 20,
                                    color: Color(0xFF9C52AF),
                                    thickness: 5,
                                  ),
                                  Text(
                                    "Time",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: const Color(0xFF554762),
                                            fontSize: 20),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.all(paddingDefault(context)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kcontainer1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Workut History',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: kwhiteColor, fontSize: 20)),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          // SizedBox(
                          //     height: MediaQuery.of(context).size.height * .2,
                          //     width: double.infinity,
                          //     child: ListView.builder(
                          //         shrinkWrap: true,
                          //         itemCount: con.workhistory.length,
                          //         itemBuilder: (context, index) {
                          //           WorkHistory data = con.workhistory[index];
                          //           return Column(
                          //             children: [
                          //               Row(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.spaceBetween,
                          //                 children: [
                          //                   Text(
                          //                     'Run',
                          //                     style: Theme.of(context)
                          //                         .textTheme
                          //                         .bodyMedium!
                          //                         .copyWith(
                          //                             color: const Color(
                          //                                 0xFFE8DFF2)),
                          //                   ),
                          //                   Text(
                          //                     data.date,
                          //                     style: Theme.of(context)
                          //                         .textTheme
                          //                         .bodyMedium!
                          //                         .copyWith(
                          //                             color: const Color(
                          //                                 0xFFE8DFF2)),
                          //                   )
                          //                 ],
                          //               ),
                          //               SizedBox(
                          //                 height: Get.height * 0.01,
                          //               ),
                          //               Row(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.spaceBetween,
                          //                 children: [
                          //                   Text(
                          //                     data.distance,
                          //                     style: Theme.of(context)
                          //                         .textTheme
                          //                         .bodyMedium!
                          //                         .copyWith(
                          //                             color: const Color(
                          //                                 0xFFE8DFF2)),
                          //                   ),
                          //                   Text(
                          //                     data.time,
                          //                     style: Theme.of(context)
                          //                         .textTheme
                          //                         .bodyMedium!
                          //                         .copyWith(
                          //                             color: const Color(
                          //                                 0xFFE8DFF2)),
                          //                   )
                          //                 ],
                          //               ),
                          //               const Divider(
                          //                 thickness: 2,
                          //               )
                          //             ],
                          //           );
                          //         }),
                          //   ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
