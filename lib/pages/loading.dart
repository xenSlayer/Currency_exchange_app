import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  double value = 0;
  

  void setUpworldTime() async{
    WorldCurrency instance = WorldCurrency(country: 'ISK');
    await instance.getRate();

    setState(() {
      value = instance.rate;
    });
  }


  @override
  void initState() {
     // initState function is called once 
     // Good for setting up data
    super.initState();
    setUpworldTime();    
    
  }

  @override
  Widget build(BuildContext context) {
    // Build runs multiple times as the setState changes the data inside it
    print('build');
    return SafeArea(
          child: Scaffold(
          appBar: AppBar(
            title: Text('Choose Country'),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),  
          body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20
              ),
              
            Image.network('https://www.countryflags.io/gb/flat/64.png'),
            Text(
              '  EUR'
            ),
            Icon(
              Icons.euro_symbol,
              size: 30),
            TextField(
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                labelText: 'Country',
                border: InputBorder.none,
                hintText: 'Enter a country code'
              ),
            ),
            Text('$value'),
            ],
          ),
        ),
      ),
    );
  }
}
