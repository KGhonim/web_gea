# RobotFramework-GEA
Practicing [**Robot Framework**](https://robotframework.org/) using [**Browser Library**](https://marketsquare.github.io/robotframework-browser/Browser.html)  for **APIs** Test Automation.

## **Project Design**:
We are implementing the **Object Model** design pattern (**Page Object Model** ). And below is the project structure folders:
	@@ -13,7 +13,7 @@ We are implementing the **Object Model** design pattern (**Page Object Model** )
1. Install [**Python™**](https://www.python.org/downloads/)
2. Open a terminal/commandline windows and **Install Robot Framework** from PyPi with pip: ```pip install robotframework```
`` 
3. Install [**Requests library**](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html): ```pip install robotframework-requests```
4. Install [**JSON Library**](https://robotframework-thailand.github.io/robotframework-jsonlibrary/JSONLibrary.html): ```pip install robotframework-jsonlibrary```
``
8. Install [**VS Code IDE**](https://code.visualstudio.com/download) and install **Robot Framework Language Server** plugin and you can install **Material Icon Theme** for better icon visibility.
## Execution:
* To execute all the test cases please run the following command from the terminal/commandline: ```robot -d Results Tests``` 
* To execute test cases through docker run the following command from the terminal/commandline to build docker image: ```docker build -t gea-robot .``` 
* after building image run the following command from the terminal/commandline to run : ```docker run --rm -i -t gea-robot``` 
* And you can learn more from the 👤 [User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html) 