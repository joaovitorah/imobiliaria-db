Sistema de Gerenciamento Imobiliário

Este repositório contém a modelagem completa de um sistema para gestão de imóveis, proprietários, clientes, corretores, visitas, contratos e empreendimentos.  
Inclui **modelo conceitual (DER BR Modelo)**, **modelo lógico**, **modelo físico (MySQL Workbench)** e **scripts SQL** para criação e inserção de dados de exemplo.

---

## Mini Mundo

A imobiliária administra **imóveis**, **proprietários**, **clientes**, **corretores**, **visitas** e **contratos**.  

- Os **imóveis** podem pertencer a proprietários (PF ou PJ) e podem estar vinculados a **empreendimentos** (como condomínios ou lançamentos de construtoras).  
- **Clientes** buscam a imobiliária para **alugar** ou **comprar** imóveis, sendo atendidos por **corretores** que registram as visitas.  
- Cada **visita** possui data, horário e observações sobre o interesse do cliente.  
- Quando a negociação avança, é gerado um **contrato** (compra ou locação), envolvendo um **cliente**, um **corretor** e um **imóvel**.  
- **Empreendimentos** podem ter vários imóveis associados.  

O sistema permite o cadastro completo e mantém o histórico de visitas e contratos, garantindo integridade referencial.

---

## Regras de Negócio

1. Cada imóvel deve possuir exatamente **um proprietário**.  
2. Um imóvel pode estar vinculado ou não a **um empreendimento**.  
3. Cada visita deve envolver obrigatoriamente: **cliente, corretor e imóvel**.  
4. Um cliente pode realizar várias visitas; cada visita é única em data e horário.  
5. Um corretor pode acompanhar várias visitas.  
6. Um imóvel pode receber várias visitas.  
7. Um contrato só pode existir se houver **cliente, corretor e imóvel** vinculados.  
8. Cada contrato se refere a exatamente **um imóvel**.  
9. Um cliente pode ter vários contratos, mas somente **um contrato ativo por imóvel**.  
10. O valor final do contrato deve sempre ser informado.  
11. O status do imóvel pode ser: Disponível, Vendido, Alugado ou Indisponível.  
12. Corretores possuem status (Ativo/Inativo); inativos não podem registrar visitas ou contratos.  
13. Clientes possuem tipos diferentes (Comprador / Locatário).  
14. Todos os dados devem manter integridade referencial.

---

## Modelo Conceitual (DER)

| Entidade       | Atributos (PK / FK) |
|----------------|--------------------|
| IMOVEL         | PK id_imovel; tipo_imovel; descricao; endereco; area_m2; valor; status; FK id_proprietario; FK id_empreendimento |
| PROPRIETARIO   | PK id_proprietario; nome; cpf_cnpj; telefone; email |
| CLIENTE        | PK id_cliente; nome; cpf; telefone; email; tipo_cliente |
| CORRETOR       | PK id_corretor; nome; creci; telefone; email; status |
| VISITA         | PK id_visita; data_visita; horario; observacoes; FK id_cliente; FK id_corretor; FK id_imovel |
| CONTRATO       | PK id_contrato; tipo_contrato; data_inicio; data_fim; valor_final; FK id_cliente; FK id_corretor; FK id_imovel |
| EMPREENDIMENTO | PK id_empreendimento; nome; construtora; endereco; status |

---

## Chaves Primárias (PK)

- IMOVEL: id_imovel  
- PROPRIETARIO: id_proprietario  
- CLIENTE: id_cliente  
- CORRETOR: id_corretor  
- VISITA: id_visita  
- CONTRATO: id_contrato  
- EMPREENDIMENTO: id_empreendimento  

---

## Chaves Estrangeiras (FK)

| Tabela        | FK                         | Referência                         |
|---------------|----------------------------|-------------------------------------|
| IMOVEL        | id_proprietario            | PROPRIETARIO.id_proprietario        |
| IMOVEL        | id_empreendimento          | EMPREENDIMENTO.id_empreendimento    |
| VISITA        | id_cliente                 | CLIENTE.id_cliente                  |
| VISITA        | id_corretor                | CORRETOR.id_corretor                |
| VISITA        | id_imovel                  | IMOVEL.id_imovel                    |
| CONTRATO      | id_cliente                 | CLIENTE.id_cliente                  |
| CONTRATO      | id_corretor                | CORRETOR.id_corretor                |
| CONTRATO      | id_imovel                  | IMOVEL.id_imovel                    |

---

## Cardinalidades

- **PROPRIETARIO 1:N IMOVEL**  
- **EMPREENDIMENTO 1:N IMOVEL**  
- **CLIENTE 1:N VISITA**  
- **CORRETOR 1:N VISITA**  
- **IMOVEL 1:N VISITA**  
- **CLIENTE 1:N CONTRATO**  
- **CORRETOR 1:N CONTRATO**  
- **IMOVEL 1:N CONTRATO**

---

## Scripts SQL

- **create_tables.sql** → Criação de tabelas e constraints  
- **insert_exemplos.sql** → Dados de exemplo para testes  

---

## Estrutura do Repositório


## Observações
- O modelo está pronto para implementação no MySQL.  
- Garantia de integridade referencial entre todas as entidades.  
- Suporte a consultas, relatórios e análises de imóveis, visitas e contratos.
