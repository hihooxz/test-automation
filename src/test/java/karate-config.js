function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    baseUrl: 'https://gorest.co.in',
    authToken: 'Bearer 6d248ca53ef16aa992101b0bf599dbd5b5b84d72f3fef2714cd4907b3c5dc4b6'
  };
  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);
  return config;
}
