import 'package:flutter/material.dart';
import 'package:flutter_weather_demo/app_model.dart';
import 'package:watch_it/watch_it.dart';

import 'detail_page.dart';

class WeatherListView extends WatchingWidget {
  WeatherListView();
  @override
  Widget build(BuildContext context) {
    final snapshot = watchStream(
      (AppModel model) => model.WeatherStream,
    );
    if (snapshot.hasData && snapshot.data!.length > 0) {
      return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) =>
              buildRow(context, index, snapshot.data!));
    } else {
      return Text("No items");
    }
  }

  Widget buildRow(
      BuildContext context, int index, List<WeatherEntry> listData) {
    return GestureDetector(
        child: Wrap(
          spacing: 40.0,
          children: <Widget>[
            listData[index].iconURL == null
                ? SizedBox()
                : Image(image: NetworkImage(listData[index].iconURL!)),
            Text(listData[index].cityName, style: TextStyle(fontSize: 20.0))
          ],
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    DetailPage(listData[index]))));
  }
}
