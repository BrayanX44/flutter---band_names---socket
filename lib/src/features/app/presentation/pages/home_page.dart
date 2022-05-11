import 'dart:io';

import 'package:band_names/src/features/data/models/band_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BandModel> bands = [
    BandModel(id: '1', name: 'Metalica', votes: 5),
    BandModel(id: '2', name: 'RHCP', votes: 5),
    BandModel(id: '3', name: 'Pink Floyd', votes: 5),
    BandModel(id: '4', name: 'Seven Nation Army', votes: 5),
    BandModel(id: '5', name: 'Soda Stereo', votes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Band names',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (ctx, i) => _bandTile(bands[i])),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBandDialog,
        child: const Icon(Icons.add),
        elevation: 1,
      ),
    );
  }

  Widget _bandTile(BandModel band) {
    return Dismissible(
      key: Key(band.id!),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        //TODO: llamar el borrado en el server
      },
      background: Container(
        padding: const EdgeInsets.only(left: 8.0),
        color: Colors.redAccent,
      child: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Delete band')),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(band.name?.substring(0, 2) ?? ''),
        ),
        title: Text(band.name ?? ''),
        trailing: Text(
          '${band.votes}',
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () {},
      ),
    );
  }

  addNewBandDialog(){
    final TextEditingController txCtrl = TextEditingController();
    if(Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text('New band name'),
            content: TextField(
              controller: txCtrl,
            ),
            actions: [
              MaterialButton(
                elevation: 5,
                  child: const Text('Add'),
                  textColor: Colors.blue,
                  onPressed: ()=>addBand(txCtrl.text),)
            ],
          );
        });
    }
        if(Platform.isIOS){showCupertinoDialog(
        context: context, 
        builder: (_){
          return CupertinoAlertDialog(
            title: const Text('New band name'),
            content: CupertinoTextField(
              controller: txCtrl,
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('Add'),
                onPressed: ()=>addBand(txCtrl.text),),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: const Text('Dismiss'),
                onPressed: ()=>Navigator.pop(context),),
            ],
          );
        });}
    
  }

  void addBand(String name){
    if(name.length>1){
      bands.add(BandModel(
        id: DateTime.now().toString(),
        name: name,
        votes: name.length
      ));
      setState(() {});
    }
    Navigator.pop(context);
  }

}
