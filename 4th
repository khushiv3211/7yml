sudo apt update && sudo apt upgrade -y
sudo apt install openjdk-17-jdk -y
java -version

2.install git to clone one repo into our local machine 
sudo apt install git -y
git --version

git clone paste your forked GitHub repository link

//3.install maven
wget https://archive.apache.org/dist/maven/maven-3/3.9.2/binaries/apache-maven-3.9.2-bin.tar.gz
sudo tar -xvf apache-maven-3.9.2-bin.tar.gz -C /opt
sudo ln -sfn /opt/apache-maven-3.9.2 /opt/maven
echo 'export PATH=/opt/maven/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
mvn -version

//4.generate a build using maven
cd simple-java-maven-app
mvn clean package
ls

//5. install gradle
cd ..
sudo apt install unzip -y
wget https://services.gradle.org/distributions/gradle-8.5-bin.zip
sudo mkdir /opt/gradle
sudo unzip -d /opt/gradle gradle-8.5-bin.zip
echo 'export PATH=$PATH:/opt/gradle/gradle-8.5/bin' >> ~/.bashrc
source ~/.bashrc
gradle -v

//6. initialize gradle
cd simple-java-maven-app
gradle init

Found a Maven build. Generate a Gradle build from this? (default: yes) [yes, no] yes
Select build script DSL:
  1: Kotlin
  2: Groovy
Enter selection (default: Kotlin) [1..2] 2
Generate build using new APIs and behavior (some features may change in the next minor release)? (default: no) [yes, no] no

now open build.gradle with vi editior like vi build.gradle and hit enter after that do the follwoing changes or (ls ,nano build.gradle)
    id 'application'
jar {
    manifest {
    } 
        attributes(
            'Main-Class': 'com.mycompany.app.App'  // Ensure this matches your actual main class
        )
}
//7. now generte build
gradle build
now here can see the jar file-cd build/libs/

//8. how to check outcome
java -jar build/libs/my-app-1.0-SNAPSHOT.jar

//9.how toclean build
gradle clean build

//10. how to check maven build output
java -jar target/*.jar
