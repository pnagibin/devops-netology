**Задача 1**

Сценарий выполнения задачи:

создайте свой репозиторий на https://hub.docker.com;
выберите любой образ, который содержит веб-сервер Nginx;
создайте свой fork образа;
реализуйте функциональность: запуск веб-сервера в фоне с индекс-страницей, содержащей HTML-код ниже:

<html>
<head>
Hey, Netology
</head>
<body>
<h1>I’m DevOps Engineer!</h1>
</body>
</html>

Опубликуйте созданный fork в своём репозитории и предоставьте ответ в виде ссылки на https://hub.docker.com/username_repo.

**Ответ:**

https://hub.docker.com/r/pnagibin/netology-devops-pnagibin-nginx

**Задача 2**

Посмотрите на сценарий ниже и ответьте на вопрос: «Подходит ли в этом сценарии использование Docker-контейнеров или лучше подойдёт виртуальная машина, физическая машина? Может быть, возможны разные варианты?»

Детально опишите и обоснуйте свой выбор.

--

Сценарий:

1) высоконагруженное монолитное Java веб-приложение;
2) Nodejs веб-приложение;
3) мобильное приложение c версиями для Android и iOS;
4) шина данных на базе Apache Kafka;
5) Elasticsearch-кластер для реализации логирования продуктивного веб-приложения — три ноды elasticsearch, два logstash и две ноды kibana;
6) мониторинг-стек на базе Prometheus и Grafana;
7) MongoDB как основное хранилище данных для Java-приложения;
8) Gitlab-сервер для реализации CI/CD-процессов и приватный (закрытый) Docker Registry.


**Ответ:**

1) высоконагруженное монолитное Java веб-приложение; - Подойдет Docker
2) Nodejs веб-приложение;  - Подойдет Docker
3) мобильное приложение c версиями для Android и iOS;  - Подойдет Docker
4) шина данных на базе Apache Kafka;  - Подойдет Docker
5) Elasticsearch-кластер для реализации логирования продуктивного веб-приложения — три ноды elasticsearch, два logstash и две ноды kibana;  - Подойдет Docker
6) мониторинг-стек на базе Prometheus и Grafana;  - Подойдет Docker
7) MongoDB как основное хранилище данных для Java-приложения; - Отдельная виртуальная или физическая машина
8) Gitlab-сервер для реализации CI/CD-процессов и приватный (закрытый) Docker Registry.  - Подойдет Docker

Приложения, которые требуют сохранения состояния или базы данных лучше развертывать в виде отдельной виртуальной машины.


---

**Задача 3**

Запустите первый контейнер из образа centos c любым тегом в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера.
Запустите второй контейнер из образа debian в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера.
Подключитесь к первому контейнеру с помощью docker exec и создайте текстовый файл любого содержания в /data.
Добавьте ещё один файл в папку /data на хостовой машине.
Подключитесь во второй контейнер и отобразите листинг и содержание файлов в /data контейнера.

**Ответ:**

---

**Задача 4 (*)**
Воспроизведите практическую часть лекции самостоятельно.

Соберите Docker-образ с Ansible, загрузите на Docker Hub и пришлите ссылку вместе с остальными ответами к задачам.
