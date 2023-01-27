import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/current_weather_data.dart';

import '../controller/home_controller.dart';
import 'images.dart';

class MyCard extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          image: AssetImage(
            'assets/images/cloud-in-blue-sky.jpg',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: TextField(
              onChanged: (value) => controller.city = value,
              style: TextStyle(
                color: Colors.white,
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) => controller.updateWeather(),
              decoration: InputDecoration(
                suffix: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'Search'.toUpperCase(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: SizedBox(
              height: 10,
              width: 10,
              child: OverflowBox(
                minWidth: 0.0,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: 0.0,
                maxHeight: (MediaQuery.of(context).size.height / 4),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.only(top: 15, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      '${controller.currentWeatherData.name}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Colors.black45,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'flutterfonts',
                                          ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      DateFormat()
                                          .add_MMMMEEEEd()
                                          .format(DateTime.now()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Colors.black45,
                                            fontSize: 16,
                                            fontFamily: 'flutterfonts',
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '${controller.currentWeatherData.weather![0].description}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              color: Colors.black45,
                                              fontSize: 22,
                                              fontFamily: 'flutterfonts',
                                            ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '${(controller.currentWeatherData.mainWeather!.temp! - 273.15).round().toString()}\u2103',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts'),
                                      ),
                                      Text(
                                        'min: ${(controller.currentWeatherData.mainWeather!.temp_min! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.mainWeather!.temp_max! - 273.15).round().toString()}\u2103',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              color: Colors.black45,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'flutterfonts',
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: LottieBuilder.asset(
                                            Images.cloudyAnim),
                                      ),
                                      Container(
                                        child: Text(
                                          'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                color: Colors.black45,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'flutterfonts',
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => VerticalDivider(
          color: Colors.transparent,
          width: 5,
        ),
        itemCount: controller.dataList.length,
        itemBuilder: (context, index) {
          CurrentWeather? data;
          (controller.dataList.length > 0)
              ? data = controller.dataList[index]
              : data = null;
          return Container(
            width: 140,
            height: 150,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      (data != null) ? '${data.name}' : '',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontFamily: 'flutterfonts',
                          ),
                    ),
                    Text(
                      (data != null)
                          ? '${(data.mainWeather!.temp! - 273.15).round().toString()}\u2103'
                          : '',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontFamily: 'flutterfonts',
                          ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: LottieBuilder.asset(Images.cloudyAnim),
                    ),
                    Text(
                      (data != null) ? '${data.weather![0].description}' : '',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black45,
                            fontFamily: 'flutterfonts',
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class MyChart extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 240,
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: SfCartesianChart(
//           primaryXAxis: CategoryAxis(),
//           series: <ChartSeries<FiveDaysDate, String>>[
//             SplineSeries<FiveDaysDate, String>(
//               dataSource: controller.fiveDaysData,
//               xValueMapper: (FiveDaysDate f, _) => f.dateTime,
//               yValueMapper: (FiveDaysDate f, _) => f.temp,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
