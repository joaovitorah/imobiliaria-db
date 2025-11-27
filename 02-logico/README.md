# Modelo Lógico — Sistema de Imobiliária

Este documento apresenta a estrutura lógica do banco de dados, descrevendo as tabelas, chaves primárias, chaves estrangeiras e cardinalidades entre as entidades.

## 📌 Tabelas e Atributos

### **1. IMOVEL**
- **id_imovel** (PK)
- tipo_imovel
- descricao
- endereco
- area_m2
- valor
- status
- **id_proprietario** (FK → PROPRIETARIO.id_proprietario)
- **id_empreendimento** (FK → EMPREENDIMENTO.id_empreendimento)

### **2. PROPRIETARIO**
- **id_proprietario** (PK)
- nome
- cpf_cnpj
- telefone
- email

### **3. CLIENTE**
- **id_cliente** (PK)
- nome
- cpf
- telefone
- email
- tipo_cliente

### **4. CORRETOR**
- **id_corretor** (PK)
- nome
- creci
- telefone
- email
- status

### **5. VISITA**
- **id_visita** (PK)
- data_visita
- horario
- observacoes
- **id_cliente** (FK → CLIENTE.id_cliente)
- **id_corretor** (FK → CORRETOR.id_corretor)
- **id_imovel** (FK → IMOVEL.id_imovel)

### **6. CONTRATO**
- **id_contrato** (PK)
- tipo_contrato
- data_inicio
- data_fim
- valor_final
- **id_cliente** (FK → CLIENTE.id_cliente)
- **id_corretor** (FK → CORRETOR.id_corretor)
- **id_imovel** (FK → IMOVEL.id_imovel)

### **7. EMPREENDIMENTO**
- **id_empreendimento** (PK)
- nome
- construtora
- endereco
- status

---

## 🔑 **Chaves Primárias (PK)**

| Tabela          | PK               |
|------------------|------------------|
| IMOVEL           | id_imovel        |
| PROPRIETARIO     | id_proprietario  |
| CLIENTE          | id_cliente       |
| CORRETOR         | id_corretor      |
| VISITA           | id_visita        |
| CONTRATO         | id_contrato      |
| EMPREENDIMENTO   | id_empreendimento|

---

## 🔗 **Chaves Estrangeiras (FK)**

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

## 🔄 **Cardinalidade Final entre as Entidades**

### **PROPRIETARIO 1:N IMOVEL**
- Um proprietário pode ter vários imóveis.
- Cada imóvel possui apenas um proprietário.

### **EMPREENDIMENTO 1:N IMOVEL**
- Um empreendimento pode ter vários imóveis.
- Cada imóvel pertence a apenas um empreendimento.

### **CLIENTE 1:N VISITA**
- Um cliente pode realizar várias visitas.
- Cada visita pertence a um único cliente.

### **CORRETOR 1:N VISITA**
- Um corretor pode acompanhar várias visitas.
- Cada visita tem apenas um corretor.

### **IMOVEL 1:N VISITA**
- Um imóvel pode receber várias visitas.
- Cada visita refere-se a apenas um imóvel.

### **CLIENTE 1:N CONTRATO**
- Um cliente pode firmar vários contratos.
- Um contrato pertence a um único cliente.

### **CORRETOR 1:N CONTRATO**
- Um corretor pode fechar vários contratos.
- Um contrato é fechado por apenas um corretor.

### **IMOVEL 1:N CONTRATO**
- Um imóvel pode ser contratado várias vezes (ex.: renovações).
- Cada contrato envolve apenas um imóvel específico.

---

## 📘 Observações Finais

O modelo lógico foi projetado para comportar:
- comercialização e locação de imóveis  
- agenda de visitas  
- controle de proprietários  
- registro de corretores  
- contratos com clientes  

Ele está pronto para implementação física no MySQL ( já desenvolvido no **modelo físico** ).
