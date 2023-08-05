import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hbkblanket/Application/test_cubit.dart';


final List<BlocProvider> appProviders = [
  BlocProvider<TestCubit>(create: (context) => TestCubit()),


];