class DashboardQueries {
  factory DashboardQueries() {
    return instance;
  }
  const DashboardQueries._();

  static const DashboardQueries instance = DashboardQueries._();

  Map<String, dynamic> productsMapQuery() {
    return {
      'query': '''
                  {
                     products{
                              id
                              title
                              price
                              description
                              images

                              category{
                                      id
                                      name
                                      image
                                      }
                              }
                  }
               '''
    };
  }

  Map<String, dynamic> usersMapQuery() {
    return {
      'query': '''
                 {
                  users{
                    id
                    name
                    email
                    avatar
                  }
                }
               '''
    };
  }
}
