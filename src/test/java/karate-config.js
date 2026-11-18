function fn() {
    var env = karate.env; // permite leer variables desde la consola
    karate.log('karate.env es:', env);

    var config = {
        baseUrl: 'https://thinking-tester-contact-list.herokuapp.com'
    };

    // Aquí puedes agregar lógica condicional si en el futuro tienes ambientes de DEV y QA
    if (env == 'qa') {
        // config.baseUrl = 'url-de-qa'
    }

    // Timeout para que la API en Heroku no falle por demora
    karate.configure('connectTimeout', 30000);
    karate.configure('readTimeout', 30000);

    return config;
}