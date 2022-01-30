import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stopwatch/platform_alert.dart';

class StopWatch extends StatefulWidget {
  static const route = '/stopwatch';
  final String? name;
  final String? email;

  const StopWatch({Key? key, this.name, this.email}) : super(key: key);
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int milliseconds = 0;
  late Timer timer;
  bool isTicking = true;
  final laps = <int>[];
  final itemHeight = 60.0;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);
  }

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    Object name = ModalRoute.of(context)!.settings.arguments ?? "";
    return Scaffold(
      appBar: AppBar(
        title: Text(name.toString()),
      ),
      body: Column(
        children: [
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay()),
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.white),
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: isTicking ? null : _startTimer,
                child: Text('Start'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Builder(
                builder: (context) => ElevatedButton(
                  onPressed: isTicking ? () => _lap(context) : null,
                  child: Text('Lap'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: isTicking ? _stopTimer : null,
                child: Text('Stop'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _lap(BuildContext context) {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
    scrollController.animateTo(itemHeight * laps.length,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    final controller =
        showBottomSheet(context: context, builder: _buildLapCompleteSheet);
    Future.delayed(Duration(seconds: 2)).then((_) => controller.close());
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);
    setState(() {
      laps.clear();
      milliseconds = 0;
      isTicking = true;
    });
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
    final totalRuntime = laps.fold(
        milliseconds, (total, lap) => int.parse(total.toString()) + lap);
    final alert = PlatformAlert(
      title: 'Run Completed!',
      message: 'Total Run Time is ${_secondsText(totalRuntime)}.',
    );
    alert.show(context);
  }

  Widget _buildLapCompleteSheet(BuildContext context) {
    final lapRunTime = laps.last;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Container(
        color: Theme.of(context).cardColor,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Lap Finished', style: textTheme.headline6),
              Text('Lap Run Time is  ${_secondsText(lapRunTime)}.'),
            ],
          ),
        ),
      ),
    );
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
      child: ListView.builder(
        controller: scrollController,
        itemExtent: itemHeight,
        itemCount: laps.length,
        itemBuilder: (context, index) {
          final milliseconds = laps[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 50),
            title: Text('Lap ${index + 1}'),
            trailing: Text(_secondsText(milliseconds)),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
