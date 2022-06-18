
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

* Entre em [http://localhost:1080](http://localhost:1080) para ver os emails enviados

## Funcionamento do SMS

* Precisa criar uma conta gratuita no [Twillo](https://www.twilio.com/pt-br/)
* Após criar conta, precisa pegar os dados do account_id, auth_token e número de celular
* Para gerar a master.key para colocar dados sensiveis, rode:

```bash
  docker-compose exec app bash
```

```bash
  EDITOR=nano bundle exec rails credentials:edit
```

* Usando o nano, coloque suas informações do Twillo como exemplo abaixo:
```bash
  twillo:
        account_id: ACb2d5b9bd907f3c9c303e5b76b72c46bf
        auth_token: 904784536729dae9aaae5d27040cfca2
        my_phone_number: +19895466534
```

* Após salvar, digite "exit" para sair do bash
