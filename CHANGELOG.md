# Changelog
В данном файле будет вестись вся история проекта.

Формат построен на основе [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
версии проекта ведутся в соответствии с [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 2.0.0
### Добавлено
- базовое покрытие тестами

### Изменения
- при работе с MarketData возвращается quantity вместо volume для консистентности с getQuoteLevel2

### Багфиксы
- при работе с OnTransReply ordernum заменен на order_num в соответствии с документацией quik
- при работе с getQuoteLevel2 volume заменен на quantity в соответствии с документацией quik

## [1.4]
Форкнутая версия от заброшенного 5 лет назад https://github.com/hacktrade/hacktrade
Вариант развития проекта [BetterQuik](https://github.com/BetterQuik/framework) видел, но не оценил, поэтому форкнул более простой для понимания идей автора исходный вариант
