import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListAdd extends StatefulWidget {
  const ListAdd({super.key});

  @override
  State<ListAdd> createState() => _ListAddState();
}

class _ListAddState extends State<ListAdd> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("FirebaseCRUD"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black45,
          onPressed: () => (),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body:  ListView.builder(
                    // itemCount: streamSnapshot.data!.docs.length, //no of rows
                    itemBuilder: (context, index) {
                      // final DocumentSnapshot documentSnapshot = streamSnapshot
                      //     .data!.docs[
                      // index]; //refer to the rows we will able to acees the column or feilds
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                            title: Text("jhfds",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text("3245".toString(),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () => (),
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () =>(),
                                        // _delete(documentSnapshot.id),
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      );
                    }),

      ),
    );
  }
}
