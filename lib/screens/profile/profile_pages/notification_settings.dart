import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../utils/constant.dart';

class NotifiationsSettings extends StatefulWidget {
  const NotifiationsSettings({Key? key}) : super(key: key);

  @override
  State<NotifiationsSettings> createState() => _NotifiationsSettingsState();
}

class _NotifiationsSettingsState extends State<NotifiationsSettings> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passowrdController = TextEditingController();

  bool isRemembered = true;
  bool isLoading = false;

 int currentIndexTab = 0;
  bool status = true;
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context) + MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(title: Text("Notifiations", style: TextStyle(color:Colors.white),),),
      body: Scaffold(
        body: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(children: [
              SizedBox(height: 10,),

              Row(
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
                          color: currentIndexTab==0?  HexColor('#FF9200'):Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child:  Center(
                        child: Text(
                          'General Notification',
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
                          color: currentIndexTab==1?  HexColor('#FF9200'):Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child:  Center(
                        child: Text(
                          'Email Notification',
                          style: TextStyle(
                              color: currentIndexTab==1? Colors.white:Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 7,),

                ],
              ),

              SizedBox(height: 20,),
              currentIndexTab ==0? Column(children: [
                Text("Notify me when"),
                SizedBox(height: 10,),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone like my post"),
                        Expanded(child: SizedBox(width: 0,)),

                    Container(
                      child: FlutterSwitch(
                        activeColor: HexColor('#FF9200'),
                        width:70.0,
                        height: 35.0,
                        valueFontSize: 25.0,
                        toggleSize: 50.0,
                        value: status,
                        borderRadius: 30.0,
                        padding: 8.0,
                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone commented on my posts"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone shared on my posts"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone commented on my posts"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone followed me"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone commented on my posts"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone liked my pages"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone commented on my posts"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone visited my profile"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone commented on my posts"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone mentioned me"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone commented on my posts"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone visited my profile"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone commented on my posts"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone mentioned me"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone commented on my posts"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone joined my groups"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone commented on my posts"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Someone posted on my timeline"),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Remind me memory "),
                        Expanded(child: SizedBox(width: 0,)),

                        Container(
                          child: FlutterSwitch(
                            activeColor: HexColor('#FF9200'),
                            width:70.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 50.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                )




              ],):Container(),



            ],),
          ),
        ),
      ),

    );

  }

}
