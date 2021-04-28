class QueryMutation {
  String createUser() {
    return """ 
      
       mutation (\$email: String!,
      \$username: String!,
       \$password: String!,
       \$phonenumber: String!,
       \$referralCode: String,
       \$country: String!,
       \$currency: String!,
       \$phoneNumber: String!,
      \$callingCode: String!,
      \$flag: String!,
    ){
      register(data: {
        email: \$email,
        username: \$username,
        password: \$password,
        phonenumber: \$phonenumber,
        referralCode: \$referralCode,
        country: \$country,
        currency: \$currency,
        phoneNumberDetails: {
          phoneNumber: \$phoneNumber,
          callingCode: \$callingCode,
          flag: \$flag
        }
        
      }) {
        token
        user{
          _id
          email
          phonenumber
          phoneNumberDetails{
            phoneNumber
            callingCode
            flag
          }
          referralCode
          username 
          kycStatus
          createdAt
        }
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

  String login() {
    return """ 
      
       mutation (\$input: String!,
       \$password: String!
    ){
      login(data: {
        input: \$input,
        password: \$password,
        
      })
       {
        token
        user{
          _id
          email
          username
          phonenumber
          phoneNumberDetails{
            phoneNumber
            callingCode
            flag
          }
        
        }
         twoFactorAuth
      }
    }
      
    """;
  }

  String verifyUser() {
    return """ 
      
    mutation (\$code: Int!
    ){
      verifyUser(data: {
        code: \$code
      })
       {
        token
        user{
      _id
      email
      phonenumber
      username
      kycStatus
      referralCode    
        }
      }
    }    
    """;
  }

  String resendCode() {
    return """ 
      query resendVerificationCode(\$email: String!){
        resendVerificationCode(email:\$email)
        {
          resendVerificationCode
        }
      }
      
    """;
  }

  String logout() {
    return """ 
      
       mutation (\$input: String!,
       \$password: String!
    ){
      login(data: {
        input: \$input,
        password: \$password,
        
      })
       {
        token
        user{
          _id
          email
          username
          phonenumber
          phoneNumberDetails{
            phoneNumber
            callingCode
            flag
          }
        
        }
         twoFactorAuth
      }
    }
      
    """;
  }
}
