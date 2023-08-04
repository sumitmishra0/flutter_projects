import 'package:flutter/material.dart';
import 'package:flutter_animations/app_database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 late AppDataBase myDB;
 List<Map<String,dynamic>> arrNotes = [];
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myDB = AppDataBase.db;
    getNotes();

  }

  void addNote() async{
   bool check = await myDB.addNote('Flutter', 'New flutter note');
   if(check){
    arrNotes = await myDB.fetchAllNotes();
    setState(() {
      
    });
   }
  }

  void getNotes() async{
     arrNotes = await myDB.fetchAllNotes();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Database"),),
      body: ListView.builder(
        itemCount: arrNotes.length,
        itemBuilder: (_,index){
        return ListTile(
          title: Text('${arrNotes[index]['title']}'),
          subtitle: Text('${arrNotes[index]['desc']}'), 
        );  
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        addNote();
      },child: const Icon(Icons.add),),
    );
  }
}