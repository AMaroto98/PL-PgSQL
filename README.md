# PLpgSQL

## Index

- [What is PLpgSQL?](#what-is-plpgsql)
- Manual
  - Requirements
  - Installation
- Import database and content
  - Database
    - From outside of Postgres
    - From inside of Postgres


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

Hay dos formas de importar una base de datos y su contenido a Postgre:

#### From outside of Postgres

Nos situamos en el mismo directorio donde esté el script con el código y ejecutamos el siguiente comando:

~~~
psql -U "username" -W < Database.sql
~~~

Repetimos lo mimso para el contenido:

~~~
psql -U "username" -W < Inserts.sql
~~~

---

#### From inside of Postgres

Nos situamos en el mismo directorio donde esté el script con el código y ejecutamos postgres con el siguiente comando:

~~~
psql
~~~

Una vez dentro ejecutamos el siguiente comando:

~~~
\i Database.sql
~~~

Repetimos lo mismo pero esta vez para el contenido de la base de datos:

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

The trigger generates an email for each student by selecting the first letter of the first name and the first three letters of each last name and adding the school domain.

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

---

### Cursor

---
