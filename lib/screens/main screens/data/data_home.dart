import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/page%20route/page_route.dart';
import 'package:swift_access/uitils/usefull_function.dart';
import 'package:swift_access/widget/app_widget.dart';

class DataHomePage extends StatefulWidget {
  const DataHomePage({super.key});

  @override
  State<DataHomePage> createState() => _DataHomePageState();
}

class _DataHomePageState extends State<DataHomePage> {
  int selectedNetwork = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final networkColors = [
      Colors.yellow.shade800,
      Colors.green.shade700,
      Colors.red.shade900,
      Colors.green.shade900,
    ];

    return Scaffold(
      backgroundColor: networkColors[selectedNetwork],
      body: Column(
        children: [
          SizedBox(height: size.height * 0.01),
          DescAndBackNav(size: size, text: ""),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            // padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(size.width * 0.02)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NetworkButton(
                  selectedRegion: selectedNetwork,
                  size: size,
                  index: 0,
                  imgUrl: "assets/mtn.png",
                  onTap: () {
                    setState(() {
                      selectedNetwork = 0;
                    });
                  },
                ),
                NetworkButton(
                  selectedRegion: selectedNetwork,
                  size: size,
                  index: 1,
                  imgUrl: "assets/glo.png",
                  onTap: () {
                    setState(() {
                      selectedNetwork = 1;
                    });
                  },
                ),
                NetworkButton(
                  selectedRegion: selectedNetwork,
                  size: size,
                  index: 2,
                  imgUrl: "assets/airtel.png",
                  onTap: () {
                    setState(() {
                      selectedNetwork = 2;
                    });
                  },
                ),
                NetworkButton(
                  selectedRegion: selectedNetwork,
                  size: size,
                  index: 3,
                  imgUrl: "assets/9mobile.png",
                  onTap: () {
                    setState(() {
                      selectedNetwork = 3;
                    });
                  },
                )
              ],
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Expanded(
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(size.width * 0.1),
                    topRight: Radius.circular(size.width * 0.1),
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  // topLeft: Radius.circular(size.width * 0.1),
                  topRight: Radius.circular(size.width * 0.1),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.01),
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        runAlignment: WrapAlignment.spaceBetween,
                        runSpacing: size.height * 0.02,
                        spacing: size.width * 0.04,
                        children: List.generate(
                          10,
                          (index) => DataPackage(
                            size: size,
                            bgColor: networkColors[selectedNetwork],
                            price: "${index + 1}000",
                            gb: "20.0GB",
                            expireIn: 30,
                            onTap: () {
                              Navigator.pushNamed(context, AppRoute.buyData);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
