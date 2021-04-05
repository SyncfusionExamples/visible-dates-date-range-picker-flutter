# How to get the current view dates in Flutter date range picker (SfDateRangePicker)?

In flutter date range picker, you can get the current month start and end dates using the `onViewChanged` callback.

## Step 1:
Inside the state, initialize the controller for the date range picker and set the default values for start and end date of the current month.

```xml
final DateRangePickerController _controller = DateRangePickerController();
String _startDate = '', _endDate = '';
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
        .format(args.visibleDateRange.startDate!)
        .toString();
    _endDate=DateFormat('dd, MMMM yyyy')
        .format(args.visibleDateRange.endDate!)
        .toString();
    SchedulerBinding.instance!.addPostFrameCallback((duration) {
      setState(() {});
    });
}
```
**[View document in Syncfusion Flutter Knowledge base](https://www.syncfusion.com/kb/11331/how-to-get-the-current-view-dates-in-flutter-date-range-picker-sfdaterangepicker)**

**Screenshots**

<img alt="Month view" src="http://www.syncfusion.com/uploads/user/kb/flut/flut-857/flut-857_img1.png" width="230" height="400"/>|
<img alt="Year view" src="http://www.syncfusion.com/uploads/user/kb/flut/flut-857/flut-857_img2.png" width="230" height="400"/>|
<img alt="Decade view" src="http://www.syncfusion.com/uploads/user/kb/flut/flut-857/flut-857_img3.png" width="230" height="400"/>|
<img alt="Century view" src="http://www.syncfusion.com/uploads/user/kb/flut/flut-857/flut-857_img4.png" width="230" height="400"/>|
