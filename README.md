# 🏥 Sistema de Gerenciamento Hospitalar

Projeto acadêmico de Banco de Dados Relacional desenvolvido em **MySQL**, com foco no cadastro e gerenciamento de informações hospitalares.

O banco de dados contém informações de pacientes, médicos, quartos, internações, consultas e prescrições médicas, organizadas em seis tabelas relacionadas entre si.

---

## ⚙️ Tecnologias utilizadas

- **MySQL 8.0:** Gerenciamento do banco de dados.
- **SQL:** Criação, inserção, atualização e consulta de dados.
- **MySQL Workbench:** Desenvolvimento e administração do banco.
- **InnoDB:** Mecanismo de armazenamento utilizado para os relacionamentos e a integridade referencial.

---

## 🗂️ Estrutura do Banco de Dados

O banco de dados `hospital_db` é composto por seis tabelas:

- **pacientes:** Dados pessoais e informações dos convênios.
- **medicos:** Nome, CRM e especialidade dos médicos.
- **quartos:** Número, andar, tipo e situação dos quartos.
- **internacoes:** Registro das internações, pacientes, quartos e valores das diárias.
- **consultas:** Atendimentos médicos, datas, status e valores.
- **prescricoes:** Medicamentos, dosagens e quantidades prescritas.

<p align="center">
  <img width="703" alt="Modelagem do banco de dados hospitalar" src="https://github.com/user-attachments/assets/5ad4a94b-6235-4aa4-9447-e44e897d4a58" />
</p>

---

## 🚀 Como executar o projeto

### Pré-requisitos

- MySQL 8.0 ou superior.
- MySQL Workbench ou outra ferramenta compatível com MySQL.

### 1. Criar o banco de dados

Execute o comando:

```sql
CREATE DATABASE IF NOT EXISTS hospital_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

USE hospital_db;
```

### 2. Executar os arquivos SQL

Após criar o banco, execute os arquivos na seguinte ordem:

1. `hospital_db_pacientes.sql`
2. `hospital_db_medicos.sql`
3. `hospital_db_quartos.sql`
4. `hospital_db_internacoes.sql`
5. `hospital_db_consultas.sql`
6. `hospital_db_prescricoes.sql`

**No MySQL Workbench:**

1. Abra sua conexão com o MySQL.
2. Selecione o banco de dados `hospital_db`.
3. Acesse **File → Open SQL Script**.
4. Abra o primeiro arquivo SQL.
5. Execute o script pelo botão de raio.
6. Repita o processo com os demais arquivos, respeitando a ordem indicada.

**Atenção:** Os arquivos possuem comandos `DROP TABLE IF EXISTS` e inserções de dados. A execução novamente pode excluir registros existentes e recriar as tabelas.

### 3. Verificar a criação do banco

Após executar os arquivos, utilize:

```sql
USE hospital_db;

SHOW TABLES;
```

O resultado deverá apresentar as seis tabelas:

- pacientes
- medicos
- quartos
- internacoes
- consultas
- prescricoes

Para visualizar os registros:

```sql
SELECT * FROM pacientes;
SELECT * FROM medicos;
SELECT * FROM quartos;
SELECT * FROM internacoes;
SELECT * FROM consultas;
SELECT * FROM prescricoes;
```

---

## 📥 Inserção de Dados

Para testar o banco de dados, foram inseridos 60 registros, distribuídos igualmente entre as seis tabelas.

As inserções foram realizadas utilizando o comando `INSERT INTO`.

### 1. Pacientes

Cadastro de 10 pacientes, com informações pessoais e dados dos respectivos convênios.

```sql
USE hospital_db;

INSERT INTO pacientes (nome_paciente, cpf, data_nascimento, telefone_paciente, convenio) VALUES
('Ana Silva', '111.222.333-01', '1985-03-15', '(11) 98765-4321', 'Unimed'),
('Carlos Oliveira', '222.333.444-02', '1990-07-22', '(11) 97654-3210', 'Bradesco Saúde'),
('Maria Santos', '333.444.555-03', '1978-11-05', '(11) 96543-2109', 'Unimed'),
('João Pedro Silva', '444.555.666-04', '2000-01-30', '(11) 95432-1098', 'Particular'),
('Fernanda Costa', '555.666.777-05', '1995-09-12', '(11) 94321-0987', 'Amil'),
('Roberto Almeida', '666.777.888-06', '1962-04-18', '(11) 93210-9876', 'SulAmérica'),
('Juliana Oliveira', '777.888.999-07', '1988-12-08', '(11) 92109-8765', 'Unimed Pleno'),
('Lucas Souza', '888.999.000-08', '2003-05-25', '(11) 91098-7654', 'Particular'),
('Beatriz Lima', '999.000.111-09', '1973-08-02', '(11) 90987-6543', 'Bradesco Saúde'),
('Ricardo Pereira', '000.111.222-10', '1981-10-19', '(11) 98877-6655', 'Amil');
```

### 2. Médicos

Cadastro de 10 médicos, com seus números de CRM e especialidades.

```sql
INSERT INTO medicos (nome_medico, crm, especialidade) VALUES
('Dr. Marcos Andrade', 'CRM/SP 12345', 'Cardiologia'),
('Dra. Patricia Lima', 'CRM/SP 23456', 'Pediatria'),
('Dr. Roberto Silva', 'CRM/SP 34567', 'Cardiologia Pediatrica'),
('Dra. Camila Rocha', 'CRM/SP 45678', 'Cirurgia Geral'),
('Dr. Gustavo Santos', 'CRM/SP 56789', 'Ortopedia'),
('Dra. Vanessa Martins', 'CRM/SP 67890', 'Cirurgia Vascular'),
('Dr. Felipe Barbosa', 'CRM/SP 78901', 'Neurologia'),
('Dra. Renata Mello', 'CRM/SP 89012', 'Ginecologia'),
('Dr. Eduardo Ramos', 'CRM/SP 90123', 'Dermatologia'),
('Dra. Claudia Castro', 'CRM/SP 01234', 'Cirurgia Plastica');
```

### 3. Quartos

Cadastro de 10 quartos, com informações sobre localização, tipo de acomodação e disponibilidade.

```sql
INSERT INTO quartos (numero_quarto, andar, tipo_quarto, status_quarto) VALUES
(101, 1, 'UTI', 'Ocupado'),
(102, 1, 'Enfermaria', 'Livre'),
(201, 2, 'Apartamento', 'Ocupado'),
(202, 2, 'Apartamento', 'Livre'),
(301, 3, 'UTI', 'Ocupado'),
(302, 3, 'Enfermaria', 'Ocupado'),
(401, 4, 'Suíte VIP', 'Livre'),
(402, 4, 'Apartamento', 'Ocupado'),
(501, 5, 'UTI', 'Livre'),
(502, 5, 'Enfermaria', 'Ocupado');
```

### 4. Internações

Registro de 10 internações, relacionando os pacientes aos quartos por meio das chaves estrangeiras.

```sql
INSERT INTO internacoes (id_paciente, id_quarto, data_entrada, data_saida, valor_diaria) VALUES
(1, 1, '2026-02-10', '2026-02-20', 450.00),
(2, 3, '2026-03-01', '2026-03-10', 300.00),
(3, 5, '2026-04-15', '2026-04-25', 500.00),
(7, 6, '2026-05-01', '2026-05-08', 250.00),
(5, 8, '2026-06-10', '2026-06-18', 350.00),
(6, 10, '2026-07-01', '2026-07-10', 280.00),
(2, 1, '2026-08-05', '2026-08-12', 450.00),
(4, 2, '2026-01-15', '2026-01-22', 200.00),
(8, 4, '2026-02-20', '2026-02-28', 320.00),
(9, 7, '2026-03-12', '2026-03-19', 600.00);
```

### 5. Consultas

Registro de 10 consultas médicas, relacionando pacientes e médicos. Cada consulta possui data, horário, status e valor.

```sql
INSERT INTO consultas (id_paciente, id_medico, data_consulta, status_consulta, valor_consulta) VALUES
(1, 1, '2026-01-10 09:00:00', 'Realizada', 350.00),
(1, 4, '2026-02-05 14:00:00', 'Realizada', 500.00),
(2, 3, '2026-03-01 10:30:00', 'Realizada', 400.00),
(3, 2, '2026-03-15 11:00:00', 'Realizada', 280.00),
(4, 6, '2026-04-10 15:00:00', 'Realizada', 550.00),
(5, 5, '2026-05-02 08:30:00', 'Realizada', 320.00),
(6, 1, '2026-05-20 16:00:00', 'Realizada', 350.00),
(7, 10, '2026-06-01 13:00:00', 'Realizada', 600.00),
(8, 8, '2026-06-15 10:00:00', 'Realizada', 300.00),
(1, 4, '2026-07-01 14:00:00', 'Realizada', 500.00);
```

### 6. Prescrições

Cadastro de 10 prescrições médicas, vinculadas às consultas por meio da coluna `id_consulta`.

```sql
INSERT INTO prescricoes (id_consulta, medicamento, dosagem, quantidade) VALUES
(1, 'Dipirona 500mg', '1 comprimido de 6h/6h', 20),
(1, 'Amoxicilina 500mg', '1 capsula de 8h/8h', 21),
(2, 'Ibuprofeno 600mg', '1 comprimido de 12h/12h', 10),
(3, 'Paracetamol 750mg', '1 comprimido de 8h/8h', 15),
(4, 'Omeprazol 20mg', '1 capsula em jejum', 30),
(5, 'Cetanest', 'Aplicar via IV', 5),
(6, 'Dorflex', '1 comprimido se dor', 12),
(7, 'Atenolol 50mg', '1 comprimido ao dia', 30),
(8, 'Cefalexina 500mg', '1 capsula de 6h/6h', 28),
(10, 'Tramadol 50mg', '1 comprimido de 8h/8h', 10);
```

### Resumo dos registros

| Tabela | Registros |
|---|---:|
| Pacientes | 10 |
| Médicos | 10 |
| Quartos | 10 |
| Internações | 10 |
| Consultas | 10 |
| Prescrições | 10 |
| **Total** | **60** |

**Observação:** Os dados cadastrados são fictícios e utilizados exclusivamente para fins acadêmicos.

---

## 📊 Índices e Otimização

Foram definidos índices para facilitar consultas em campos utilizados com frequência.

| Índice | Tabela | Campo |
|---|---|---|
| idx_pacientes_nome | pacientes | nome_paciente |
| idx_medicos_especialidade | medicos | especialidade |
| idx_consultas_data | consultas | data_consulta |

O banco também utiliza índices relacionados às chaves primárias, chaves estrangeiras e restrições de unicidade.

---

## 📝 Consultas SQL

Foram desenvolvidas 10 consultas SQL para trabalhar com os dados cadastrados. Os exercícios envolvem filtros, relacionamentos entre tabelas e funções de agregação.

Entre os principais comandos utilizados estão:

- `SELECT`: Recuperação de dados.
- `WHERE`: Aplicação de filtros.
- `JOIN`: Relacionamento entre tabelas.
- `GROUP BY`: Agrupamento de registros.
- `ORDER BY`: Ordenação dos resultados.
- `COUNT()`: Contagem de registros.
- `SUM()`: Soma de valores.
- `AVG()`: Cálculo de médias.
- `HAVING`: Filtro aplicado aos agrupamentos.
- `LIKE`: Pesquisa por padrões de texto.

---

### 1. Faturamento Total de Consultas por Convênio

**Contextualização e Situação-Problema:** O setor financeiro precisa identificar o valor total arrecadado em consultas para os convênios que possuem "Saúde" no nome.

<img width="600" alt="Faturamento Total de Consultas por Convênio" src="https://github.com/user-attachments/assets/d32c352c-48d7-4067-aa84-c76313394f5e" />

---

### 2. Média do Valor de Consulta por Especialidade Médica

**Contextualização e Situação-Problema:** A coordenação clínica precisa consultar a média dos valores das consultas nas especialidades relacionadas à Cardiologia.

<img width="600" alt="Média do Valor de Consulta por Especialidade Médica" src="https://github.com/user-attachments/assets/7c031104-40d1-46d0-ab2d-fcc952a121f8" />

---

### 3. Valor Médio das Diárias por Tipo de Quarto

**Contextualização e Situação-Problema:** A gerência de infraestrutura precisa comparar o valor médio das diárias de internações em quartos do tipo "Apartamento" ou "UTI".

<img width="600" alt="Valor Médio das Diárias por Tipo de Quarto" src="https://github.com/user-attachments/assets/cf13e27e-a43a-42cd-bba8-a5a5b475d2eb" />

---

### 4. Total de Consultas Realizadas por Médico

**Contextualização e Situação-Problema:** A diretoria de atendimento precisa de um relatório com os médicos e a soma dos valores de suas consultas, considerando os status "Realizada" e "Finalizada".

<img width="600" alt="Total de Consultas Realizadas por Médico" src="https://github.com/user-attachments/assets/d6e13e2c-1760-4d82-abca-010aaa157c44" />

---

### 5. Soma de Diárias por Paciente com Sobrenome "Silva"

**Contextualização e Situação-Problema:** O setor de cobrança precisa calcular o valor acumulado das diárias de internação dos pacientes que possuem o sobrenome "Silva".

<img width="600" alt="Soma de Diárias por Paciente com Sobrenome Silva" src="https://github.com/user-attachments/assets/0fd69b5a-3a7f-4673-a54b-d281170ac7e3" />

---

### 6. Contagem de Prescrições por Status da Consulta

**Contextualização e Situação-Problema:** A farmácia hospitalar precisa contabilizar as prescrições de medicamentos que contenham "Dipirona" ou "Paracetamol", agrupando os resultados pelo status da consulta.

<img width="600" alt="Contagem de Prescrições por Status da Consulta" src="https://github.com/user-attachments/assets/d6509662-eb64-4831-9d9c-8577b32498d4" />

---

### 7. Média de Valor de Consultas por Convênio e Especialidade

**Contextualização e Situação-Problema:** A auditoria hospitalar precisa calcular a média dos valores das consultas por especialidade médica, considerando os convênios que possuem "Unimed" no nome.

<img width="600" alt="Média de Valor de Consultas por Convênio e Especialidade" src="https://github.com/user-attachments/assets/3f71aa9f-a3fc-4e53-8e3c-2f0a8a3bf355" />

---

### 8. Média de Diária de Internação por Convênio em Quartos de UTI

**Contextualização e Situação-Problema:** A regulação hospitalar precisa calcular a média dos valores das diárias por convênio, considerando apenas as internações em quartos classificados como "UTI".

<img width="600" alt="Média de Diária de Internação por Convênio em Quartos de UTI" src="https://github.com/user-attachments/assets/2a531142-90b0-4a9c-80d5-1e5a26845bde" />

---

### 9. Medicamentos Prescritos por Médico em Consultas Realizadas

**Contextualização e Situação-Problema:** A comissão de farmácia e terapêutica precisa consultar a quantidade de itens prescritos por médico nas consultas com status "Realizada".

<img width="600" alt="Medicamentos Prescritos por Médico em Consultas Realizadas" src="https://github.com/user-attachments/assets/0f1ee5f6-3074-4c7b-ba49-4ffac97306eb" />

---

### 10. Valor Total e Média de Consultas por Paciente

**Contextualização e Situação-Problema:** O setor de atendimento precisa consultar a soma e a média dos valores gastos em consultas por pacientes cujos nomes começam com a letra "M".

<img width="600" alt="Valor Total e Média de Consultas por Paciente" src="https://github.com/user-attachments/assets/a3c6dd3d-6e9e-4e83-b27d-06756487c1bc" />

---

## 👨‍💻 Autor

Projeto desenvolvido como atividade acadêmica de Banco de Dados.

**Autor:** Felipe Lisboa Carvalho

---

## 📚 Objetivo Educacional

O projeto foi desenvolvido para aplicar os seguintes conceitos de Banco de Dados Relacionais:

- Criação e estruturação de tabelas.
- Definição de chaves primárias e estrangeiras.
- Relacionamentos e cardinalidade.
- Inserção e manipulação de dados.
- Desenvolvimento de consultas SQL.
- Utilização de funções de agregação.
- Aplicação de filtros e agrupamentos.

**Projeto desenvolvido para fins educacionais.** Os dados utilizados são fictícios e destinados exclusivamente a testes e demonstrações.
