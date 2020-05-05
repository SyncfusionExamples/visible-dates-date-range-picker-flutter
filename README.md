# How to get the current view dates in Flutter date range picker (SfDateRangePicker)?

In flutter date range picker, you can get the current month start and end dates using the `onViewChanged` callback.

## Step 1:
In initState(), initialize the controller for the date range picker and set the default values for start and end dates of the current month.

```xml
DateRangePickerController _controller;
String _startDate, _endDate;
 
@override
void initState() {
  // TODO: implement initState
  _controller = DateRangePickerController();
  _startDate = '';
  _endDate = '';
  super.initState();
}
```
 
## Step 2:
Place the date picker inside the body of the Scaffold widget and trigger the `onViewChanged` callback of the date picker.

```xml
body: Column(
  children: <Widget>[
    Container( height:50,
        child: Text('StartDate:''$_startDate')),
    Container(height:50
        ,child: Text('EndDate:''$_endDate')),
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
```

## Step 3:
Using the `onViewChanged` callback of the date picker get the start and dates of the current month.

```xml
void viewChanged(DateRangePickerViewChangedArgs args) {
 
    _startDate = DateFormat('dd, MMMM yyyy')
        .format(args.visibleDateRange.startDate)
        .toString();
    _endDate=DateFormat('dd, MMMM yyyy')
        .format(args.visibleDateRange.endDate)
        .toString();
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {});
    });
}
```
