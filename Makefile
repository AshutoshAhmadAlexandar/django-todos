.PHONY: runserver migrate shell createsuperuser

TAG="\n\n\033[0;32m\#\#\# "
END=" \#\#\# \033[0m\n"

HOST=0.0.0.0
PORT=8080
PYTHONPATH=django_todos
DJANGO_SETTINGS=django_todos.settings.dev

# django-command = django-admin $(1) $(HOST):$(PORT) --settings $(DJANGO_SETTINGS) --pythonpath $(PYTHONPATH)
django-command = django-admin $(1) $(2) --settings $(DJANGO_SETTINGS) --pythonpath $(PYTHONPATH)

runserver:
	@echo $(TAG)Running Server $(END)
	$(call django-command, runserver, $(HOST):$(PORT))

shell:
	@echo $(TAG)Running Shell $(END)
	$(call django-command, shell)

migrate:
	@echo $(TAG)Migrating Database$(END)
	$(call django-command, migrate)

makemigrations:
	@echo $(TAG)Creating Migrations$(END)
	$(call django-command, makemigrations)

createsuperuser:
	@echo $(TAG)Create Superuser$(END)
	$(call django-command, createsuperuser)

load_data:
	@echo $(TAG)Create Superuser$(END)
	DJANGO_SETTINGS_MODULE=$(DJANGO_SETTINGS) PYTHONPATH=$(PYTHONPATH) python load_initial_data.py
