package org.example.backend.config;

import org.example.backend.adapter.OpenTDBAdapter;
import org.example.backend.service.QuestionService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import java.util.List;
import java.util.Map;

@Component
public class DataInitializer implements CommandLineRunner {

    private final QuestionService service;
    private final RestTemplate restTemplate = new RestTemplate();
    private final OpenTDBAdapter adapter = new OpenTDBAdapter();

    public DataInitializer(QuestionService service) {
        this.service = service;
    }

    @Override
    public void run(String... args) {
        if (service.listarTodas().isEmpty()) {
            System.out.println(">>> Preparando o banco... Traduzindo 50 questões.");
            fetchAndSave();
        }
    }

    private void fetchAndSave() {
        try {
            String url = "https://opentdb.com/api.php?amount=50&type=multiple";
            Map<String, Object> response = restTemplate.getForObject(url, Map.class);

            if (response != null && response.containsKey("results")) {
                List<Map<String, Object>> results = (List<Map<String, Object>>) response.get("results");

                for (Map<String, Object> res : results) {
                    try {
                        service.salvar(adapter.fromExternalApi(res));
                    } catch (Exception e) {
                        System.out.println(">>> Erro em uma questão. Pulando...");
                    }
                }
                System.out.println(">>> Sucesso! 50 questões traduzidas e salvas.");
            }
        } catch (Exception e) {
            System.err.println(">>> Erro ao buscar questões externas.");
        }
    }
}