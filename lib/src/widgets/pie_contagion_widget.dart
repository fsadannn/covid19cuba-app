import 'package:charts_common/src/common/palette.dart'; // ignore: implementation_imports
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

// ignore: must_be_immutable
class PieContagionWidget extends StatefulWidget {
  final DataModel data;
  List<Palette> colorPalettes;

  PieContagionWidget({this.data}) : assert(data != null) {
    colorPalettes = charts.MaterialPalette.getOrderedPalettes(4);
  }

  @override
  PieContagionWidgetState createState() => PieContagionWidgetState();
}

class PieContagionWidgetState extends State<PieContagionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Center(
            child: Text(
              'Casos por Modo de Contagio',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 300,
          child: charts.PieChart(
            [
              charts.Series<Item, String>(
                id: 'Casos por Modo de Contagio',
                colorFn: (_, i) => widget.colorPalettes[i].shadeDefault,
                domainFn: (item, _) => item.name,
                measureFn: (item, _) => item.value,
                data: [
                  widget.data.casesByModeOfContagion.imported,
                  widget.data.casesByModeOfContagion.inserted,
                  widget.data.casesByModeOfContagion.autochthonous,
                  widget.data.casesByModeOfContagion.unknown,
                ],
              ),
            ],
            animate: false,
            behaviors: [
              charts.DatumLegend(
                position: charts.BehaviorPosition.bottom,
                cellPadding: EdgeInsets.all(10),
                showMeasures: true,
                legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
                desiredMaxColumns: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
