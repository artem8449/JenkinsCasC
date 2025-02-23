.SILENT:

COMPOSE_FILE=docker-compose.yml

# Очистка данных
clean:
	rm -rf JenkinsHome

# Запуск контейнеров
run:
	docker-compose -f $(COMPOSE_FILE) down
	docker-compose -f $(COMPOSE_FILE) up -d

# Перезапуск с пересборкой
restart: clean build
	docker-compose -f $(COMPOSE_FILE) down
	docker-compose -f $(COMPOSE_FILE) up -d --build

# Сборка образов
build:
	docker build -t jenkins ./jenkinsCasC
	docker build -t jnlp-agent ./jnlp-agent
	docker build -t ssh-agent ./ssh-agent

# Просмотр логов
logs:
	docker-compose -f $(COMPOSE_FILE) logs -f

# Остановка контейнеров
down:
	docker-compose -f $(COMPOSE_FILE) down