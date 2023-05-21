# NGINX Proxy перенаправляющий поддомены на порты

## Для начала работы с поддооменами:
1. Помещаем сертфикаты в папку __ssl__;
2. Правим пути в файле __docker-compose.yml__ при необходимости;
3. Установить нужный домен в файле __blank.conf!__.

### Автоматически
1. Запустить скрипт nginx_make.sh с переменными Z, project и port, например выполнив:
```sh
bash nginx_make.sh db5 testprjct 105
```
Будет создан файл с поддоменом __db5-testprjct.XXXXX.ru__ проксирующий на порт __43105__.

### Вручную
1. Создаём корректный файл __$url.conf__ в папке __conf.d__ из файла __.conf_blank__, где __$url__ - ссылка (просто имя файла);
2. Изменяем файл, в __server_name__ и __proxy_pass__ меняем __XXX.XX__ на наш поддомен (полный путь который будет проксироваться), указываем корректное название сертификатов вместо __CCCC__ и вводим порт вместо __PPP__ на который будут перенаправляться запросы.
3. Перезапускаем контейнер:
```sh
docker restart nginx-proxy
```

## Для удаления перенаправления
### Автоматически
1. Запустить скрипт nginx_del.sh с переменными Z, project, например выполнив:
```sh
bash nginx_make.sh db5 testprjct
```
Будет удалён файл с поддоменом __db5-testprjct.XXXXX.ru__.

### Вручную 
1. Удаляем файл с названием нашего поддомена из папки __conf.d__.
2. Перезапускаем контейнер:
```sh
docker restart nginx-proxy
```
<h3 align="right"><b><a  href="https://github.com/nikitazykov">®By nikitazykov</a></b></h3>