// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:readmore/readmore.dart';

class EventDetails extends StatefulWidget {
  Map info = {};
  int index;
  EventDetails({super.key, required this.info, required this.index});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    String address =
        widget.info['content']['data'][widget.index]['banner_image'].toString();
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          child: Column(children: [
            Container(
              height: mediaquery.height * 0.3,
              width: mediaquery.width,
              color: Colors.orange,
              child: Image(image: NetworkImage(address)),
            ),
            SizedBox(
              height: mediaquery.height * 0.04,
            ),
            Text(
              widget.info['content']['data'][widget.index]['title'],
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: mediaquery.height * 0.04,
            ),
            ListTile(
              leading: Image(
                  image: NetworkImage(widget.info['content']['data']
                      [widget.index]['organiser_icon'])),
              title: Text(
                  widget.info['content']['data'][widget.index]
                      ['organiser_name'],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400)),
              subtitle: Text(
                "Organizer",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(
              height: mediaquery.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(
                  Icons.calendar_month,
                  size: 40,
                ),
                title: Text(
                    widget.info['content']['data'][widget.index]['date_time'],
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400)),
                subtitle: const Text(
                  "Schedule",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            SizedBox(
              height: mediaquery.height * 0.04,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 23),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "About Event",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: mediaquery.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: ReadMoreText(
                widget.info['content']['data'][widget.index]['description'],
                trimLines: 3,
                textAlign: TextAlign.justify,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Show More",
                trimExpandedText: "Show less",
                lessStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green[700]),
                moreStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green[700]),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ]),
        ),
        Positioned(
            bottom: mediaquery.width * (0.1),
            left: mediaquery.width * 0.5 - 75,
            child: Container(
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Book",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ))
      ],
    ));
  }
}
