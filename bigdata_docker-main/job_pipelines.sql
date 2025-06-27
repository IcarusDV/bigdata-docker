-- Tabela geradora de dados (faker)
CREATE TEMPORARY TABLE generic_table (
  id INT,
  name STRING,
  birth_date DATE,
  score DOUBLE
) WITH (
  'connector' = 'faker',
  'number-of-rows' = '5000',
  'rows-per-second' = '1000',
  'fields.id.expression' = '#{number.number_between ''1'',''10000''}',
  'fields.name.expression' = '#{name.full_name}',
  'fields.birth_date.expression' = '#{date.birthday}',
  'fields.score.expression' = '#{number.random_double ''2'',''0'',''100''}'
);

-- Tabela Kafka
CREATE TEMPORARY TABLE kafka (
  id INT,
  name STRING,
  birth_date DATE,
  score DOUBLE
) WITH (
  'connector' = 'kafka',
  'topic' = 'topic_1135131',
  'properties.bootstrap.servers' = 'kafka:9092',
  'format' = 'json',
  'scan.startup.mode' = 'earliest-offset'
);

-- Tabela Postgres
CREATE TEMPORARY TABLE postgres (
  id INT,
  name STRING,
  birth_date DATE,
  score DOUBLE
) WITH (
  'connector' = 'jdbc',
  'url' = 'jdbc:postgresql://postgres:5432/postgres',
  'table-name' = 'dados_flink',
  'username' = 'postgres',
  'password' = 'postgres'
);

-- Inserções
INSERT INTO kafka SELECT * FROM generic_table;
INSERT INTO postgres SELECT * FROM kafka;
