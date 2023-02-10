import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_checker/providers/Counter.dart';
import 'package:state_checker/providers/Internet.dart';

class HomeScreenRoute extends StatefulWidget {
  const HomeScreenRoute({Key? key}) : super(key: key);
  static const routeName = "/home";
  @override
  _HomeScreenRouteState createState() => _HomeScreenRouteState();
}

class _HomeScreenRouteState extends State<HomeScreenRoute> {
  @override
  void initState() {
    context.read<Counter>().addListener(() {
      print("change");
      print(context.watch<Counter>().count);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<InternetProvider>(
        builder: (context,state,child){
          if (state.isConnected==false){
            return Container(
              alignment: Alignment.center,
              child: Text("No internet"),
            );
          }
          else{
            return Container(
                alignment: Alignment.center,
                child: Text(context.watch<Counter>().count.toString()));
          }
        }
      ),
    floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            context.read<Counter>().decrement();
          },
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: (){
            context.read<Counter>().increment();
          },
        ),
      ],
    ),
    );

  }
}
