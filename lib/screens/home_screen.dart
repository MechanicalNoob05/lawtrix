import 'package:flutter/material.dart';
import 'package:lawtrix/components/navigation_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lawtrix/router/router.dart' as route;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String type="";
  _check()async{

    var sharedpref = await SharedPreferences.getInstance();
    var stat = sharedpref.getBool("service_provider")!;
    if(stat!=null){
      if(stat){
        setState(() {
          type = "green";
        });
      }else{
        setState(() {

          type = "hell";
        });
      }
    }else{
      throw("UNdefined users");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try{
      _check();
    }catch(err){
      print(err);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        // drawer: const NavDrawer(),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(child: Text(type.toString())),
        ),
      drawer: NavDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{

          var sharedpref = await SharedPreferences.getInstance();
          sharedpref.remove("service_provider")!;

        },
        icon: const Icon(Icons.qr_code),
        label: const Text("Scan"),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

