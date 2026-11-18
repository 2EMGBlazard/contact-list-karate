package contactlist;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class TestRunner {

    @Test
    void testParallel() {
        // Ejecuta todas las carpetas dentro de 'contactlist', usando 1 hilo de procesamiento
        Results results = Runner.path("classpath:contactlist")
                .parallel(1);

        // Falla la prueba en JUnit si hay aserciones fallidas en Karate
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}