# WebClassApp

- Base de datos (MySQL):
    - Crear una base de datos con el nombre que deseen.
    - Para configurar a su gestor MySQL agregar un archivo llamado "db.dbconf" en el mismo directorio de manage.py, con la siguiente estructura: <br>
    [client]    
    database = nombre_de_la_DB <br>
    user = nombre_usuario (generalmente root)<br>
    password = su_clave  <br>
    default-character-set = utf8 <br>
    - Ejecutar el comando **python manage.py migrate**
