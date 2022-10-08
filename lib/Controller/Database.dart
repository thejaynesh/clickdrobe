import '../Model/Clothes.dart';
import 'APIPath.dart';

abstract class Database {
  Stream<List<Cloth>> clothesStream();

}
// class FirestoreDatabase implements Database {
//   FirestoreDatabase({required this.uid});
//   final String uid;
//
//   Stream<List<Cloth>> clothesStream() {
//     // final path = APIPath.jobs();
//     // final reference = FirebaseFirestore.instance.collection(path);
//     // final snapshots = reference.snapshots();
//     // return snapshots.map((snapshot) => snapshot.docs.map((snapshot) {
//     //   final data = snapshot.data();
//       return Cloth(
//       );
//     }).toList()
//     );
//   }
// }