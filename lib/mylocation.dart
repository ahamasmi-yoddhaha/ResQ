import 'package:flutter/material.dart';
import 'package:e_cum_sd_app/dashboard.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({super.key});

  @override
  State<MyLocation> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyLocation> {
  @override
  Widget build(BuildContext ccontext) {
    var container = Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_hospital,
                size: 40,
                color: Colors.red,
              ),
              SizedBox(
                width: 20,
              ),
              Center(
                child: Text(
                  'HOSPITAL',
                  style: TextStyle(
                    fontFamily: "PlayfairDisplay",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'City Hospital',
            style: TextStyle(
              fontFamily: "PlayfairDisplay",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.call, color: Colors.black),
                label: Text('Call',
                    style: TextStyle(
                        color: Colors.black, fontFamily: "PlayfairDisplay")),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                label: Text(
                  'Location',
                  style: TextStyle(
                      color: Colors.black, fontFamily: "PlayfairDisplay"),
                ),
              ),
            ],
          )
        ],
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          leading: IconButton(
            icon: const Icon(Icons.dehaze_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "MY LOCATION",
                  style: TextStyle(fontSize: 30, fontFamily: "PlayfairDisplay"),
                ),
                SizedBox(
                  height: 50,
                ),
                container,
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.all(5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.local_police_outlined,
                            size: 40,
                            color: Color(0xff0f2750),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'POLICE',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: "PlayfairDisplay"),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Local Police',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "PlayfairDisplay"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.call, color: Colors.black),
                            label: Text('Call',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "PlayfairDisplay")),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.location_on, color: Colors.black),
                            label: Text('Location',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "PlayfairDisplay")),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
