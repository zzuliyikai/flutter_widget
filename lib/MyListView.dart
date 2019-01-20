import 'package:flutter/material.dart';

class MyListView extends StatefulWidget{
  @override
  _MyListViewState createState() {

    return _MyListViewState();
  }
}

class _MyListViewState extends State<MyListView>{

  ScrollController _scrollController = ScrollController();
  List _list = new List();

  @override
  void initState() {
    super.initState();
    getData();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        getMoreData();
      }
    });

  }


  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
        child: ListView.builder(itemBuilder: _getItemRow,itemCount: _list.length,controller: _scrollController), onRefresh: _onRefresh);
  }

   getData() async{
    await Future.delayed(new Duration(seconds: 3),(){

      setState(() {
        _list = List.generate(15, (i)=>("item$i"));
      });


    });

  }

   getMoreData() {

  }

  Future _onRefresh() async {

    await Future.delayed(Duration(seconds: 3),(){

      setState(() {

        _list = List.generate(20, (i)=>("refresh data $i"));

      });
    });


  }

  Widget _getItemRow(BuildContext context, int index) {
    return ListTile(
      title:Text("current"+_list[index]),
    );

  }
}
