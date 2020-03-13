# How to gather code coverage results from Acceptance Tests

## Tools

* JACOCO: This library can instrument the Java code during execution to gather coverage metrics. It is usually used to track unit testing coverage, but we'll use the Agent and CLI to instrument during API or UI acceptance tests (black box).
* jacocoagent.jar: The JACOCO Agent will be used to run the application and gather coverage metrics.
* jacococli.jar: The JACOCO Commandline will be used to get the results from the Agent and generate the HTML report.

## How to

Read the instructions in the 'run_coverage.sh' file. Several Terminals will be required in order to run the application and the tests locally. These steps could be tailored to run on a remote server.
