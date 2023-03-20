// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import '../decx/listdetail.dart';
import 'custom.dart';

List<Sales> statlist = [];
var statname = [];
var statbase = [];

class PokeApi {
  var stats;

  PokeApi({required this.stats});

  factory PokeApi.fromJson(Map<String, dynamic> json) {
    return PokeApi(
      stats: json['stats'],
    );
  }
}

Future<PokeApi> fetchAlbum() async {
  // 포켓몬 주소
  var response =
      await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/1/"));

  if (response.statusCode == 200) {
    return PokeApi.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pokeApi');
  }
}

class ChartsDemo extends StatefulWidget {
  //
  const ChartsDemo({super.key});

  @override
  ChartsDemoState createState() => ChartsDemoState();
}

class ChartsDemoState extends State<ChartsDemo> {
  late List<charts.Series<dynamic, String>> seriesList;
  late Future<PokeApi> futureAlbum;

//  일련의 차트 데이터를 저장할 목록
  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();

    // for (int i = 0;
    //                                 i < snapshot.data!.stats.length;
    //                                 i++)
    //                               statname[i].add =
    //                                   snapshot.data!.stats[i]['stat']['name'];
    //                             for (int i = 0;
    //                                 i < snapshot.data!.stats.length;
    //                                 i++)
    //                               basestat[i].add =
    //                                   snapshot.data!.stats[i]['base_stat'];
//에러 발생 시켜볼 수 있어? 지금 아까 에러난거 다지워서 좀걸려요
//리스트는 api에서 가져오고
    final desktopSalesData = [
      Sales('2015', 200),
      Sales('2016', 150),
      Sales('2017', 100),
      Sales('2018', random.nextInt(100)),
      Sales('2019', random.nextInt(100)),
    ];
    //이런 형식으로 집어넣어야 해서
//
    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.stat,
        measureFn: (Sales sales, _) => sales.value,
        data: statlist,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
      ),
    ];
  }

  barChart() {
    return Chart(seriesList);
  }

//계열 목록을 초기화한 다음 BarChart 생성자에 전달
  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20.0),
      // child: barChart(),
      child: SafeArea(
        child: SizedBox(
          child: FutureBuilder<PokeApi>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                for (int i = 0; i < snapshot.data!.stats.length; i++)
                  statbase.add(snapshot.data!.stats[i]["base_stat"].toString());

                // statname[i].add =
                for (int i = 0; i < snapshot.data!.stats.length; i++)
                  statname
                      .add(snapshot.data!.stats[i]["stat"]["name"].toString());

                for (int i = 0; i < 6; i++) {
                  statlist.add(Sales(
                      statname[i].toString(),
                      int.parse(
                          statbase[i].toString()))); //근데 따로 안바꿔도 int형으로 들어갈 거에요
                }

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
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    ));
  }
}

//먼저 차트 데이터를 보유하는 클래스
class Sales {
  final String stat;
  final int value;

  Sales(this.stat, this.value);
}
