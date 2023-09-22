import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/steps_data_model.dart';

class BarChartWidget extends StatelessWidget {
  final List<StepsData> weekSteps;
  final bool isColumnSeries;
  const BarChartWidget(
      {super.key, required this.weekSteps, required this.isColumnSeries});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: Get.height * 0.3,
      width: Get.width * 0.9,
      decoration: const BoxDecoration(boxShadow: []),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isColumnSeries
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'weekly',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )
              : const SizedBox(),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Expanded(
            child: isColumnSeries
                ? SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries>[
                        ColumnSeries<StepsData, String>(
                            isVisibleInLegend: false,
                            dataSource: weekSteps,
                            xValueMapper: (StepsData days, _) => days.days,
                            yValueMapper: (StepsData steps, _) => steps.steps,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: false)),
                      ])
                : SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries>[
                        LineSeries<StepsData, String>(
                            isVisibleInLegend: false,
                            dataSource: weekSteps,
                            xValueMapper: (StepsData days, _) => days.days,
                            yValueMapper: (StepsData steps, _) => steps.steps,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: false)),
                      ]),
          ),
        ],
      ),
    );
  }
}
