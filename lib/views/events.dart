import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:saas/views/eventdetails.dart';
import 'package:saas/views/searchPage.dart';

import '../utilities/url.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> with TickerProviderStateMixin {
  var jsonResponse;

  @override
  void initState() {
    super.initState();
    getapidata();
  }

  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future getapidata() async {
    var response = await http.get(Uri.parse(AppUrl.baseUrl));
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body.toString());
      return jsonResponse;
    } else {
      throw Exception('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    setState(() {});
    return SafeArea(
        child: Material(
      child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            textTheme: TextTheme(),
            backgroundColor: Colors.white,
            title: Container(
                width: double.infinity,
                child: const Text(
                  "Events",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.left,
                )),
            actions: [
              IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage(info: jsonResponse))),
                icon: const Icon(CupertinoIcons.search),
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.ellipsis_vertical_circle),
                color: Colors.black,
              )
            ],
          ),
          body: FutureBuilder(
              future: getapidata(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: jsonResponse['content']['data'].length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => EventDetails(
                                        info: jsonResponse,
                                        index: index,
                                      ))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: mediaquery.height * 0.15,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: const Color(0x00ffffff),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: mediaquery.height * 0.18,
                                    width: mediaquery.width * 0.25,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image(
                                        image: NetworkImage(
                                            jsonResponse['content']['data']
                                                [index]['banner_image'])),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: mediaquery.width * 0.05,
                                      ),
                                      Text(
                                          jsonResponse['content']['data'][index]
                                              ['date_time'],
                                          style: const TextStyle(
                                              color: Colors.blue)),
                                      Text(
                                        jsonResponse['content']['data'][index]
                                            ['title'],
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on),
                                          Text(
                                            jsonResponse['content']['data']
                                                [index]['venue_name'],
                                            style:
                                                const TextStyle(fontSize: 11),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: Colors.red,
                      size: 50,
                      controller: _controller,
                    ),
                  );
                }
              })),
    ));
  }
}
