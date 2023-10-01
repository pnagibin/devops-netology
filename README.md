### Задание 1

1. Возьмите из [демонстрации к лекции готовый код](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1) для создания ВМ с помощью remote-модуля.
2. Создайте одну ВМ, используя этот модуль. В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} .
Воспользуйтесь [**примером**](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
3. Добавьте в файл cloud-init.yml установку nginx.
4. Предоставьте скриншот подключения к консоли и вывод команды ```sudo nginx -t```.

------

### Ответ 1

![img.png](img.png)

https://github.com/pnagibin/devops-netology/blob/ter-homeworks-04/src/config.tf

https://github.com/pnagibin/devops-netology/blob/ter-homeworks-04/src/cloud-init.yml

------

### Задание 2

1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: **одну** сеть и **одну** подсеть в зоне, объявленной при вызове модуля, например: ```ru-central1-a```.
2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev  
4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.
5. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.vpc_dev.
6. Сгенерируйте документацию к модулю с помощью terraform-docs.    
 
Пример вызова

```
module "vpc_dev" {
  source       = "./vpc"
  env_name     = "develop"
  zone = "ru-central1-a"
  cidr = "10.0.1.0/24"
}
```

------

### Ответ 2

Корневой модуль
https://github.com/pnagibin/devops-netology/tree/ter-homeworks-04/src

Дочерний модуль
https://github.com/pnagibin/devops-netology/tree/ter-homeworks-04/src/vpc

![img_1.png](img_1.png)

Документация
Корневой модуль
https://github.com/pnagibin/devops-netology/blob/ter-homeworks-04/src/AdminGuideRoot.md

Дочерний модуль
https://github.com/pnagibin/devops-netology/blob/ter-homeworks-04/src/AdminGuideVPC.md
------

### Задание 3
1. Выведите список ресурсов в стейте.
2. Полностью удалите из стейта модуль vpc.
3. Полностью удалите из стейта модуль vm.
4. Импортируйте всё обратно. Проверьте terraform plan. Изменений быть не должно.
Приложите список выполненных команд и скриншоты процессы.

------

### Ответ 3

1. ![img_2.png](img_2.png)

2. ![img_3.png](img_3.png)

3. ![img_4.png](img_4.png)

4. Результат после импорта
   
![img_5.png](img_5.png)

------

