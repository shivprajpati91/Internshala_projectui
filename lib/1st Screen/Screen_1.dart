import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int _currentScreen = 1; // Tracks which "screen" is being displayed
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 2.45, // Adjust as needed
          child: Stack(
            children: [
              // Background
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.black12,
              ),

              // Pink Container
              Positioned(
                top: 0,
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.pink,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        child: Image.asset(
                          "img/yop2.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                  top: 50,left: 10,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.arrow_left,color: Colors.white,)),
                      SizedBox(width: MediaQuery.sizeOf(context).width*0.23,),
                      Text("Wedding",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
                    ],
                  )),

              Positioned(
                top: 220,
                left: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.060,
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(0)),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentScreen = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: const Text(
                          "Bulk Food Delivery",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 220,
                right: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.060,
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(0)),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentScreen = 2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Catering service",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),

              // Buttons below the Pink Container (Tab buttons)
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.3,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.sizeOf(context).height*0.04,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentScreen = 1; // Switch to "Screen 1" content
                          });
                        },
                        child: const Text(
                          "ALL (8)",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.red),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white
                          // Text color change
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentScreen = 2; // Switch to "Screen 2" content
                          });
                        },
                        child: const Text(
                          "Breakfast",
                          style: TextStyle(color: Colors.black54),
                        ),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white
                           // Text color change
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentScreen = 3; // Switch to "Screen 3" content
                          });
                        },
                        child: const Text(
                          "Lunch & Dinner",
                          style: TextStyle(color: Colors.black54),
                        ),
                        style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.white, // Text color change
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Content Area
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.37,
                left: 10,
                right: 10,
                child: Center(
                  child: _buildCurrentScreen(),
                ),
              ),
            ],
          ),
        ),
      ),




    );


  }

  Widget _buildCurrentScreen() {
    switch (_currentScreen) {
      case 1:
        return Container(
          color: Colors.white,
          height: MediaQuery.sizeOf(context).height*21,
          width: MediaQuery.sizeOf(context).width,
          child: Column(children: [
            Container(
              height: MediaQuery.sizeOf(context).height*0.50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white,boxShadow: [BoxShadow(
                color: Colors.black26,offset: Offset(1, 10),blurRadius: 5
              )]),
              child: Stack(children: [
                Positioned(child: Container(
                  height: MediaQuery.sizeOf(context).height*0.24,
                width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),color: Colors.red),
                  child: Stack(children: [
                    Positioned(child: ClipRRect(borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                      child: Container(
                          height: MediaQuery.sizeOf(context).height*0.24,
                          width: MediaQuery.sizeOf(context).width,
                          child: Image.asset("img/image1.jpg",fit: BoxFit.fill,)),
                    )),
                    Positioned(
                        top: 25,
                        child: Container(
                      height: MediaQuery.sizeOf(context).height*0.035,
                        width: MediaQuery.sizeOf(context).width*0.32,
                        decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                            bottomRight: Radius.circular(29)),color: Colors.purple.shade700),
                        child: Center(child: Text("Best for Pooja",style: TextStyle(color: Colors.white),)),

                        )),
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height*0.035,
                          width: MediaQuery.sizeOf(context).width*0.4,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),),
                            color: Colors.white70,),
                          child: Row(
                            children: [
                              SizedBox(width: MediaQuery.sizeOf(context).width*0.01,),
                              Icon(Icons.person,color: Colors.black54,),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                              Text("Min 10 - Max 120",style:
                              TextStyle(color: Colors.black87),)],),
                        ))
                  ],),
                ),
                ), Positioned(
                  left: 20,
                    top: 220,
                    child: Text("Indian Soiree",style: TextStyle(color: Colors.black,fontSize: 24,
                      fontWeight: FontWeight.w500,),)),
                Positioned(top: 255,left: 40,
                    child: Text("7 Categories & 12 Items",style: TextStyle(fontSize: 13,
                        color: Colors.orange,fontWeight: FontWeight.w500),)),

                Positioned(
                    bottom: 85,left: 25,
                    child: Container(
                  height: MediaQuery.sizeOf(context).height*0.082,
                  width: MediaQuery.sizeOf(context).width*0.9,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                            width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                          ],
                        ),
                      ),
                )),
                Positioned(
                    bottom: 0,left: 20,
                    child: ClipRRect(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height*0.08,
                        width: MediaQuery.sizeOf(context).width*0.9,
                        color: Colors.white,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("299Rs",style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 20),),
                                  Text(" /guest",style: TextStyle(fontSize: 16),),

                                ],
                              ),   Row(
                                children: [
                                  Text("Add guest count to see ",style:
                                  TextStyle(color: Colors.black54,fontSize: 11),),
                                  SizedBox(width: MediaQuery.sizeOf(context).width*0.03,),
                                  Text("Dynamic Price",style: TextStyle(color: Colors.purple.shade600,fontWeight: FontWeight.bold),),
                                  SizedBox(width: MediaQuery.sizeOf(context).width*0.03,),
                                  Container(
                                    height: MediaQuery.sizeOf(context).height*0.046,
                                    width: MediaQuery.sizeOf(context).width*0.260,

                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                        color: Colors.purple.shade600),
                                    child: Center(child: Text("Coustimize",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                                  ),
                                ],),
                            ],),
                        ],),),
                    ))
              ],),),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
            Container(
              height: MediaQuery.sizeOf(context).height*0.50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white,boxShadow: [BoxShadow(
                  color: Colors.black26,offset: Offset(1, 10),blurRadius: 5
              )]),
              child: Stack(children: [
                Positioned(child: Container(
                  height: MediaQuery.sizeOf(context).height*0.24,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),color: Colors.red),
                  child: Stack(children: [
                    Positioned(child: ClipRRect(borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                      child: Container(
                          height: MediaQuery.sizeOf(context).height*0.24,
                          width: MediaQuery.sizeOf(context).width,
                          child: Image.asset("img/image1.jpg",fit: BoxFit.fill,)),
                    )),
                    Positioned(
                        top: 25,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height*0.035,
                          width: MediaQuery.sizeOf(context).width*0.32,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                              bottomRight: Radius.circular(29)),color: Colors.purple.shade700),
                          child: Center(child: Text("Best for Pooja",style: TextStyle(color: Colors.white),)),

                        )),
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height*0.035,
                          width: MediaQuery.sizeOf(context).width*0.4,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),),
                            color: Colors.white70,),
                          child: Row(
                            children: [
                              SizedBox(width: MediaQuery.sizeOf(context).width*0.01,),
                              Icon(Icons.person,color: Colors.black54,),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                              Text("Min 10 - Max 120",style:
                              TextStyle(color: Colors.black87),)],),
                        ))
                  ],),
                ),
                ), Positioned(
                    left: 20,
                    top: 220,
                    child: Text("Indian Soiree",style: TextStyle(color: Colors.black,fontSize: 24,
                      fontWeight: FontWeight.w500,),)),
                Positioned(top: 255,left: 40,
                    child: Text("7 Categories & 12 Items",style: TextStyle(fontSize: 13,
                        color: Colors.orange,fontWeight: FontWeight.w500),)),

                Positioned(
                    bottom: 85,left: 25,
                    child: Container(
                      height: MediaQuery.sizeOf(context).height*0.082,
                      width: MediaQuery.sizeOf(context).width*0.9,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 0,left: 20,
                    child: ClipRRect(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height*0.08,
                        width: MediaQuery.sizeOf(context).width*0.9,
                        color: Colors.white,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("299Rs",style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 20),),
                                    Text(" /guest",style: TextStyle(fontSize: 16),),

                                  ],
                                ),   Row(
                                  children: [
                                    Text("Add guest count to see ",style:
                                    TextStyle(color: Colors.black54,fontSize: 11),),
                                    SizedBox(width: MediaQuery.sizeOf(context).width*0.03,),
                                    Text("Dynamic Price",style: TextStyle(color: Colors.purple.shade600,fontWeight: FontWeight.bold),),
                                    SizedBox(width: MediaQuery.sizeOf(context).width*0.03,),
                                    Container(
                                      height: MediaQuery.sizeOf(context).height*0.046,
                                      width: MediaQuery.sizeOf(context).width*0.260,

                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                          color: Colors.purple.shade600),
                                      child: Center(child: Text("Coustimize",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                                    ),
                                  ],),
                              ],),
                          ],),),
                    ))
              ],),),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
            Container(
              height: MediaQuery.sizeOf(context).height*0.50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white,boxShadow: [BoxShadow(
                  color: Colors.black26,offset: Offset(1, 10),blurRadius: 5
              )]),
              child: Stack(children: [
                Positioned(child: Container(
                  height: MediaQuery.sizeOf(context).height*0.24,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),color: Colors.red),
                  child: Stack(children: [
                    Positioned(child: ClipRRect(borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                      child: Container(
                          height: MediaQuery.sizeOf(context).height*0.24,
                          width: MediaQuery.sizeOf(context).width,
                          child: Image.asset("img/image1.jpg",fit: BoxFit.fill,)),
                    )),
                    Positioned(
                        top: 25,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height*0.035,
                          width: MediaQuery.sizeOf(context).width*0.32,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                              bottomRight: Radius.circular(29)),color: Colors.purple.shade700),
                          child: Center(child: Text("Best for Pooja",style: TextStyle(color: Colors.white),)),

                        )),
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height*0.035,
                          width: MediaQuery.sizeOf(context).width*0.4,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),),
                            color: Colors.white70,),
                          child: Row(
                            children: [
                              SizedBox(width: MediaQuery.sizeOf(context).width*0.01,),
                              Icon(Icons.person,color: Colors.black54,),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                              Text("Min 10 - Max 120",style:
                              TextStyle(color: Colors.black87),)],),
                        ))
                  ],),
                ),
                ), Positioned(
                    left: 20,
                    top: 220,
                    child: Text("Indian Soiree",style: TextStyle(color: Colors.black,fontSize: 24,
                      fontWeight: FontWeight.w500,),)),
                Positioned(top: 255,left: 40,
                    child: Text("7 Categories & 12 Items",style: TextStyle(fontSize: 13,
                        color: Colors.orange,fontWeight: FontWeight.w500),)),

                Positioned(
                    bottom: 85,left: 25,
                    child: Container(
                      height: MediaQuery.sizeOf(context).height*0.082,
                      width: MediaQuery.sizeOf(context).width*0.9,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 0,left: 20,
                    child: ClipRRect(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height*0.08,
                        width: MediaQuery.sizeOf(context).width*0.9,
                        color: Colors.white,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("299Rs",style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 20),),
                                    Text(" /guest",style: TextStyle(fontSize: 16),),

                                  ],
                                ),   Row(
                                  children: [
                                    Text("Add guest count to see ",style:
                                    TextStyle(color: Colors.black54,fontSize: 11),),
                                    SizedBox(width: MediaQuery.sizeOf(context).width*0.03,),
                                    Text("Dynamic Price",style: TextStyle(color: Colors.purple.shade600,fontWeight: FontWeight.bold),),
                                    SizedBox(width: MediaQuery.sizeOf(context).width*0.03,),
                                    Container(
                                      height: MediaQuery.sizeOf(context).height*0.046,
                                      width: MediaQuery.sizeOf(context).width*0.260,

                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                          color: Colors.purple.shade600),
                                      child: Center(child: Text("Coustimize",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                                    ),
                                  ],),
                              ],),
                          ],),),
                    ))
              ],),),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
            Container(
              height: MediaQuery.sizeOf(context).height*0.50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white,boxShadow: [BoxShadow(
                  color: Colors.black26,offset: Offset(1, 10),blurRadius: 5
              )]),
              child: Stack(children: [
                Positioned(child: Container(
                  height: MediaQuery.sizeOf(context).height*0.24,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),color: Colors.red),
                  child: Stack(children: [
                    Positioned(child: ClipRRect(borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                      child: Container(
                          height: MediaQuery.sizeOf(context).height*0.24,
                          width: MediaQuery.sizeOf(context).width,
                          child: Image.asset("img/image1.jpg",fit: BoxFit.fill,)),
                    )),
                    Positioned(
                        top: 25,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height*0.035,
                          width: MediaQuery.sizeOf(context).width*0.32,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                              bottomRight: Radius.circular(29)),color: Colors.purple.shade700),
                          child: Center(child: Text("Best for Pooja",style: TextStyle(color: Colors.white),)),

                        )),
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height*0.035,
                          width: MediaQuery.sizeOf(context).width*0.4,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),),
                            color: Colors.white70,),
                          child: Row(
                            children: [
                              SizedBox(width: MediaQuery.sizeOf(context).width*0.01,),
                              Icon(Icons.person,color: Colors.black54,),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                              Text("Min 10 - Max 120",style:
                              TextStyle(color: Colors.black87),)],),
                        ))
                  ],),
                ),
                ), Positioned(
                    left: 20,
                    top: 220,
                    child: Text("Indian Soiree",style: TextStyle(color: Colors.black,fontSize: 24,
                      fontWeight: FontWeight.w500,),)),
                Positioned(top: 255,left: 40,
                    child: Text("7 Categories & 12 Items",style: TextStyle(fontSize: 13,
                        color: Colors.orange,fontWeight: FontWeight.w500),)),

                Positioned(
                    bottom: 85,left: 25,
                    child: Container(
                      height: MediaQuery.sizeOf(context).height*0.082,
                      width: MediaQuery.sizeOf(context).width*0.9,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                            Container(height: MediaQuery.sizeOf(context).height*0.09,
                              width: MediaQuery.sizeOf(context).width*0.23,

                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),   color: Colors.orange.shade50,),
                              child: Column(
                                children: [
                                  Image.asset("7 catogries/1.png"),
                                  Text("2 Starter")
                                ],
                              ),
                            ),SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 0,left: 20,
                    child: ClipRRect(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height*0.08,
                        width: MediaQuery.sizeOf(context).width*0.9,
                        color: Colors.white,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("299Rs",style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 20),),
                                    Text(" /guest",style: TextStyle(fontSize: 16),),

                                  ],
                                ),   Row(
                                  children: [
                                    Text("Add guest count to see ",style:
                                    TextStyle(color: Colors.black54,fontSize: 11),),
                                    SizedBox(width: MediaQuery.sizeOf(context).width*0.03,),
                                    Text("Dynamic Price",style: TextStyle(color: Colors.purple.shade600,fontWeight: FontWeight.bold),),
                                    SizedBox(width: MediaQuery.sizeOf(context).width*0.03,),
                                    Container(
                                      height: MediaQuery.sizeOf(context).height*0.046,
                                      width: MediaQuery.sizeOf(context).width*0.260,

                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                          color: Colors.purple.shade600),
                                      child: Center(child: Text("Coustimize",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                                    ),
                                  ],),
                              ],),
                          ],),),
                    ))
              ],),),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
              ],)

        );
      case 2:
        return Container(
          color: Colors.green,
          height: MediaQuery.sizeOf(context).height,
          width: double.infinity,
          child: const Center(
            child: Text(
              "This is Screen 2",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        );
      case 3:
        return Container(
          color: Colors.orange,
          height: MediaQuery.sizeOf(context).height,
          width: double.infinity,
          child: const Center(
            child: Text(
              "This is Screen 3",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        );
      default:
        return const SizedBox.shrink(); // Empty widget if no match
    }
  }
}
