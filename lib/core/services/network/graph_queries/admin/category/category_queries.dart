import 'package:asroo_ecommerce/features/admin/categories/data/models/create_category/create_category_model.dart';

class CategoryQueries {
  factory CategoryQueries() {
    return instance;
  }
  const CategoryQueries._();
  static const CategoryQueries instance = CategoryQueries._();

  Map<String, dynamic> createCategoryMapQuery(
      {required CreateCategoryModel categoryBody}) {
    return {
      'query': r'''
              mutation Create($name: String!, $image: String!){
                      addCategory(
                        data: { name: $name, image: $image }
                      ) {
                        id
                        name
                        image
                      }
                    }

        ''',
      'variables': {
        'name': categoryBody.name,
        'image': categoryBody.image,
      },
    };
  }

  Map<String, dynamic> getCategoriesMapQuery() {
    return {
      'query': '''
                 {
                    categories{
                                id
                                name
                                image
                              }
                  }
               '''
    };
  }
}
