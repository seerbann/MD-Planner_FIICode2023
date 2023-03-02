// import 'dart:async';
// import 'json.dart';
// import 'package:flutter/material.dart';
// import 'package:searchable_listview/searchable_listview.dart';

// class Searchable_Listview extends StatelessWidget {
//   const Searchable_Listview({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Scaffold(
//         body: SafeArea(
//           child: ExampleApp(),
//         ),
//       ),
//     );
//   }
// }

// class ExampleApp extends StatefulWidget {
//   const ExampleApp({Key? key}) : super(key: key);

//   @override
//   State<ExampleApp> createState() => _ExampleAppState();
// }

// class _ExampleAppState extends State<ExampleApp> {
//   final List<Patient> patients = [
//     Patient(age: 47, name: 'Leonardo', lastName: 'DiCaprio'),
//     Patient(age: 58, name: 'Johnny', lastName: 'Depp'),
//     Patient(age: 78, name: 'Robert', lastName: 'De Niro'),
//     Patient(age: 44, name: 'Tom', lastName: 'Hardy'),
//     Patient(age: 66, name: 'Denzel', lastName: 'Washington'),
//     Patient(age: 49, name: 'Ben', lastName: 'Affleck'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(15),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: SearchableList<Patient>(
//                       style: const TextStyle(fontSize: 25),
//                       onPaginate: () async {
//                         await Future.delayed(
//                             const Duration(milliseconds: 1000));
//                         setState(() {
//                           patients.addAll([
//                             Patient(age: 22, name: 'Fathi', lastName: 'Hadawi'),
//                             Patient(
//                                 age: 22, name: 'Hichem', lastName: 'Rostom'),
//                             Patient(age: 22, name: 'Kamel', lastName: 'Twati'),
//                           ]);
//                         });
//                       },
//                       builder: (Patient patient) => ActorItem(patient: patient),
//                       loadingWidget: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           CircularProgressIndicator(),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text('Incarcare pacienti...')
//                         ],
//                       ),
//                       errorWidget: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Icon(
//                             Icons.error,
//                             color: Colors.red,
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text('Error')
//                         ],
//                       ),
//                       asyncListCallback: () async {
//                         await Future.delayed(
//                           const Duration(
//                             milliseconds: 1000,
//                           ),
//                         );
//                         return patients;
//                       },
//                       asyncListFilter: (q, list) {
//                         return list
//                             .where((element) => element.name.contains(q))
//                             .toList();
//                       },
//                       emptyWidget: const EmptyView(),
//                       onRefresh: () async {},
//                       onItemSelected: (Patient item) {
//                         //  Navigator.of(context).push(MaterialPageRoute( builder: (context) => Scaffold(body: PatientDetail(item))));
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => PatientDetail(item),
//                                 settings: RouteSettings(arguments: item)));
//                       },
//                       inputDecoration: InputDecoration(
//                         labelText: "Cauta pacient",
//                         fillColor: Colors.white,
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Colors.blue,
//                             width: 1.0,
//                           ),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: ElevatedButton(
//               onPressed: addActor,
//               child: const Text('Adauga pacient'),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   void addActor() {
//     patients.add(Patient(
//       age: 10,
//       lastName: 'Ali',
//       name: 'ALi',
//     ));
//     setState(() {});
//   }
// }

// class ActorItem extends StatelessWidget {
//   final Patient patient;

//   const ActorItem({
//     Key? key,
//     required this.patient,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 80,
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           children: [
//             const SizedBox(
//               width: 10,
//             ),
//             Icon(
//               Icons.star,
//               color: Colors.yellow[700],
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Firstname: ${patient.name}',
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Lastname: ${patient.lastName}',
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Age: ${patient.age}',
//                   style: const TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class EmptyView extends StatelessWidget {
//   const EmptyView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: const [
//         Icon(
//           Icons.error,
//           color: Colors.red,
//         ),
//         Text('Nu a fost gasit niciun pacient'),
//       ],
//     );
//   }
// }

// class PatientDetail extends StatelessWidget {
//   final Patient patient;
//   const PatientDetail(this.patient);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(patient.name),
//         Text(patient.lastName),
//       ],
//     );
//   }
// }
