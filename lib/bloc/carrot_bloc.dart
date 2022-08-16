import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'carrot_event.dart';
part 'carrot_state.dart';

class CarrotBloc extends Bloc<CarrotEvent, CarrotState> {
  CarrotBloc() : super(CarrotInitial()) ;
  
  @override
  Stream<CarrotState> mapEventToState(CarrotEvent event) async*{
    if(event is CarrotLogin){
      
    }
  }

}
