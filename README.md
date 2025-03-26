
## Prerequisites

- Java 8 or higher
- Apache Maven
- MySQL database

## Setup

1. Clone the repository:
    ```sh
    git clone <repository-url>
    cd StudentDataManagement
    ```

2. Configure the MySQL database:
    - Create a database named `studentdatamanagement`.
    - Update the database connection details in the [StudentDao.java](http://_vscodecontentref_/27) and [LoginDao.java](http://_vscodecontentref_/28) files if necessary.

3. Build the project using Maven:
    ```sh
    mvn clean install
    ```

4. Deploy the WAR file generated in the [target](http://_vscodecontentref_/29) directory to your preferred servlet container (e.g., Apache Tomcat).

## Usage

1. Access the application in your web browser:
    ```
    http://localhost:8080/StudentDataManagement
    ```

2. Use the login page to sign in with your credentials.

3. Navigate through the application to manage student data:
    - Add a new student
    - Search for a student
    - Update student data
    - List all students

## Project Files

- **Java source files**:
    - [com.datamanagement.validation.dao.LoginDao](http://_vscodecontentref_/30): Handles user login validation.
    - [com.datamanagement.validation.ValidateLogin](http://_vscodecontentref_/31): A servlet for handling login requests.
    - [com.datamanagement.student.dao.StudentDao](http://_vscodecontentref_/32): Manages student data operations like search, insert, update, and list.
    - [com.datamanagement.student.Student](http://_vscodecontentref_/33): Represents a student entity.

- **Web application files**:
    - [AddStudent.jsp](http://_vscodecontentref_/34): A form to add a new student.
    - [home.jsp](http://_vscodecontentref_/35): The home page displaying options and total number of students.
    - [listAllStudents.jsp](http://_vscodecontentref_/36): Lists all students.
    - [login.jsp](http://_vscodecontentref_/37): A login form.
    - [searchStudent.jsp](http://_vscodecontentref_/38): A form to search for a student.
    - [updateStudentData.jsp](http://_vscodecontentref_/39): A form to update student data.

- **Configuration files**:
    - [pom.xml](http://_vscodecontentref_/40): Maven configuration file.
    - [.settings](http://_vscodecontentref_/41), [.classpath](http://_vscodecontentref_/42), [.project](http://_vscodecontentref_/43): Eclipse IDE configuration files.
    - [.mvn](http://_vscodecontentref_/44): Maven wrapper configuration files.

## License


