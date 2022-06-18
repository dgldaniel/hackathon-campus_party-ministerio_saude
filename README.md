
# Hackathon 2022 - Campus Party - Ministério da Saúde

Prótotipo de uma funcionalidade do sistema onde podemos filtrar dados de pacientes, visualizar gráficos e enviar mensagem pro paciente por SMS ou Email

## Requisitos

[Instalação do Docker](https://www.docker.com/get-started/)

Sistemas Linux ou Mac são recomendados
## Como executar

* Faça o clone desse projeto, no terminal da pasta, execute esse comando:

```bash
  docker-compose up --build
```
* Após tudo estiver executado, abra um novo terminal na mesma pasta e rode
```bash
  docker-compose exec app bundle exec rails db:create db:migrate db:seed
```

* Para gerar dados ficticios, execute:

```bash
  docker-compose exec app bundle exec rails create_fake_data:ind_reg
```

* Entre em [http://localhost:3000](http://localhost:3000), onde pode explorar a tabela dos dados, ver gráficos, visualizar, remover, editar, criar e excluir um registro

* Entre em [http://localhost:3000](http://localhost:3000) para ver os emails enviados
