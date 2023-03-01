class Patient {
  int age;
  String name;
  String lastName;

  Patient({
    required this.age,
    required this.name,
    required this.lastName,
  });
}

final List<Patient> patients = _patients
    .map((e) => Patient(
        age: e["age"] as int,
        name: e['name'] as String,
        lastName: e['lastName'] as String))
    .toList();

final List<Map<String, Object>> _patients = [
  {
    "_id": "63ff19fd33838b4c2f71ebda",
    "index": "0",
    "guid": "610faf49-88f4-430c-acbd-487bd1e73f39",
    "isActive": "true",
    "balance": "3,459.45",
    "age": "32",
    "eyeColor": "brown",
    "name": "Charlene",
    "lastName": "Short"
  },
  {
    "_id": "63ff19fdce1894f101547f34",
    "index": "1",
    "guid": "22ac661b-5c9f-4852-adbe-b48207c859fa",
    "isActive": "false",
    "balance": "1,782.74",
    "age": "32",
    "eyeColor": "blue",
    "name": "Maryann",
    "lastName": "Barton"
  }
];
