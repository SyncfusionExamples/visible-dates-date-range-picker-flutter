import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(CurrentMonthDates());

class CurrentMonthDates extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PickerCurrentMonth(),
    );
  }
}

class PickerCurrentMonth extends StatefulWidget {
  @override
  _PickerCurrentMonthState createState() => _PickerCurrentMonthState();
}

class _PickerCurrentMonthState extends State<PickerCurrentMonth> {
  final DateRangePickerController _controller = DateRangePickerController();
  final List<String> views = <String>['Month', 'Year', 'Decade', 'Century'];
  String _startDate = '', _endDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton<String>(
          icon: Icon(Icons.calendar_today),
          itemBuilder: (BuildContext context) => views.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList(),
          onSelected: (String value) {
            if (value == 'Month') {
              _controller.view = DateRangePickerView.month;
            } else if (value == 'Year') {
              _controller.view = DateRangePickerView.year;
            } else if (value == 'Decade') {
              _controller.view = DateRangePickerView.decade;
            } else if (value == 'Century') {
              _controller.view = DateRangePickerView.century;
            }
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(height: 50, child: Text('StartDate:' '$_startDate')),
          Container(height: 50, child: Text('EndDate:' '$_endDate')),
          Card(
            margin: const EdgeInsets.fromLTRB(40, 100, 50, 40),
            child: SfDateRangePicker(
              controller: _controller,
              view: DateRangePickerView.month,
              onViewChanged: viewChanged,
            ),
          )
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void viewChanged(DateRangePickerViewChangedArgs args) {
    _startDate = DateFormat('dd, MMMM yyyy')
        .format(args.visibleDateRange.startDate!)
        .toString();
    _endDate = DateFormat('dd, MMMM yyyy')
        .format(args.visibleDateRange.endDate!)
        .toString();
    SchedulerBinding.instance!.addPostFrameCallback((duration) {
      setState(() {});
    });
  }
}
