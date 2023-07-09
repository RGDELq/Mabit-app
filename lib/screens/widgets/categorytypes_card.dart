// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:mabitt/models/category_model.dart';

import '../../models/property_model.dart';

class CategoryButton extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryButton({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPropertiesPage(
              categoryModel: categoryModel,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.black38.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              categoryModel.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryPropertiesPage extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryPropertiesPage({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  _CategoryPropertiesPageState createState() => _CategoryPropertiesPageState();
}

class _CategoryPropertiesPageState extends State<CategoryPropertiesPage> {
  List<PropertyModel> _properties = [];

  @override
  void initState() {
    super.initState();
    _fetchProperties();
  }

  void _fetchProperties() {
    // TODO: Fetch properties for the selected category from your data source
    // and update the _properties list.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryModel.name),
      ),
      body: ListView.builder(
        itemCount: _properties.length,
        itemBuilder: (context, index) {
          final property = _properties[index];
          return ListTile(
            title: Text(property.name),
            subtitle: Text(property.detail),
            trailing: Text('\$${property.price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
