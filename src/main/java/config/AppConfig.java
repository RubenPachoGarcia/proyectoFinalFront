package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class AppConfig {

    /**
     * Define un RestTemplate que puede ser usado en otras partes de la aplicación.
     * El RestTemplate se utiliza para hacer solicitudes HTTP a otros servicios.
     */
    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate(); 
    }
}
