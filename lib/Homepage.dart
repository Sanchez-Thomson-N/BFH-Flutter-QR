import "package:flutter/material.dart";
import 'package:bfh_qr/qrscan.dart';

void main() {
  runApp(MaterialApp(
    title: "Foot Mark",
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Foot Mark"),
          backgroundColor: Colors.lightBlue.shade700,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Colors.lightBlue.shade700,
                  Colors.lightBlueAccent.shade400
                ])),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/guest-user.jpg',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Username',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CustomListTile(Icons.person, 'Profile', () => {}),
              CustomListTile(Icons.edit, 'Edit profile', () => {}),
              CustomListTile(Icons.qr_code, 'Generate QR code', () => {}),
              CustomListTile(Icons.info, 'About Us', () => {}),
            ],
          ),
        ),
        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Container(
                width: 300.0,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 20.0),
                          blurRadius: 30.0,
                          color: Colors.black12)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0)),
                child: Row(
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => QRScanPage()));
                        },
                        child: Container(
                          width: 200.0,
                          height: 80,
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 12.0),
                          child: Text(
                            'Qr Code Scanner',
                            style: Theme.of(context).textTheme.button.apply(
                                color: Colors.white, fontSizeDelta: 12.0),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.lightBlue.shade700,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(95.0),
                                  topLeft: Radius.circular(95.0),
                                  bottomRight: Radius.circular(200.0))),
                        )),
                    Container(
                        width: 10.0,
                        height: 80,
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12.0),
                        child: Icon(Icons.qr_code_scanner, size: 50.0)),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 300.0,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 20.0),
                          blurRadius: 30.0,
                          color: Colors.black12)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0)),
                child: Row(
                  children: <Widget>[
                    InkWell(
                        onTap: () => null,
                        child: Container(
                          width: 200.0,
                          height: 80,
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 12.0),
                          child: Text(
                            'Qr Code Generator',
                            style: Theme.of(context).textTheme.button.apply(
                                color: Colors.white, fontSizeDelta: 12.0),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.lightBlue.shade700,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(95.0),
                                  topLeft: Radius.circular(95.0),
                                  bottomRight: Radius.circular(200.0))),
                        )),
                    Container(
                        width: 10.0,
                        height: 80,
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12.0),
                        child: Icon(Icons.qr_code, size: 50.0)),
                  ],
                )),
          ],
        )));
  }
}

class CustomListTile extends StatefulWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  CustomListTile(this.icon, this.text, this.onTap);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400)),
        ),
        child: InkWell(
          splashColor: Colors.lightBlueAccent.shade400,
          onTap: widget.onTap,
          child: Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(widget.icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
