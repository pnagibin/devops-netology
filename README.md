**Задание 1**

Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.
Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?

**Ответ:** personal.auto.tfvars

Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.

**Ответ:** "result": "2K53WcXB0wN3eOrQ"

Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.

**Ответ:**

resource "docker_image" {
Пропущен тип
Правильно resource "docker_image" "nginx" {

resource "docker_container" "1nginx" {
Опечатка в имени
Правильно 
resource "docker_container" "nginx" {

Обращение к несуществующему подтипу
name  = "example_${random_password.random_string_FAKE.resulT}"
Правильно name  = "example_${random_password.random_string.result}"
Выполните код. В качестве ответа приложите вывод команды docker ps.

**Ответ:**

![image](https://github.com/pnagibin/devops-netology/assets/57600427/3a6959d6-2cfe-415f-a271-bddc4d81ac97)
Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду terraform apply -auto-approve. Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. В качестве ответа дополнительно приложите вывод команды docker ps.
предыдущий контейнер был удален автоматически без запроса, в сулчае ошибки в описании, можно удалить не тот контейнер, который хотелось, т.к. нет возможности финальной проверки.
Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.
{
  "version": 4,
  "terraform_version": "1.5.5",
  "serial": 13,
  "lineage": "d641a841-8d3b-0387-829e-086ff4f3dbe2",
  "outputs": {},
  "resources": [],
  "check_results": null
}

Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ подкрепите выдержкой из документации провайдера docker.

**Ответ:**
В main.tf параметр keep_locally имеет значение true.

keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.
