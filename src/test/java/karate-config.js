function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    baseUrl: 'https://gorest.co.in',
    authToken: 'Bearer a076ef5014404ddd0afc09bb4567880b87617eb06c88e39d6e6a7beded5b6fde'
  };
  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);
  return config;
}
