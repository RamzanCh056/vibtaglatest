import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/utils/constant.dart';

class SelectGif extends StatefulWidget {
  const SelectGif({super.key});

  @override
  State<SelectGif> createState() => _SelectGifState();
}

class _SelectGifState extends State<SelectGif> {
  loadGif() async {
    final data = {
      'type': 'search_gifs_stickers',
      'sub_type': 'get_gifs',
      'keyword': textController.text,
    };
    final result = await API().postData(data);
    searchedGifs = jsonDecode(result.body)['data'];
    setState(() {});
  }

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    height = deviceHeight(context: context);
    width = deviceWidth(context: context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height * 0.9,
          decoration: BoxDecoration(
            borderRadius: borderRadius(7),
            color: grayLight,
          ),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            pop(context);
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFF1F1F1)),
                            child: Icon(Icons.keyboard_arrow_down_sharp),
                          ),
                        ),
                        Text(
                          "Gif",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        gap(w: 35),
                      ],
                    ),
                    gap(h: 10),
                    Container(
                      margin: spacing(horizontal: 10),
                      child: TextFormField(
                        controller: textController,
                        onChanged: (value) {
                          loadGif();
                        },
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                              color: Colors.redAccent, fontSize: 15),
                          filled: true,
                          fillColor: Colors.grey[300],
                          hintText: 'Search',
                          suffixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter gif';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              gap(h: 10),
              Expanded(
                child: GridView.builder(
                  itemCount: searchedGifs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        gifUrl = searchedGifs[i];
                        pop(context);
                      },
                      child: ClipRRect(
                        borderRadius: borderRadius(5),
                        child: Image.network(
                          searchedGifs[i],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
