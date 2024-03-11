import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController contactName = TextEditingController();
  List mylist = [
 {
      "name": "saleem",
      "userName": "saleemullah",
      "number": "0300-0000000",
    },
    {
      "name": "ali",
      "userName": "alikhan",
      "number": "0300-0000000",
    },  ];

  addNewContact(context) {
    setState(() {
      Navigator.pop(context);
      mylist.add({
        "name": contactName.text,
        "userName": "saleem",
        "number": "0300-0000000",
      });
      contactName.clear();
    });
    print(mylist);
  }
  
  editContact(context, index) {
    setState(() {
      Navigator.pop(context);
      mylist[index] = {'name': contactName.text};
      contactName.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: mylist.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${mylist[index]['name']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        mylist.removeAt(index);
                      });
                    
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      contactName.text = mylist[index]['name'];
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: TextField(
                                controller: contactName,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Contact Edit',
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      editContact(context, index);
                                    },
                                    child: Text('ok')),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      mylist.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            );
                          });
                    },
                  )
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: TextField(
                    controller: contactName,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact Name',
                    ),
                  ),
                  actions: [ TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      addNewContact(context);
                    },
                  )],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// import 'dart:html';

// import 'package:flutter/material.dart';

// class CrudOperations extends StatefulWidget {
//   const CrudOperations({super.key});

//   @override
//   State<CrudOperations> createState() => _CrudOperationsState();
// }

// class _CrudOperationsState extends State<CrudOperations> {
//   TextEditingController contactName = TextEditingController();
//   List contacts = [
//     {
//       "name": "Owais",
//       "userName": "codewithowais",
//       "number": "0300-0000000",
//     },
//     {
//       "name": "Shahzeb",
//       "userName": "shahzebnaqvi",
//       "number": "0300-0000000",
//     },
//     {
//       "name": "Ahmed",
//       "userName": "ahmedAli",
//       "number": "0300-0000000",
//     }
//   ];

//   addNewContact(context) {
//     setState(() {
//       Navigator.pop(context);
//       contacts.add({
//         "name": contactName.text,
//         "userName": "codewithowais",
//         "number": "0300-0000000",
//       });
//       contactName.clear();
//     });
//     print(contacts);
//   }

//   editContact(context, index) {
//     setState(() {
//       Navigator.pop(context);
//       contacts[index] = {
//         "name": contactName.text,
//         "userName": "codewithowais",
//         "number": "0300-0000000",
//       };
//       contactName.clear();
//     });
//     print(contacts);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView.builder(
//         itemCount: contacts.length,
//         itemBuilder: (context, i) {
//           return ListTile(
//               title: Text("${contacts[i]['name']}"),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       contactName.text = contacts[i]['name'];
//                       showDialog(
//                         // barrierDismissible: false,
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: const Text("My title"),
//                             content: TextField(
//                               controller: contactName,
//                               obscureText: false,
//                               decoration: const InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 labelText: 'Contact Edit',
//                               ),
//                             ),
//                             actions: [
//                               TextButton(
//                                 child: const Text("OK"),
//                                 onPressed: () {
//                                   editContact(context, i);
//                                 },
//                               )
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     icon: const Icon(Icons.edit),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       setState(() {
//                         contacts.removeAt(i);
//                       });
//                     },
//                     icon: const Icon(Icons.delete),
//                   ),
//                 ],
//               ));
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             // barrierDismissible: false,
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: const Text("My title"),
//                 content: TextField(
//                   controller: contactName,
//                   obscureText: false,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Contact Name',
//                   ),
//                 ),
//                 actions: [
//                   TextButton(
//                     child: const Text("OK"),
//                     onPressed: () {
//                       addNewContact(context);
//                     },
//                   )
//                 ],
//               );
//             },
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
