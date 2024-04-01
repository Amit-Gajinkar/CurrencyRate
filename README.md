**API Testing Framework - Karate**

Introduction - Karate is a test automation framework that is written in Java. It is heavily based on the Gherkin syntax, made famous by the Cucumber BDD framework. Following API: https://open.er-api.com/v6/latest/USD is tested using this framework for the given acceptance criteria.

Following are the requirements to setup this project on your system:

1. JDK 20 [Note: On recent version of JDK i.e JDK 22 errors were observed during test execution so please install the mentioned version]
2. Intellij IDE with Maven
3. Karate Plugin on Intellij IDE - Go to settings -> plugins -> Search Karate Plugin from marketplace and install the same
4. Set above installed JDK to project - Go to Project structure -> Project settings -> Project -> Select the JDK from the list -> OK
5. Reload project from POM.XML - Right click on Pom.xml -> On context menu go to Maven -> Select Reload project

Project structure -
             src-->test-->Java--> resources--> data(This folder contains all the data files which are being used by framework)--> currency.json (This file holds a list of all the currencies).
             src-->test-->Java--> resources-->--> features(This folder contains all the features and their respective test runner files)--> exchange-rate.feature & TestRunner.
             src-->test-->Java-->--> karate-config.js --> This file is used whenever we have central properties or JavaScript functions that should be reused across multiple scenarios.
             src-->test-->Java-->--> logback-test.xml --> This is the main configuration file for Karate’s logging.
             pom.xml-->  This is the main Maven configuration that includes dependencies to different libraries, configuration information, and build plugins.
             target--> This folder holds the test result file (e.g. resources.features.exchange-rate.html) for the execution under karate-reports subfolder.
