import 'package:flutter/material.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class WorldCountriesWidget extends StatefulWidget {
  final List<ItemExtended> worldCountries;
  final DateTime updated;

  WorldCountriesWidget({this.worldCountries, this.updated})
      : assert(worldCountries != null, updated != null);

  @override
  WorldCountriesWidgetState createState() => WorldCountriesWidgetState(
      worldCountries: worldCountries, updated: updated);
}

class WorldCountriesWidgetState extends State<WorldCountriesWidget> {
  List<ItemExtended> worldCountries;
  final DateTime updated;
  var rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  var isConfirmedSorted = true;
  var isRecoveredSorted = false;
  var isDeathsSorted = false;

  var sortColumnIndex = 1;
  var sortAscending = true;

  WorldCountriesWidgetState({this.worldCountries, this.updated})
      : assert(worldCountries != null, updated != null);

  @override
  Widget build(BuildContext context) {
    if (worldCountries == null || worldCountries.length == 0) {
      return Container();
    }
    return PaginatedDataTable(
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Text(
              'Acumulados por países',
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          InfoDialogWidget(
            title: 'Acumulados por países',
            text: 'Datos de los países tomados '
                'de\nhttps://github.com/pomber/covid19\ny '
                'actualizado el '
                '${updated.toStrPlus()}',
          ),
        ],
      ),
      columns: [
        DataColumn(
          label: Text('País'),
          numeric: false,
        ),
        DataColumn(
            label: Text(
              'Casos  ',
            ),
            numeric: true,
            onSort: ((a, b) {
              setState(() {
                if (isConfirmedSorted) {
                  isConfirmedSorted = false;
                  sortAscending = false;
                  worldCountries
                      .sort((x, y) => x.confirmed.compareTo(y.confirmed));
                } else {
                  isConfirmedSorted = true;
                  sortAscending = true;
                  worldCountries
                      .sort((x, y) => y.confirmed.compareTo(x.confirmed));
                }
                sortColumnIndex = 1;
              });
            })),
        DataColumn(
            label: Text('Recuperados '),
            numeric: true,
            onSort: ((a, b) {
              setState(() {
                if (isRecoveredSorted) {
                  isRecoveredSorted = false;
                  sortAscending = false;
                  worldCountries
                      .sort((x, y) => x.recovered.compareTo(y.recovered));
                } else {
                  isRecoveredSorted = true;
                  sortAscending = true;
                  worldCountries
                      .sort((x, y) => y.recovered.compareTo(x.recovered));
                }
                sortColumnIndex = 2;
              });
            })),
        DataColumn(
          label: Text('Fallecidos   '),
          numeric: true,
          onSort: (a, b) {
            setState(
              () {
                if (isDeathsSorted) {
                  isDeathsSorted = false;
                  sortAscending = false;
                  worldCountries.sort((x, y) => x.deaths.compareTo(y.deaths));
                } else {
                  isDeathsSorted = true;
                  sortAscending = true;
                  worldCountries.sort((x, y) => y.deaths.compareTo(x.deaths));
                }
                sortColumnIndex = 3;
              },
            );
          },
        ),
      ],
      source: DataTableSourceImplemented(
        top20AccumulatedCountries: worldCountries,
      ),
      columnSpacing: 1.5,
      horizontalMargin: 3.5,
      rowsPerPage: rowsPerPage,
    );
  }
}

class DataTableSourceImplemented extends DataTableSource {
  List<ItemExtended> top20AccumulatedCountries;

  DataTableSourceImplemented({this.top20AccumulatedCountries})
      : assert(top20AccumulatedCountries != null);

  @override
  DataRow getRow(int index) => DataRow.byIndex(
        index: index,
        cells: [
          DataCell(
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                '${top20AccumulatedCountries[index].name}',
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 11,
                ),
              ),
            ),
          ),
          DataCell(
            Container(
              margin: EdgeInsets.all(5),
              child: Container(
                child: Text(
                  '${top20AccumulatedCountries[index].confirmed}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 11),
                ),
              ),
            ),
          ),
          DataCell(
            Container(
              margin: EdgeInsets.all(5),
              child: Container(
                child: Text(
                  '${top20AccumulatedCountries[index].recovered}',
                  style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 11),
                ),
              ),
            ),
          ),
          DataCell(
            Container(
              margin: EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  '${top20AccumulatedCountries[index].deaths}',
                  style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 11),
                ),
              ),
            ),
          ),
        ],
      );

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => top20AccumulatedCountries.length;

  @override
  int get selectedRowCount => 0;
}