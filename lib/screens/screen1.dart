import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int crosBolks = 1;
  int counter = 10;
  List data1 = [
    [
      "assets/images/image1.png",
      "2021 Pagani Huayra Roadster rwd",
      "\$3,400,000",
      "Ташкент,Учтепинский Район",
      "Сегодня в 17:31",
      false
    ],
    [
      "assets/images/image2.png",
      "Porsche 911 specs & features",
      "\$200,000",
      "Ташкент,Чиланзарский Район",
      "Вчера в 07:30",
      false
    ],
    [
      "assets/images/image3.png",
      "Televizor",
      "150,000 so'm",
      "Ташкент,Чиланзарский Район",
      "Вчера в 07:30",
      false
    ],
    [
      "assets/images/image4.png",
      "Uy 3 qavatlik",
      "\$355,000 so'm",
      "Ташкент,Чиланзарский Район",
      "Вчера в 07:30",
      false
    ],
  ];
  List<List<dynamic>> data = [];
  final SearchController = TextEditingController();

  void search() {
    data = [];
    String search = SearchController.text;

    for (int i = 0; i < data1.length; i++) {
      String word = data1[i][1];
      if (word.contains(search)) {
        data.add(data1[i]);
      }
    }
  }

  //image,title,price,location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 239, 244),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: "Главная",
              tooltip: "Главная"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
              label: "Избранное",
              tooltip: "Избранное"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline_outlined,
                color: Colors.black,
              ),
              label: "Создать",
              tooltip: "Создать"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.messenger_outline_sharp,
                color: Colors.black,
              ),
              label: "сообщение",
              tooltip: "сообщение"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.black,
              ),
              label: "Профиль",
              tooltip: "Профиль")
        ],
        backgroundColor: Colors.amber,
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 223, 237),
        title: const Text(
          "Мы нашли более 1 000 объявлений",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // data.;
                  setState(() {});
                },
                icon: const Row(
                  children: [
                    Icon(
                      Icons.arrow_upward_sharp,
                      size: 15,
                    ),
                    Icon(
                      Icons.arrow_downward,
                      size: 15,
                    )
                  ],
                ),
              ),
              PopupMenuButton<dynamic>(
                onSelected: (result) {
                  crosBolks = result;
                  setState(() {});
                },
                icon: const Text(
                  "⊟",
                  style: TextStyle(fontSize: 20),
                ),
                position: PopupMenuPosition.under,
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                    value: 1,
                    child: Text("Галерея"),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    child: Text("Список"),
                  ),
                  const PopupMenuItem(value: 2, child: Text("Плитка"))
                ],
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              controller: SearchController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide.none),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: const SizedBox(width: 10),
                  hintText: "search here"),
              onChanged: (value) {
                setState(() {
                  search();
                });
              },
            ),
          ),
          Flexible(
            child: GridView.builder(
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crosBolks == 3 ? 1 : crosBolks,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: crosBolks == 3 ? 2 / 1 : 2 / 3),
              itemBuilder: (ctx, counter) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: crosBolks == 3
                      ? Card(
                          clipBehavior: Clip.hardEdge,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 45.w,
                                    height: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Colors.amber,
                                    ),
                                    child: Image.asset(
                                      data[counter][0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      width: 70,
                                      height: 40,
                                      color: const Color.fromARGB(
                                          255, 7, 168, 160),
                                      child: const Center(
                                          child: Text(
                                        "ТОП",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 25.w,
                                            child: Text(
                                              data[counter][1],
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  data[counter][5]
                                                      ? data[counter][5] = false
                                                      : data[counter][5] = true;
                                                });
                                              },
                                              icon: Icon(data[counter][5]
                                                  ? Icons.favorite
                                                  : Icons.favorite_border))
                                        ],
                                      ),
                                      const Gap(10),
                                      const Chip(
                                        label: Text("Новый"),
                                        color: MaterialStatePropertyAll<Color>(
                                          Color.fromARGB(255, 229, 228, 228),
                                        ),
                                      ),
                                      const Gap(10),
                                      Text(
                                        data[counter][2],
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      const Gap(10),
                                      Text(
                                        data[counter][3],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        data[counter][4],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Card(
                          clipBehavior: Clip.hardEdge,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Flexible(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 200.h,
                                      decoration: const BoxDecoration(
                                        color: Colors.amber,
                                      ),
                                      child: Image.asset(
                                        data[counter][0],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        width: 70,
                                        height: 40,
                                        color: const Color.fromARGB(
                                            255, 7, 168, 160),
                                        child: const Center(
                                            child: Text(
                                          "ТОП",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, bottom: 5),
                                child: Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: Text(
                                              data[counter][1],
                                              style: TextStyle(
                                                  fontSize:
                                                      crosBolks == 1 ? 20 : 7),
                                            ),
                                          ),
                                          crosBolks == 1
                                              ? Gap(10.w)
                                              : const Gap(0),
                                          IconButton(
                                              onPressed: () {
                                                data[counter][5]
                                                    ? data[counter][5] = false
                                                    : data[counter][5] = true;
                                                setState(() {});
                                              },
                                              icon: Icon(data[counter][5]
                                                  ? Icons.favorite
                                                  : Icons.favorite_border))
                                        ],
                                      ),
                                      const Gap(10),
                                      const Chip(
                                        label: Text("Новый"),
                                        color: MaterialStatePropertyAll<Color>(
                                          Color.fromARGB(255, 229, 228, 228),
                                        ),
                                      ),
                                      const Gap(10),
                                      Text(
                                        data[counter][2],
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      const Gap(10),
                                      Text(
                                        data[counter][3],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        data[counter][4],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
