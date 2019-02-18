import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function addProduct;
  ProductCreate(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreate();
  }
}

class _ProductCreate extends State<ProductCreate> {
  String _title;
  double _price;
  String _desc;

  Widget _createTitleTextFiled() {
    return TextField(
      decoration: InputDecoration(labelText: 'name required'),
      onChanged: (String value) {
        setState(() {
          _title = value;
        });
      },
    );
  }

  Widget _createPriceTextFiled() {
    return TextField(
      decoration: InputDecoration(labelText: 'price required'),
      keyboardType: TextInputType.numberWithOptions(),
      onChanged: (String value) {
        setState(() {
          _price = double.parse(value);
        });
      },
    );
  }

  Widget _createContentTextFiled() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(
        labelText: 'content required',
      ),
      onChanged: (String value) {
        setState(() {
          _desc = value;
        });
      },
    );
  }

  void _submitForms() {
    widget.addProduct(<String, dynamic>{
      'title': _title,
      'price': _price,
      'desc': _desc,
      'image': 'assets/01.jpg'
    });
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 750.0 ? 00.0 : deviceWidth * 0.9;
    final double paddingWidth = deviceWidth - targetWidth;

    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: paddingWidth / 2),
        // ListView always take full avialble width 
        children: <Widget>[
          _createTitleTextFiled(),
          _createPriceTextFiled(),
          _createContentTextFiled(),
          RaisedButton(
            textColor: Colors.white,
            child: Text('提交'),
            onPressed: _submitForms,
          ),
          // GestureDetector(
          //   onTap: (){
          //     print('GestureDetector');
          //   },
          //   child: Container(child: Text('click me'),),
          // ),
        ],
      ),
    );
  }
}
