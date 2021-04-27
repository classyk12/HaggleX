class QueryMutation {
  String addPerson(String id, String name, String lastName, int age) {
    return """
      mutation{
          addPerson(id: "$id", name: "$name", lastName: "$lastName", age: $age){
            id
            name
            lastName
            age
          }
      }
    """;
  }

  String getActiveCountries() {
    return """ 
      {
        getActiveCountries{
         _id
         name
         alpha2Code,
         alpha3Code
          region
           currencyCode
           callingCode
           hasRate
            flag
        }
      }
    """;
  }
}
