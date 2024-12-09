#!/bin/bash

echo "Flush the manage.py command it any"

while ! python manage.py flush --no-input 2>&1; do
  echo "Flusing django manage command"
  sleep 3
done

echo "Makemigrations the Database at startup of project"

# Wait for few minute and run db migraiton
while ! python manage.py makemigrations  2>&1; do
   echo "Makemigrations is in progress status"
   sleep 3
done

echo "Migrate --run-syncdb the Database at startup of project"

# Wait for few minute and run db migraiton
while ! python manage.py migrate --run-syncdb  2>&1; do
   echo "Migration is in progress status"
   sleep 3
done

echo "Migrate the Database at startup of project"

# Wait for few minute and run db migraiton
while ! python manage.py migrate  2>&1; do
   echo "Migration is in progress status"
   sleep 3
done

echo "Create a superuser ADMIN"

# Wait for few minute and run db migraiton
while ! echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin','admin@admin.com','admin')" | python manage.py shell  2>&1; do
   echo "Create superuser is in progress status"
   sleep 3
done

echo "Django docker is fully configured successfully."

exec "$@"