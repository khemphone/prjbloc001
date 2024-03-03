import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prjbloc001/model/item_molel.dart';

import 'package:prjbloc001/repo/items_repo.dart';

part 'items_event.dart';
part 'items_state.dart';

// class ItemsBloc extends Bloc<ItemLoadedEvent, ItemsState> {
//   ItemsBloc() : super(ItemsLoadingState()) {
//     on<ItemLoadedEvent>((event, emit) async {
//       try {
//         emit(ItemsLoadingState());

//         var response = await http.get(
//           Uri.parse("https://fakestoreapi.com/products"),
//         );

//         if (response.statusCode == 200) {
//           var data = itemModelFromJson(response.body);
//           emit(ItemsLoadedState(itemsList: data));
//         } else {
//           throw Exception("Data not found.");
//         }
//       } catch (e) {
//         emit(ItemsErrorState(errorMSG: e.toString()));
//       }
//     });
//   }
// }



class ItemsBloc extends Bloc<ItemLoadedEvent, ItemsState> {
  final ItemsRepo itemRepo;

  ItemsBloc(this.itemRepo) : super(ItemsLoadingState()) {
    on<ItemLoadedEvent>((event, emit) async {
      try {
        emit(ItemsLoadingState());
        var data = await itemRepo.getItems();
        emit(ItemsLoadedState(data));
      } catch (e) {
        emit(ItemsErrorState(e.toString()));
      }
    });
  }
}
