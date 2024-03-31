package resources.features;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testFeatures()
    {

        return Karate.run("exchange-rate")
                .tags("@Smoke")
                .relativeTo(getClass());
    }
}
