import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:vibetag/utils/constant.dart';

import 'models/catagories_model.dart';
class ExploreCatagroiers extends StatefulWidget {

  const ExploreCatagroiers({Key? key}) : super(key: key);

  @override
  State<ExploreCatagroiers> createState() => _ExploreCatagroiersState();
}

class _ExploreCatagroiersState extends State<ExploreCatagroiers> {
  var catagorieExpore = [];

  bool isLoading = true;
  List<CatagoriesModel>  explore = [];

  getListCatagories()async{
    var headers = {
      'Cookie': 'PHPSESSID=e355e30256d1865a427c31a57c6d249d; _us=1675588906; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-02-04%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'get_post_categories',
      'user_id': loginUserId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var catagorie = body['data'];
      catagorieExpore = catagorie['Explore'];
      final todo = catagorieExpore?.map((dynamic item) => CatagoriesModel.fromJson(item)).toList() ?? [];
      setState(() {
        isLoading = false;

      });
      todo;
      explore = todo;
    }
    else {
      setState(() {
        isLoading = false;

      });
    print(response.reasonPhrase);
    }
  }
  @override
  void initState() {
    getListCatagories();
    print("init call");

    super.initState();
  }
  int maxSelectedCards = 3;
  int currentSelectedCards = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Column(children: [

        const SizedBox(height: 15,),
        const Text("Explore", style: TextStyle(fontSize: 18),),
        isLoading? Center(child: const CircularProgressIndicator()):
        GridView.builder(
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 6 / 2,
            ),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: explore.length,
            itemBuilder: (
                context,
                index,
                ) {
              return Column(
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child:
                                Theme(
                                  data:
                                  Theme.of(context).copyWith(
                                    unselectedWidgetColor:
                                    const Color(0xFFFFC000),
                                    disabledColor:
                                    const Color(0xFFFFC000),
                                  ),
                                  child: Checkbox(
                                    focusColor:
                                    const Color(0xFFFFC000),
                                    checkColor: Colors.black,
                                    activeColor:
                                    const Color(0xFFFFC000),
                                    value:
                                    explore[index].isSelected!,
                                    onChanged: (value) {
                                      if(currentSelectedCards < maxSelectedCards ){
                                        setState(() {
                                          explore[index].isSelected =
                                          !explore[index]
                                              .isSelected!;
                                          if( explore[index].isSelected!){
                                            setState(() {
                                              currentSelectedCards += 1;
                                            });
                                            print("curent slected card ${currentSelectedCards}");
                                          }
                                          else{
                                            setState(() {
                                              currentSelectedCards -= 1;
                                            });
                                            print("curent slected card ${currentSelectedCards}");
                                          };



                                          setState(() {});
                                        });
                                      }
                                      if(currentSelectedCards ==2){

                                        Fluttertoast.showToast(msg: "You can select max 3 and 1 left");
                                      }



                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  explore[index].name.toString(),
                                  style: const TextStyle(
                                      color: Color(0xFF191970),
                                      fontSize: 14.0,
                                      fontWeight:
                                      FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),

                        ],
                      )),
                ],
              );
            })
      ],)


    );
  }

}
