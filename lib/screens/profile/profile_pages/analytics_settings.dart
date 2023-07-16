import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class AnalyticsSettings extends StatefulWidget {
  const AnalyticsSettings({Key? key}) : super(key: key);

  @override
  State<AnalyticsSettings> createState() => _AnalyticsSettingsState();
}

class _AnalyticsSettingsState extends State<AnalyticsSettings> {
 int currentIndexTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Analytics", style: TextStyle(color:Colors.white),),),
      body: Scaffold(
        body: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              SizedBox(height: 30,),

              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child:
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(

                          children: [
                          Column(children: [
                         Row(children: [
                           SizedBox(width: 5,),


                           Container(
                             height: 20,
                             width: 20,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                color: Color(0xff6C5DD3)
                             ),

                             child:  Center(child: Icon(Icons.person, color: Colors.white,size: 14,)),
                           ),
                           SizedBox(width: 5,),

                           Text("Member",  style: TextStyle(color: Color(0xff485470), fontSize: 12),),
                         ],),
                            SizedBox(height: 10,),
                            Text("36 K", style: TextStyle(fontSize: 28),),
                            SizedBox(height: 10,),
                            Text("2.5%", style: TextStyle(color: Color(0xff2BB826)),),
                          ],),
                          SizedBox(width: 5,),
                          Container(
                              height: 148,
                              width: 1,
                              color: Color(0xffC8D1E5)
                          ),
                          Column(children: [
                            Row(children: [
                              SizedBox(width: 5,),


                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffFDBA31)
                                ),

                                child:  Center(child: Icon(Icons.person, color: Colors.white,size: 14,)),
                              ),
                              SizedBox(width: 5,),

                              Text("Followers",  style: TextStyle(color: Color(0xff485470), fontSize: 12),),
                            ],),
                            SizedBox(height: 10,),
                            Text("124 K", style: TextStyle(fontSize: 28),),
                            SizedBox(height: 10,),
                            Text("2.5%", style: TextStyle(color: Color(0xff2BB826)),),
                          ],),
                          SizedBox(width: 5,),
                          Container(
                              height: 148,
                              width: 1,
                              color: Color(0xffC8D1E5)
                          ),
                          Column(children: [
                            Row(children: [
                              SizedBox(width: 5,),


                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff38D1D1)
                                ),

                                child:  Center(child: Icon(Icons.camera_alt, color: Colors.white,size: 14,)),
                              ),
                              SizedBox(width: 5,),

                              Text("Post",  style: TextStyle(color: Color(0xff485470), fontSize: 12),),
                            ],),
                            SizedBox(height: 10,),
                            Text("36 K", style: TextStyle(fontSize: 28),),
                            SizedBox(height: 10,),
                            Text("2.5%", style: TextStyle(color: Color(0xff2BB826)),),
                          ],),
                          SizedBox(width: 5,),
                          Container(
                              height: 148,
                              width: 1,
                              color: Color(0xffC8D1E5)
                          ),
                          Column(children: [
                            Row(children: [
                              SizedBox(width: 5,),


                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffF44E4E)
                                ),

                                child:  Center(child: Icon(Icons.favorite, color: Colors.white,size: 14,)),
                              ),
                              SizedBox(width: 5,),

                              Text("Likes",  style: TextStyle(color: Color(0xff485470), fontSize: 12),),
                            ],),
                            SizedBox(height: 10,),
                            Text("6.5 K", style: TextStyle(fontSize: 28),),
                            SizedBox(height: 10,),
                            Text("2.5%", style: TextStyle(color: Color(0xff2BB826)),),
                          ],),
                          SizedBox(width: 5,),
                          Container(
                              height: 148,
                              width: 1,
                              color: Color(0xffC8D1E5)
                          ),





                        ],),
                      ),),
                  ],
                )
              ),
              SizedBox(height: 20,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          currentIndexTab =0;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: currentIndexTab==0?  HexColor('#485470'):HexColor('#F1F4FB') ,
                            borderRadius: BorderRadius.circular(12)),
                        child:  Center(
                          child: Text(
                            'Overall',
                            maxLines: 1,
                            style: TextStyle(
                                color:  currentIndexTab==0? Colors.white:Colors.black,

                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          currentIndexTab =1;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: currentIndexTab==1?  HexColor('#485470'):HexColor('#F1F4FB') ,
                            borderRadius: BorderRadius.circular(12)),
                        child:  Center(
                          child: Text(
                            'Today',
                            style: TextStyle(
                                color: currentIndexTab==1? Colors.white:Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          currentIndexTab =2;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: currentIndexTab==2?  HexColor('#485470'):HexColor('#F1F4FB') ,
                            borderRadius: BorderRadius.circular(12)),
                        child:  Center(
                          child: Text(
                            'Last 30 days',
                            style: TextStyle(
                                color: currentIndexTab==2? Colors.white:Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          currentIndexTab =3;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: currentIndexTab==3?  HexColor('#485470'):HexColor('#F1F4FB') ,
                            borderRadius: BorderRadius.circular(12)),
                        child:  Center(
                          child: Text(
                            'Last 3 months',
                            style: TextStyle(
                                color: currentIndexTab==3? Colors.white:Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          currentIndexTab =4;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: currentIndexTab==4?  HexColor('#485470'):HexColor('#F1F4FB') ,
                            borderRadius: BorderRadius.circular(12)),
                        child:  Center(
                          child: Text(
                            'Last year',
                            style: TextStyle(
                                color: currentIndexTab==4? Colors.white:Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              currentIndexTab ==0?Column(
                children: [
                  SizedBox(height: 10,),
                  Container(
                    height: 200,
                    // margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200, blurRadius: 5, spreadRadius: 1)
                    ]),
                    child: SfCartesianChart(
                      // Initialize category axis
                        primaryXAxis: CategoryAxis(),
                        series: <LineSeries<SalesData, String>>[
                          LineSeries<SalesData, String>(
                            // Bind data source
                              dataSource: <SalesData>[
                                SalesData('Jun', 40),
                                SalesData('Feb', 50),
                                SalesData('Mar', 60),
                                SalesData('Apr', 80),
                                SalesData('May', 90),
                                SalesData('Jun', 20),
                                SalesData('July', 40),
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales)
                        ]),
                  ),
                  SizedBox(height: 20,),
                  Text("Marketing Performance",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 250,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color:Colors.grey.shade400)
                            ),
                            child: SfCartesianChart(
                              // Initialize category axis
                                primaryXAxis: CategoryAxis(),
                                series: <LineSeries<SalesData, String>>[
                                  LineSeries<SalesData, String>(
                                    // Bind data source
                                      dataSource: <SalesData>[
                                        SalesData('Jun', 80),
                                        SalesData('Feb', 50),
                                        SalesData('Mar', 20),
                                        SalesData('Apr', 80),
                                        SalesData('May', 30),
                                        SalesData('Jun', 70),
                                        SalesData('July', 20),
                                      ],
                                      xValueMapper: (SalesData sales, _) => sales.year,
                                      yValueMapper: (SalesData sales, _) => sales.sales)
                                ])
                        ),
                        SizedBox(width: 5,),
                        Container(
                            height: 250,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color:Colors.grey.shade400)
                            ),
                            child:Container(
                                child: SfCartesianChart(
                                    primaryXAxis: CategoryAxis(),
                                   // title: ChartTitle(text: 'Half yearly sales analysis'), //Chart title.
                                    //legend: Legend(isVisible: true), // Enables the legend.
                                  //  tooltipBehavior: ChartTooltipBehavior(enable: true), // Enables the tooltip.
                                    series: <LineSeries<SalesData, String>>[
                                      LineSeries<SalesData, String>(
                                          dataSource: [
                                            SalesData('Jan', 35),
                                            SalesData('Feb', 28),
                                            SalesData('Mar', 34),
                                            SalesData('Apr', 32),
                                            SalesData('May', 40)
                                          ],
                                          xValueMapper: (SalesData sales, _) => sales.year,
                                          yValueMapper: (SalesData sales, _) => sales.sales,
                                          dataLabelSettings: DataLabelSettings(isVisible: true) // Enables the data label.
                                      )
                                    ]
                                )
                            )
                        ),

                      ],),
                  ),

                ],
              ):

              SizedBox(height: 20,),



            ],),
          ),
        ),
      ),

    );
  }
}
class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final int sales;
}