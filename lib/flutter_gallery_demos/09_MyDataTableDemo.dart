// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyDataTableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DataTableDemo(),
    );
  }
}
/*----------------------------------------------------------------------------------------*/

class DataTableDemo extends StatefulWidget {
  const DataTableDemo();

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> with RestorationMixin {
  // 每页10行
  final RestorableInt _rowsPerPage = RestorableInt(PaginatedDataTable.defaultRowsPerPage);
  // 排序列号
  final RestorableInt _sortColumnIndex = RestorableInt(-1);
  // 排序方式
  final RestorableBool _sortAscending = RestorableBool(true);
  // 甜点表数据源
  _DessertDataSource _dessertsDataSource;

  @override
  // 恢复ID
  String get restorationId => 'data_table_demo';

  @override
  // 恢复状态，注册要恢复的状态
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_rowsPerPage, 'rows_per_page');
    registerForRestoration(_sortColumnIndex, 'sort_column_index');
    registerForRestoration(_sortAscending, 'sort_ascending');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dessertsDataSource ??= _DessertDataSource(context);
  }

  void _sort<T>(
      Comparable<T> Function(_Dessert d) getField,
      int columnIndex,
      bool ascending,
      ) {
    _dessertsDataSource._sort<T>(getField, ascending);
    setState(() {
      // [RestorableBool]'s value cannot be null, so -1 is used as a placeholder
      // to represent `null` in [DataTable]s.
      if (columnIndex == null) {
        _sortColumnIndex.value = -1;
      } else {
        _sortColumnIndex.value = columnIndex;
      }
      _sortAscending.value = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Need to call sort on build to ensure that the data values are correctly
    // sorted on state restoration.
    _sort<num>((d) => d.calories, _sortColumnIndex.value, _sortAscending.value);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('demoDataTableTitle'),
      ),
      body: Scrollbar(
        child: ListView(
          restorationId: 'data_table_list_view',
          padding: const EdgeInsets.all(16),
          children: [
            PaginatedDataTable(
              header: Text('dataTableHeader'),
              rowsPerPage: _rowsPerPage.value,
              onRowsPerPageChanged: (value) {
                setState(() {
                  _rowsPerPage.value = value;
                });
              },
              // RestorableBool's value cannot be null, so -1 is used as a
              // placeholder to represent `null` in [DataTable]s.
              sortColumnIndex:
              _sortColumnIndex.value == -1 ? null : _sortColumnIndex.value,
              sortAscending: _sortAscending.value,
              onSelectAll: _dessertsDataSource._selectAll,
              columns: [
                DataColumn(
                  label: Text('dataTableColumnDessert'),
                  onSort: (columnIndex, ascending) =>
                      _sort<String>((d) => d.name, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text('dataTableColumnCalories'),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      _sort<num>((d) => d.calories, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text('dataTableColumnFat'),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      _sort<num>((d) => d.fat, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text('dataTableColumnCarbs'),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      _sort<num>((d) => d.carbs, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text('dataTableColumnProtein'),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      _sort<num>((d) => d.protein, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text('dataTableColumnSodium'),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      _sort<num>((d) => d.sodium, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text('dataTableColumnCalcium'),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      _sort<num>((d) => d.calcium, columnIndex, ascending),
                ),
                DataColumn(
                  label: Text('dataTableColumnIron'),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      _sort<num>((d) => d.iron, columnIndex, ascending),
                ),
              ],
              source: _dessertsDataSource,
            ),
          ],
        ),
      ),
    );
  }
}

class _Dessert {
  _Dessert(this.name, this.calories, this.fat, this.carbs, this.protein,
      this.sodium, this.calcium, this.iron);
  final String name;
  final int calories;
  final double fat;
  final int carbs;
  final double protein;
  final int sodium;
  final int calcium;
  final int iron;

  bool selected = false;
}

class _DessertDataSource extends DataTableSource {
  _DessertDataSource(this.context) {
    _desserts = <_Dessert>[
      _Dessert(
        'dataTableRowFrozenYogurt',
        159,
        6.0,
        24,
        4.0,
        87,
        14,
        1,
      ),
      _Dessert(
        'dataTableRowIceCreamSandwich',
        237,
        9.0,
        37,
        4.3,
        129,
        8,
        1,
      ),
      _Dessert(
        'dataTableRowEclair',
        262,
        16.0,
        24,
        6.0,
        337,
        6,
        7,
      ),
      _Dessert(
        'dataTableRowCupcake',
        305,
        3.7,
        67,
        4.3,
        413,
        3,
        8,
      ),
      _Dessert(
        'dataTableRowGingerbread',
        356,
        16.0,
        49,
        3.9,
        327,
        7,
        16,
      ),
      _Dessert(
        'dataTableRowJellyBean',
        375,
        0.0,
        94,
        0.0,
        50,
        0,
        0,
      ),
      _Dessert(
        'dataTableRowLollipop',
        392,
        0.2,
        98,
        0.0,
        38,
        0,
        2,
      ),
      _Dessert(
        'dataTableRowHoneycomb',
        408,
        3.2,
        87,
        6.5,
        562,
        0,
        45,
      ),
      _Dessert(
        'dataTableRowDonut',
        452,
        25.0,
        51,
        4.9,
        326,
        2,
        22,
      ),
      _Dessert(
        'dataTableRowApplePie',
        518,
        26.0,
        65,
        7.0,
        54,
        12,
        6,
      ),
      _Dessert(
        'dataTableRowFrozenYogurt',
        168,
        6.0,
        26,
        4.0,
        87,
        14,
        1,
      ),
      _Dessert(
        'dataTableRowIceCreamSandwich',
        246,
        9.0,
        39,
        4.3,
        129,
        8,
        1,
      ),
      _Dessert(
        'dataTableRowEclair',
        271,
        16.0,
        26,
        6.0,
        337,
        6,
        7,
      ),
      _Dessert(
        'dataTableRowCupcake',
        314,
        3.7,
        69,
        4.3,
        413,
        3,
        8,
      ),
      _Dessert(
        'dataTableRowGingerbread',
        345,
        16.0,
        51,
        3.9,
        327,
        7,
        16,
      ),
      _Dessert(
        'dataTableRowJellyBean',
        364,
        0.0,
        96,
        0.0,
        50,
        0,
        0,
      ),
      _Dessert(
        'dataTableRowLollipop',
        401,
        0.2,
        100,
        0.0,
        38,
        0,
        2,
      ),
      _Dessert(
        'dataTableRowHoneycomb',
        417,
        3.2,
        89,
        6.5,
        562,
        0,
        45,
      ),
      _Dessert(
        'dataTableRowDonut',
        461,
        25.0,
        53,
        4.9,
        326,
        2,
        22,
      ),
      _Dessert(
        'dataTableRowApplePie',
        527,
        26.0,
        67,
        7.0,
        54,
        12,
        6,
      ),
      _Dessert(
        'dataTableRowFrozenYogurt',
        223,
        6.0,
        36,
        4.0,
        87,
        14,
        1,
      ),
      _Dessert(
        'dataTableRowIceCreamSandwich',
        301,
        9.0,
        49,
        4.3,
        129,
        8,
        1,
      ),
      _Dessert(
        'dataTableRowEclair',
        326,
        16.0,
        36,
        6.0,
        337,
        6,
        7,
      ),
      _Dessert(
        'dataTableRowCupcake',
        369,
        3.7,
        79,
        4.3,
        413,
        3,
        8,
      ),
      _Dessert(
        'dataTableRowGingerbread',
        420,
        16.0,
        61,
        3.9,
        327,
        7,
        16,
      ),
      _Dessert(
        'dataTableRowJellyBean',
        439,
        0.0,
        106,
        0.0,
        50,
        0,
        0,
      ),
      _Dessert(
        'dataTableRowLollipop',
        456,
        0.2,
        110,
        0.0,
        38,
        0,
        2,
      ),
      _Dessert(
        'dataTableRowHoneycomb',
        472,
        3.2,
        99,
        6.5,
        562,
        0,
        45,
      ),
      _Dessert(
        'dataTableRowDonut',
        516,
        25.0,
        63,
        4.9,
        326,
        2,
        22,
      ),
      _Dessert(
        'dataTableRowApplePie',
        582,
        26.0,
        77,
        7.0,
        54,
        12,
        6,
      ),
    ];
  }

  final BuildContext context;
  List<_Dessert> _desserts;

  void _sort<T>(Comparable<T> Function(_Dessert d) getField, bool ascending) {
    _desserts.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length) return null;
    final dessert = _desserts[index];
    return DataRow.byIndex(
      index: index,
      selected: dessert.selected,
      onSelectChanged: (value) {
        if (dessert.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          dessert.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(dessert.name)),
        DataCell(Text('${dessert.calories}')),
        DataCell(Text(dessert.fat.toStringAsFixed(1))),
        DataCell(Text('${dessert.carbs}')),
        DataCell(Text(dessert.protein.toStringAsFixed(1))),
        DataCell(Text('${dessert.sodium}')),
        DataCell(Text('${dessert.calcium / 100}')),
        DataCell(Text('${dessert.iron / 100}')),
      ],
    );
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
    for (final dessert in _desserts) {
      dessert.selected = checked;
    }
    _selectedCount = checked ? _desserts.length : 0;
    notifyListeners();
  }
}
