# PLpgSQL

## Index

- [What is PLpgSQL?](#what-is-plpgsql)

- [Manual](#manual)
  - [Requirements](#requirements)
  - [Installation](#installation)

- [Import database and content](#import-database-and-content)
    - [From outside of Postgres](#from-outside-of-postgres)
    - [From inside of Postgres](#from-inside-of-postgres)

- [Function](#function)
- [Procedure](#procedure)
- [Trigger](#trigger)
- [Cursor](#cursor)

---

## what is PLpgSQL?

PL/pgSQL is a procedural language used in PostgreSQL for creating functions and stored procedures. This language allows you to create blocks of code that can be executed inside the database server, and can be called from external applications.

---

### Manual

#### Requirements

In order to start running the program you must have the following minimum requirements:

- Git
- PostgreSQL
- Linux

---

#### Installation

Create a directory and place yourself inside it. It is important to create it because all the application code will be stored here.
~~~
$ mkdir PLpgSQL
$ cd PLpgSQL
~~~

Once inside the directory we clone the Github repository.
~~~
git clone https://github.com/AMaroto98/PLpgSQL
~~~

---

### Import database and content

There are two ways to import a database and its contents into Postgre:

#### From outside of Postgres

We place ourselves in the same directory where the script with the code is and execute the following command:

~~~
psql -U "username" -W < Database.sql
~~~

We repeat the same for the content:

~~~
psql -U "username" -W < Inserts.sql
~~~

---

#### From inside of Postgres

We place ourselves in the same directory where the script with the code is and execute postgres with the following command:

~~~
psql
~~~

Once inside we execute the following command:

~~~
\i Database.sql
~~~

We repeat the same thing but this time for the database content:

~~~
\i Inserts.sql
~~~

---

### Function

The file containing the function for the database can be found in the `src` folder.

It is in charge of calculating the average grade of the students in the database.

To import the function to Postgres you can do it in the same way that we have imported the database and the data of this one.

I recommend you to do it from within Postgres itself because it is less prone to errors. Remember that you have to be located in the same directory where the .sql file is located, that is, the `src` folder.

To check that the function goes well we can execute the following query:

~~~
SELECT calcular_media();
~~~

And we will get the following output:

![Function](/images/Function.png)

---

### Procedure

The file containing the procedure for the database can be found in the `src` folder.

The procedure generates an email for each student by selecting the first letter of the first name and the first three letters of each last name and adding the school domain.

To import the function to Postgres you can do it in the same way that we have imported the database and the data of this one.

I recommend you to do it from within Postgres itself because it is less prone to errors. Remember that you have to be located in the same directory where the .sql file is located, that is, the `src` folder.

To check that the procedure goes well we can execute the following query:

~~~
CALL crear_email('Juan'::varchar, 'Perez'::varchar, 'Garcia'::varchar, 'email'::varchar);
~~~

It is important to pass the parameters indicating the type of each one, otherwise errors may occur.

And we will get the following output:

![Procedure](/images/Procedure.png)

---

### Trigger

The file containing the trigger for the database can be found in the `src` folder.

A trigger is a PostgreSQL structure used to execute a predefined function when an event occurs. In itself, the trigger has no internal logic, it simply executes the function that we have defined in the same file.

In the case of this database, two similar triggers have been created that are triggered when student grades are inserted or updated. If the grades are incorrect, that is, if they are negative numbers or greater than 10, the trigger automatically corrects the value.

To better understand this process, let's see an example:

This is the table with the data we entered at the beginning:

![Before](/images/Before.png)

Now we import the Triggers and Functions in the same way as in the previous cases.

Now we will introduce the next student with incorrect grades:

~~~
INSERT INTO alumnos (id, nombre, apellido1, apellido2, nota, email) VALUES (99, 'Prueba', 'Prueba', 'Prueba', 87, NULL);
~~~

![After](/images/After.png)

As we can see the note that we have inserted has gone from 87 to 10. The previous notes have not been modified because when we entered the data the first time these triggers were not in the database.

---

### Cursor

The file containing the cursor for the database can be found in the `src` folder.

The cursor goes through the table "students" and saves each row in the variable "student". Then, at each iteration of the loop, the data of the row stored in the variable "student" is printed using the RAISE NOTICE command.

To verify that it works correctly we will copy the content of the `Cursor.sql` file inside the `scr` folder and paste it in the postgres terminal.

And we will get the following output:

![Cursor](/images/Cursor.png)

---