import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(top: 35, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.08, child: const CustomAppBar()),
          space(),
          orangeCard(size),
          space(),
          const Text(
            "Statistics",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          space(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const CustomLessonCard(isNew: true),
                space(),
                const CustomLessonCard(
                  isNew: false,
                ),
                space(),
                const CustomLessonCard(
                  isNew: true,
                ),
                space(),
                const CustomLessonCard(
                  isNew: false,
                ),
                space(),
              ],
            ),
          ),
          space(),
          const Text(
            "Continue watching",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          space(),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ContinueLessons(
                  index: index,
                  size: size,
                  percent: 0.5 + (index * 0.15),
                );
              },
            ),
          )
        ],
      ),
    )));
  }

  SizedBox space() {
    return const SizedBox(
      height: 20,
      width: 20,
    );
  }

  ClipRRect orangeCard(Size size) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: size.height * 0.12,
          child: Container(
            decoration: const BoxDecoration(color: Color(0xffFF6600)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Hours",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "23h",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
                vDivider(),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daily Streaks",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "165",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
                vDivider(),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Friends",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "22",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  VerticalDivider vDivider() {
    return const VerticalDivider(
      width: 0.2,
      endIndent: 15,
      indent: 15,
      thickness: 3,
      color: Color(0xffe0e0e0),
    );
  }
}

class ContinueLessons extends StatelessWidget {
  final double percent;
  final int index;
  const ContinueLessons({
    Key? key,
    required this.percent,
    required this.size,
    required this.index,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: size.height * 0.10,
              width: 5,
              child: Container(
                  decoration: const BoxDecoration(color: Color(0xffFF6600))),
            ),
            Expanded(
              child: SizedBox(
                  height: size.height * 0.10,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff444648),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(Icons.adb),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("ıntro to Cyber-Security"),
                              Text("Paul Newman")
                            ],
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          CircularPercentIndicator(
                              // this is a pub package
                              fillColor: Colors.transparent,
                              progressColor: const Color(0xffFF6600),
                              radius: 30,
                              percent: percent,
                              lineWidth: 3,
                              animation: true,
                              center: Text(
                                "%${(0.5 + (index * 0.15)) * 100}",
                                style: const TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}

class CustomLessonCard extends StatelessWidget {
  final bool isNew; // if isnew == true NEW tag is showing

  const CustomLessonCard({
    super.key,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 190,
        width: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: const BoxDecoration(color: Color(0xff444648)),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xffFF6600),
                    child: Icon(Icons.access_time_rounded),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Udemy",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: isNew
                                    ? Container(
                                        decoration: const BoxDecoration(
                                            color: Color(0xff929292)),
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "New",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ))
                                    : const Text(""),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "12h",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class NotificationCard extends StatefulWidget {
  const NotificationCard({
    super.key,
  });

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool done = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: const Color(0xff404040).withValues(alpha: 0.4),
          shape: const CircleBorder(),
          child: IconButton(
              onPressed: () {
                setState(() {
                  done = !done;
                });
              },
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.white,
              )),
        ),
        Positioned(
          left: 29,
          top: 3,
          child: Container(
            decoration: BoxDecoration(
                color: done ? Colors.red : Colors.grey, shape: BoxShape.circle),
            width: 8,
            height: 8,
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 0,
          child: CircleAvatar(
            backgroundColor: const Color(0xff404040).withValues(alpha: 0.4),
            child: const Icon(
              Icons.person_3_rounded,
              color: Color(0xffFFC107),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Doe",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Software Developer",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.white, fontSize: 12),
                )
              ],
            ),
          ),
        ),
        const Expanded(
          flex: 0,
          child: SizedBox(
            child: NotificationCard(),
          ),
        ),
      ],
    );
  }
}
