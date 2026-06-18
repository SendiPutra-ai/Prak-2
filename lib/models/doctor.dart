class Doctor {
  final String name;
  final String specialist;
  final String image;

  const Doctor({
    required this.name,
    required this.specialist,
    required this.image,
  });
}

const List<Doctor> doctors = [
  Doctor(
    name: "Dr. Andi Saputra",
    specialist: "Spesialis Jantung",
    image: "assets/images/d1.jpeg",
  ),
  Doctor(
    name: "Dr. Budi Santoso",
    specialist: "Spesialis Anak",
    image: "assets/images/d2.jpeg",
  ),
  Doctor(
    name: "Dr. Clara Wijaya",
    specialist: "Spesialis Mata",
    image: "assets/images/d3.jpeg",
  ),
  Doctor(
    name: "Dr. Dimas Putra",
    specialist: "Spesialis THT",
    image: "assets/images/d4.jpeg",
  ),
  Doctor(
    name: "Dr. Eka Lestari",
    specialist: "Spesialis Kulit",
    image: "assets/images/d5.jpeg",
  ),
  Doctor(
    name: "Dr. Farhan Yusuf",
    specialist: "Spesialis Gigi",
    image: "assets/images/d6.jpeg",
  ),
  Doctor(
    name: "Dr. Gina Marlina",
    specialist: "Spesialis Saraf",
    image: "assets/images/d7.jpeg",
  ),
  Doctor(
    name: "Dr. Hendra Wijoyo",
    specialist: "Spesialis Bedah",
    image: "assets/images/d8.jpeg",
  ),
  Doctor(
    name: "Dr. Intan Permata",
    specialist: "Spesialis Kandungan",
    image: "assets/images/d9.jpeg",
  ),
  Doctor(
    name: "Dr. Joko Prasetyo",
    specialist: "Dokter Umum",
    image: "assets/images/d10.jpeg",
  ),
];
