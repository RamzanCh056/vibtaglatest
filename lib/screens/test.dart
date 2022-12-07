/*
 * File Created: 2022-06-02 15:11:39
 * Author: ZhangYu (devzhangyu@163.com)
 * -----
 * Last Modified: 2022-06-07 11:50:15
 * Modified By: ZhangYu (devzhangyu@163.com>)
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wave_linear_progress_indicator/wave_linear_progress_indicator.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Slider(
              value: _progress,
              onChanged: (value) {
                setState(() {
                  _progress = value;
                });
              },
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        FloatingActionButton(
          onPressed: _increase,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: _decrease,
          tooltip: 'Decrease',
          child: const Icon(Icons.remove),
        )
      ],
    );
  }

  Stream<double> _getDownloadProgress() async* {
    final values = <double>[
      0,
      0.1,
      0.2,
      0.3,
      0.4,
      0.45,
      0.7,
      0.85,
      0.9,
      0.95,
      0.99,
      1.0
    ];
    for (final p in values) {
      yield p;
      await Future.delayed(const Duration(milliseconds: 1800));
    }
  }

  void _increase() {
    final delta = Random().nextDouble();
    double newValue = _progress + delta;
    newValue = newValue.clamp(0, 1);
    setState(() {
      _progress = newValue;
    });
  }

  void _decrease() {
    final delta = Random().nextDouble();
    double newValue = _progress - delta;
    newValue = newValue.clamp(0, 1);
    setState(() {
      _progress = newValue;
    });
  }
}
