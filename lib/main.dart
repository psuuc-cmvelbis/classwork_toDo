import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<String> toDo = [];
  var item = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          
          
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: item,
                        decoration: InputDecoration(
                          label: Text('Input here..'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            toDo.add(item.text);
                          });
                        },
                        child: Text('ÁDD')),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: toDo.length,
                    itemBuilder: (context,index){
                      return MySamp(index + 1, toDo[index]);
                    }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySamp extends StatelessWidget {
  MySamp(this.index, this.item, {super.key});
  int index;
  String item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.blueAccent,
      child: Padding(
          padding: EdgeInsets.all(4),
          child: ListTile(
            title: Text(item),
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text("$index"),
            ),
            trailing: IconButton(onPressed: (
            ){
              
            }, icon: Icon(Icons.delete_forever,color: Colors.red,)),
          )),
    );
  }
}
