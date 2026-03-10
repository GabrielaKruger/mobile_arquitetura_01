import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_arquitetura_01/presentation/viewmodels/product_viewmodel.dart';
import 'data/datasources/product_cache_datasource.dart';
import 'data/datasources/product_remote_datasource.dart';
import 'data/repositories/product_repository_imp.dart';
import 'presentation/pages/product_page.dart';

void main() {
  final cache = ProductCacheDatasource();
  final remote = ProductRemoteDatasource(http.Client());
  final repository = ProductRepositoryImpl(remote, cache);
  final viewModel = ProductViewModel(repository);

  runApp(MyApp(viewModel: viewModel));
}

class MyApp extends StatelessWidget {
  final ProductViewModel viewModel;

  const MyApp({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ProductPage(viewModel: viewModel),
    );
  }
}
