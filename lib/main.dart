import 'package:flutter/material.dart';
import 'package:fultter/MyListView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {

    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails){
      print(flutterErrorDetails.toString());
      return Center(
        child: Text("Flutter 走神了"),
      );
    };

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
     //  home: DefaultTabController(length: 3, child: MyScaffold() ,)
      home: Scaffold(
        appBar: AppBar(
          title: Text("listView"),
        ),
        body: new MyListView(),
      ),
    );
  }
}

class MyScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("淘票票"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.access_alarm),
              onPressed: () => {},
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("yikai"),
                accountEmail: Text("123@163.com"),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://i2.hdslb.com/bfs/face/6572f82a9032854df41004dd7c04cbbca6835053.jpg")),
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3450341340,3777654924&fm=26&gp=0.jpg"))
                ),
              ),
              Container(
                child:
                ListTile(
                  title: Text("咨询"),
                  leading: Icon(Icons.account_circle),
                ),
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.black26,
                ),
              ),
              Divider(

              ),
              ListTile(
                title: Text("咨询"),
                leading: Icon(Icons.account_circle),
              ),
              Divider(

              ),
              ListTile(
                title: Text("咨询"),
                leading: Icon(Icons.account_circle),
              ),
            ],
          ),
        ),
        bottomNavigationBar: TabBar(tabs: <Widget>[
          Tab(icon: Icon(Icons.account_circle), text: "eee"),
          Tab(icon: Icon(Icons.account_circle), text: "eee"),
          Tab(icon: Icon(Icons.account_circle), text: "eee"),


        ],)

    );
  }




}
