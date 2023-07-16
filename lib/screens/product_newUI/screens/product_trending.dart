import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vibetag/screens/header/header.dart';
import 'package:vibetag/utils/constant.dart';

import '../../../widgets/navbar.dart';
import 'package:http/http.dart' as http;

class ProductTrending extends StatefulWidget {
  const ProductTrending({Key? key}) : super(key: key);

  @override
  State<ProductTrending> createState() => _ProductTrendingState();
}

class _ProductTrendingState extends State<ProductTrending> {
  var trending =[];
  bool isLoading = true;
  getTrandingProduct()async{
    var headers = {
      'Cookie': 'DO-LB="MTAuMTA2LjAuNDo0NDM="; PHPSESSID=qtl4uu0paqftmosllav5b11bie; _us=1683716132; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-05-09%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'trending_area',
      'action': 'latest_products',
      'user_id': loginUserId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());.
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      trending =body['data'];
      print("tending == ${trending}");
      setState(() {
        trending;
      });
      setState(() {
        isLoading = false;
      });
    }
    else {
    print(response.reasonPhrase);
    setState(() {
      isLoading = false;
    });
    }

  }
  @override
  void initState() {
    getTrandingProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: const Color(0xFFF1F4FB),
      body: isLoading? Center(child: CircularProgressIndicator()):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            children: [
              NavBar(),
              Header(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search for anything",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                   // suffixIcon: const ImageIcon(AssetImage("assets/images/filter.png"),),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),

                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),

                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        width: 95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Best match",style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF485470),
                            ),),
                           const Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xFF99A7C7),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Container(
                        height: 40,
                        width: 95, decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Distance",style: TextStyle(
                              fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF485470),
                            ),),
                            const Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xFF99A7C7),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Container(
                        height: 40,
                        width: 95,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Free Delivery",style: TextStyle(
                              fontSize: 10,fontWeight: FontWeight.w500,color: Color(0xFF485470),
                            ),),
                            const Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xFF99A7C7),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xFF478CCA),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Text("Trending Products",style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.w700,color: Color(0xFF485470),
                ),),
                const Text('2441064 items found for "Trending"',style: TextStyle(
                    fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF485470),
                ),),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: GridView.builder
                (gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.67

              ),
                itemCount: trending.length,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Color(0xFFC8D1E5),width: 2),
                    image: DecorationImage(
                      image: NetworkImage(
                        trending[index]['images'][0]['image'],
                      ),
                      fit: BoxFit.fill,
                    )
                  ),
                  child: Column(
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: SizedBox(height: 30,)),

                      Container(
                      //  height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10),),
                            color: Color(0xFFF8F9FB),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(trending[index]['name'],style: TextStyle(fontWeight: FontWeight.w600 ),),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                ...List.generate(5, (index) => Icon(Icons.star,color: Color(0xFFFFB13D),),),
                                SizedBox(width: 5,),
                                Text("(33)",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Color(0xFF485470)),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "\$${trending[index]['price']}",
                              style: TextStyle(
                                color: Color(0xFFF27F12),
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                            SizedBox(width: 10,),
                            Row(
                              children: const [
                                Text(
                                  "\$2.00",
                                  style: TextStyle(
                                      color: Color(0xFF7D8CAC),
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "-53%",
                                  style: TextStyle(
                                    color: Color(0xFF7D8CAC),
                                    fontWeight: FontWeight.w500,

                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }, ),
            ),
          )
        ],
      ),
    ),);
  }
}
