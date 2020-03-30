#!/bin/bash
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
unzip sonar-scanner-cli-4.2.0.1873-linux.zip
rm sonar-scanner-cli-4.2.0.1873-linux.zip
export PATH=$(pwd)/sonar-scanner-4.2.0.1873-linux/bin:$PATH
flutter test --machine > tests.output
flutter test --coverage
sonar-scanner -Dsonar.login=$SONAR_TOKEN -Dsonar.host.url=http://3.90.25.206:9000
rm -rf sonar-scanner-4.2.0.1873-linux