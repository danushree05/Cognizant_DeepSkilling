package exercise1;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.Test;

public class testExternalApi {
     @Test
    public void testExternalApi() {
        //i created mock of ExternalApi
        ExternalApi mockApi = mock(ExternalApi.class);

        // Stub getData() method to return mock value
        when(mockApi.getData()).thenReturn("Mock Data from API");
        MyService service = new MyService(mockApi);
        String result = service.fetchData();
        assertEquals("Mock Data from API", result);
}
}