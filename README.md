**Домашнее задание "Применение принципов IaaC в работе с виртуальными машинами"**

**Задача 1**
Опишите основные преимущества применения на практике IaaC-паттернов.
Какой из принципов IaaC является основополагающим?

**Ответ:**
1) Ускорение производства и вывода продукта на рынок
2) Стабильность среды, устранение дрейфа конфигураций, идемпотентность
3) Более быстрая и эффективная разработка



**Задача 2**
Чем Ansible выгодно отличается от других систем управление конфигурациями?

**Ответ:**
Скорость
Простота
Расширяемость
Работает методом push, без необходимости устаналивать агента

Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — push или pull?

**Ответ:**
Я предпочитаю метод pull, т.к. система на момент распространения задачи может быть выключена или недоступно по сети, что не позволит задаче завершиться успешно. Метод pull обеспечивает выполнение задачи как только система будет включена или сетевой доступ до центра управления будет восстановлен.

**Задача 3**
Установите на личный компьютер:

VirtualBox,
Vagrant,
Terraform,
Ansible.
Приложите вывод команд установленных версий каждой из программ, оформленный в Markdown.

**Ответ:**

![image](https://github.com/pnagibin/devops-netology/assets/57600427/de552f48-615c-44cc-adc6-3d04dd2bd824)

![image](https://github.com/pnagibin/devops-netology/assets/57600427/6cc1029c-0300-4abf-9c00-c2598e557f50)

![image](https://github.com/pnagibin/devops-netology/assets/57600427/0a8eb43e-4784-4da8-8774-89f81da56f4f)

![image](https://github.com/pnagibin/devops-netology/assets/57600427/9546203b-8b72-4e99-931c-a692dfad531a)



**Задача 4**
Воспроизведите практическую часть лекции самостоятельно.

Создайте виртуальную машину.
Зайдите внутрь ВМ, убедитесь, что Docker установлен с помощью команды
docker ps,
Vagrantfile из лекции и код ansible находятся в папке.

Примечание. Если Vagrant выдаёт ошибку:

URL: ["https://vagrantcloud.com/bento/ubuntu-20.04"]     
Error: The requested URL returned error: 404:
выполните следующие действия:

Скачайте с сайта файл-образ "bento/ubuntu-20.04".
Добавьте его в список образов Vagrant: "vagrant box add bento/ubuntu-20.04 <путь к файлу>".
