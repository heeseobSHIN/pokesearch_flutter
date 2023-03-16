// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter_new/flutter.dart' as charts;

class ChartsDemo extends StatefulWidget {
  //
  const ChartsDemo({super.key});

  @override
  ChartsDemoState createState() => ChartsDemoState();
}

class ChartsDemoState extends State<ChartsDemo> {
  late List<charts.Series<dynamic, String>> seriesList;

//  일련의 차트 데이터를 저장할 목록
  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();

//리스트는 api에서 가져오고
    final desktopSalesData = [
      Sales('2015', random.nextInt(100)),
      Sales('2016', random.nextInt(100)),
      Sales('2017', random.nextInt(100)),
      Sales('2018', random.nextInt(100)),
      Sales('2019', random.nextInt(100)),
    ];

    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.stat,
        measureFn: (Sales sales, _) => sales.value,
        data: desktopSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
      ),
    ];
  }

  barChart() {
    return Container(
      width: 300,
      height: 300,
      child: charts.BarChart(
        seriesList,
        animate: true,
        vertical: false,
        barGroupingType: charts.BarGroupingType.grouped,
        defaultRenderer: charts.BarRendererConfig(
          groupingType: charts.BarGroupingType.grouped,
          strokeWidthPx: 1.0,
        ),
        domainAxis: const charts.OrdinalAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
        ),
      ),
    );
  }

//계열 목록을 초기화한 다음 BarChart 생성자에 전달
  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: barChart(),
      ),
    );
  }
}

//먼저 차트 데이터를 보유하는 클래스
class Sales {
  final String stat;
  final int value;

  Sales(this.stat, this.value);
}
