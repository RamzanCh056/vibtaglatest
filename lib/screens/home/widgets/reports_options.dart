// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:vibetag/screens/home/widgets/report_widgets.dart';
import 'package:vibetag/utils/constant.dart';

class ReportOptions extends StatefulWidget {
  Map<String, dynamic> post;

  ReportOptions({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<ReportOptions> createState() => _ReportOptionsState();
}

class _ReportOptionsState extends State<ReportOptions> {
  List<Widget> reports = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setReportWidgets();
  }

  setReportWidgets() {
    for (var report in postReports) {
      reports.add(
        ReportWidget(
          text: report,
          postId: widget.post['id'].toString(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.9,
      decoration: BoxDecoration(
        color: white,
        borderRadius: radiusOnly(topLeft: 7, topRight: 7),
        boxShadow: boxShadow,
      ),
      child: Column(
        children: [
          gap(h: 25),
          Center(
            child: Column(
              children: [
                Text(
                  'Report Post',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: grayPrimary,
                  ),
                ),
                gap(h: 5),
                Text(
                  'Choose a reason for reporting this Post?',
                  style: TextStyle(
                    fontSize: 14,
                    color: grayMed,
                  ),
                ),
              ],
            ),
          ),
          gap(h: 25),
          SingleChildScrollView(
            child: Column(
              children: reports,
            ),
          )
        ],
      ),
    );
  }
}
