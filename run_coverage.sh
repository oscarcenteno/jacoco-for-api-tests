# How to gather code coverage results from Acceptance Tests

## Prerequisistes

## 1. In the Application repository generate the Fat JAR file and run Jacoco coverage for Unit Tests
gradle shadowJar

###  run unit tests and generate Jacoco Report
gradle test jacocoTestReport

## 2. Open a Terminal windows in the Test Automation repository to run the Acceptance tests

## Check this variables are correct
APPLICATION_PATH="/c/code/your-application"
JAR="your-application-0.0.1-SNAPSHOT-all"

## Run the application with the JACOCO Agent
java -javaagent:"jacocoagent.jar"=address=*,port=36320,destfile=jacoco-it.exec,output=tcpserver,sessionid=acceptanceTests -jar "$APPLICATION_PATH/build/libs/$JAR.jar"

## 3. Open another Terminal and run the Tests
npm run api

### 4. Gather results
java -jar "jacococli.jar" dump --address localhost --port 36320 --destfile "reports/jacoco/jacoco-it.exec" 

### 5. Generate HTML Report
APPLICATION_PATH="/c/code/your-application"

java -jar "jacococli.jar" report "reports/jacoco/jacoco-it.exec" --classfiles "$APPLICATION_PATH/build/classes/java/main/app/" --sourcefiles "$APPLICATION_PATH/src/main/java/" --html "reports/jacoco-report"

### Finally stop the running application

## Additional step: Merge Unit and API tests reports

### Back to the Test Automation terminal generate the merged report
APPLICATION_PATH="/c/code/your-application"

java -jar "jacococli.jar" merge "$APPLICATION_PATH/build/jacoco/test.exec" "reports/jacoco/jacoco-it.exec" --destfile "reports/jacoco/merged.exec"

java -jar "jacococli.jar" report "reports/jacoco/merged.exec" --classfiles "$APPLICATION_PATH/build/classes/java/main/app/" --sourcefiles "$APPLICATION_PATH/src/main/java/" --html "reports/merged-jacoco-report"
