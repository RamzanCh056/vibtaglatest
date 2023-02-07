import 'package:flutter/material.dart';

import '../constants.dart';

class ViewMedia extends StatefulWidget {
  const ViewMedia({Key? key}) : super(key: key);

  @override
  State<ViewMedia> createState() => _ViewMediaState();
}

class _ViewMediaState extends State<ViewMedia> {
  final List title = ["Images", "Videos", "Document", "Link"];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: txtColor,
          automaticallyImplyLeading: false,
          toolbarHeight: 140,
          flexibleSpace: Container(
            width: double.infinity,
            color: txtColor,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Starred Message",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    title.length,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: Text(
                        title[index],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: _currentIndex == index
                                ? highShadeOrangeColor
                                : txtColor),
                      ),
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: txtColor,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    title.length,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: Container(
                        width: 80,
                        height: 2,
                        color: _currentIndex == index
                            ? highShadeOrangeColor
                            : txtColor,
                      ),
                    ),
                  )),
            ),
            if (_currentIndex == 0) const Images(),
            if (_currentIndex == 1) const Videos(),
            if (_currentIndex == 2)
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Recent",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            if (_currentIndex == 3)
              Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Text(
                      "Recent",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF1F4FB),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  "assets/images/nature.png",
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "www.google.com",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: txtColor),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "https://www.google.com/search&tbm=isch&rewgtrt5=7t ved2ahUKEwjb86bllqz8AhWPrycCHZLuCmwQ2-435ycCeQIABAA&oq",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: txtColor),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text("Last Month",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: txtColor),),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 170,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 8,
                        itemBuilder: (ctx,index){
                        return Container(
                          height: 80,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFF1F4FB),
                          ),
                          child: Row(
                            children: [
                              SizedBox(height: 80,width: 80,
                                child: Image.asset("assets/images/cr.png"),
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "www.google.com",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: txtColor),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "https://www.google.com/search&tbm=isch&rewgtrt5=7t ved2ahUKEwjb86bllqz8AhWPrycCHZLuCmwQ2-435ycCeQIABAA&oq",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: txtColor),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Videos extends StatelessWidget {
  const Videos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 480,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Recent",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 215,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/Rectangle 1462.png"),
                        ),
                      ),
                      child: const Icon(
                        Icons.play_circle_outline_sharp,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Images extends StatelessWidget {
  const Images({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Recent",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 480,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  mainAxisSpacing: 20),
              itemBuilder: (ctx, index) {
                return Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/Rectangle 1461.png"),
                  )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
