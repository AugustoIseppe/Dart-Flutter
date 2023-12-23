import 'package:app_lojaonline_ll_intermediario_http/models/product_list.dart';
import 'package:app_lojaonline_ll_intermediario_http/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _imagemUrl = TextEditingController();
  final _imagemUrlFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void initState() {
    super.initState();
    _imagemUrlFocus.addListener(updateImage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if(arg != null) {
        final product = arg as Product;
        _formData["id"] = product.id!;
        _formData["title"] = product.title!;
        _formData["price"] = product.price!;
        _formData["description"] = product.description!;
        _formData["imageUrl"] = product.imageUrl!;
        _imagemUrl.text = product.imageUrl!;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _imagemUrlFocus.removeListener(updateImage);
    _imagemUrlFocus.dispose();
  }

  bool isValidImageUrl(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endsWithFile  = url.toLowerCase().endsWith(".png") || url.toLowerCase().endsWith(".jpeg") || url.toLowerCase().endsWith(".jpg");
    return isValidUrl && endsWithFile;
  }

  void updateImage() {
    setState(() {});
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }
    _formKey.currentState?.save();

    //o listen:false na linha 60, deve ser inserido, pois o provider está fora do método build!
    Provider.of<ProductList>(context, listen: false).saveProduct(_formData);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário de Produto"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _submitForm();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  initialValue: _formData["title"].toString(),
                  decoration: const InputDecoration(
                    labelText: "Nome",
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (name) => _formData["name"] = name ?? "",
                  validator: (name) {
                    if (name!.trim().isEmpty) {
                      return "Informe seu nome";
                    }
                    if (name.trim().length < 3) {
                      return "O nome precisa de no minimo 3 letras";
                    }
                    return null; //se o retorono for null, quer dizer que foi validado com sucesso
                  },
                ),
                TextFormField(
                  initialValue: _formData["price"].toString(),
                  decoration: const InputDecoration(
                    labelText: "Preço",
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (price) =>
                      _formData["price"] = double.parse(price ?? "0"),
                      validator: (_price) {
                        final priceString = _price ?? "";
                        final price = double.tryParse(priceString) ?? -1;

                        if(price <= 0) {
                          return "Preço inválido";
                        }
                        return null;
                      },
                ),
                TextFormField(
                  initialValue: _formData["description"].toString(),
                  decoration: const InputDecoration(
                    labelText: "Descrição",
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  onSaved: (description) =>
                      _formData["description"] = description ?? "",
                      validator: (description) {
                    if (description!.trim().isEmpty) {
                      return "Informe seu nome";
                    }
                    if (description.trim().length < 10) {
                      return "Description precisa de no minimo 10 letras";
                    }
                    return null; //se o retorono for null, quer dizer que foi validado com sucesso
                  },
                      
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "URL da Imagem",
                        ),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imagemUrl,
                        focusNode: _imagemUrlFocus,
                        onFieldSubmitted: (value) => _submitForm,
                        onSaved: (urlImage) =>
                            _formData["urlImage"] = urlImage ?? "",
                            validator: (urlImage) {
                              if(!isValidImageUrl(urlImage!)) {
                                return "URL Inválida (Extensões permitidas: png, jpg e \njpeg)";
                              }
                              return null;
                            },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: _imagemUrl.text.isEmpty
                                ? const Center(
                                    child: Text(
                                    "Informe a URL da imagem",
                                    textAlign: TextAlign.center,
                                  ))
                                : FittedBox(
                                    child: Image.network(
                                      _imagemUrl.text,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
