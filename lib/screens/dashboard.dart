import 'package:cypherkicks/utils/styles.dart';
import 'package:cypherkicks/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/bar_chart.dart';
import '../components/images.dart';
import '../data/controllers/pedometer_controller.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECECED),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(paddingLarge(context)),
          child: SingleChildScrollView(
            child: GetBuilder<PedometerController>(
              builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: const Color(0xFF6A6A6A),
                        fontWeight: fontWeightBold),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  BarChartWidget(
                    weekSteps: controller.weekSteps,
                    isColumnSeries: true,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    children: [
                      dashboardCard(context,
                          title: 'Steps',
                          backgroundColor: const Color(0xFF465379),
                          imagePath: Images.sneakers,
                          progressTitle: 'Steps',
                          value: controller.currentStepCount.toString()),
                      SizedBox(
                        width: Get.width * 0.06,
                      ),
                      dashboardCard(context,
                          title: 'Tokens',
                          progressTitle: 'Tokens',
                          backgroundColor: const Color(0xFFD7A305),
                          imagePath: Images.star,
                          value: controller.earnedToken)
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Row(
                    children: [
                      dashboardCard(context,
                          title: 'Distance',
                          progressTitle: 'Miles',
                          backgroundColor: const Color(0xFFBA3E3E),
                          imagePath: Images.pin,
                          value: controller.miles),
                      SizedBox(
                        width: Get.width * 0.06,
                      ),
                      dashboardCard(context,
                          title: 'Calories',
                          progressTitle: 'Calories',
                          backgroundColor: const Color(0xFF465379),
                          imagePath: Images.sneakers,
                          value: controller.burnedCalories)
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboardCard(BuildContext context,
      {String? title,
      double? percent,
      String? progressTitle,
      Color? backgroundColor,
      String? imagePath,
      String? value}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: kwhiteColor, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(paddingSmall(context)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kblackColor,
                      fontWeight: fontWeightBold,
                      fontFamily: 'futura-pt-bold-oblique.otf'),
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      imagePath!,
                      color: kwhiteColor,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Text(
              '$value',
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 30),
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: backgroundColor),
            ),
            SizedBox(
              height: Get.height * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
