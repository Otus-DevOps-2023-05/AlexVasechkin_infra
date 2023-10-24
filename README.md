# AlexVasechkin_infra
AlexVasechkin Infra repository
команда ansible app -m command -a 'rm -rf ~/reddit'
вернула Operation timed out
потому что завершилась с ошибкой, так как модуль command не знает
что такое ~/, а вот ansible app -m shell  -a 'rm -rf ~/reddit'
выполнился успешно.
