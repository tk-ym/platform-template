#!/bin/sh

prepare_settings() {
  if [ ${1} = "test" ]; then
    echo "prepare settings for" ${1}
    echo "test"
  fi

  if [ ${1} = "develop" ]; then
    echo "prepare settings for" ${1}
    export DJANGO_SETTINGS_MODULE=config.settings.develop
    pip install -r requirements/develop.txt
  fi

  if [ ${1} = "production" ]; then
    echo "prepare settings for" ${1}
    export DJANGO_SETTINGS_MODULE=config.settings.production
    pip install -r requirements/production.txt
  fi
}

prepare_settings ${DJANGO_ENV}
python manage.py makemigrations
python manage.py migrate
exec "$@"
