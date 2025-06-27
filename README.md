JOÃO FRANCISCO MASCARELLO - RA 1135131
CARLOS HENRIQUE FERRÃO - RA 1135230
LUCAS FELIPE FERRARI - RA 1134435



# Trabalho Flink - BigData Pipeline

Este projeto demonstra a criação de um pipeline de dados utilizando Apache Flink, Kafka e PostgreSQL em containers Docker.

---

## Descrição do Pipeline

1. **Gerador de dados (Faker)**: Gera dados sintéticos em tempo real com 4 colunas (id, name, birth_date e score).
2. **Kafka**: Armazena os dados gerados em um tópico Kafka.
3. **PostgreSQL**: Recebe os dados do Kafka e armazena na tabela `dados_flink`.

---

## Estrutura do Pipeline no Flink

- Tabela geradora de dados (`generic_table`) usando o conector Faker.
- Tabela Kafka para produção e consumo de dados via tópico Kafka.
- Tabela Postgres para armazenamento final dos dados.

---

## Especificação da tabela PostgreSQL

A tabela `dados_flink` no banco PostgreSQL tem a seguinte estrutura:

| Coluna      | Tipo            | Descrição                       |
|-------------|-----------------|--------------------------------|
| `id`        | INTEGER         | Identificador numérico único   |
| `name`      | VARCHAR(255)    | Nome completo da pessoa        |
| `birth_date`| DATE            | Data de nascimento             |
| `score`     | DOUBLE PRECISION| Nota/valor associado ao registro|

---

## Docker Compose

O ambiente é executado em containers Docker, incluindo:

- Zookeeper
- Kafka (versão 7.2.2)
- Kafka UI para monitoramento dos tópicos
- Flink (jobmanager e taskmanager)
- PostgreSQL para armazenamento dos dados

---
