import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  Map info = {};

  SearchPage({super.key, required this.info});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String eventName = '';
  TextEditingController scontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: mediaquery.height * 0.05,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Search ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: mediaquery.height * 0.05,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Search For Desired Event",
                prefixIcon: Icon(Icons.search_sharp),
              ),
              controller: scontroller,
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              height: mediaquery.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.info['content']['data'].length,
                  itemBuilder: (context, index) {
                    eventName = widget.info['content']['data'][index]['title'];

                    if (scontroller.text.isEmpty) {
                      return SingleChildScrollView(
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
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image(
                                    image: NetworkImage(widget.info['content']
                                        ['data'][index]['banner_image'])),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: mediaquery.width * 0.05,
                                  ),
                                  Text(
                                      widget.info['content']['data'][index]
                                          ['date_time'],
                                      style:
                                          const TextStyle(color: Colors.blue)),
                                  Text(
                                    widget.info['content']['data'][index]
                                        ['title'],
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on),
                                      Text(
                                        widget.info['content']['data'][index]
                                            ['venue_name'],
                                        style: const TextStyle(fontSize: 5),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    } else if (eventName
                        .toLowerCase()
                        .contains(scontroller.text.toLowerCase())) {
                      return Container(
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
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image(
                                  image: NetworkImage(widget.info['content']
                                      ['data'][index]['banner_image'])),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: mediaquery.width * 0.05,
                                ),
                                Text(
                                    widget.info['content']['data'][index]
                                        ['date_time'],
                                    style: const TextStyle(color: Colors.blue)),
                                Text(
                                  widget.info['content']['data'][index]
                                      ['title'],
                                  style: const TextStyle(color: Colors.green),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on),
                                    Text(
                                      widget.info['content']['data'][index]
                                          ['venue_name'],
                                      style: const TextStyle(fontSize: 9),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
