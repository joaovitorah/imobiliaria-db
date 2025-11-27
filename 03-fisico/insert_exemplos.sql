/* ==========================================================
   INSERT DE DADOS EXEMPLO PARA SISTEMA IMOBILIÁRIO
   Autor: João Vitor Azevedo Henriques
   Projeto: Modelagem Conceitual, Lógica e Física
   Arquivo: insert_exemplos.sql
   ========================================================== */

INSERT INTO Proprietario (id_proprietario, nome, cpf_cnpj, telefone, email)
VALUES
(1, 'Maria de Lourdes Ribeiro', '12345678000190', '22999887766', 'maria.ribeiro@mail.com'),
(2, 'João Marcos Pereira', '98765432100', '22988776655', 'joao.pereira@mail.com');


INSERT INTO Empreendimento (id_empreendimento, nome, construtora, endereco, status)
VALUES
(1, 'Residencial Primavera', 'Construtora Alfa', 'Rua das Acácias, 100', 'Lançado'),
(2, 'Condomínio Bela Vista', 'Construtora Horizonte', 'Av. Central, 500', 'Em Obras');


INSERT INTO Imovel (id_imovel, tipo_imovel, descricao, endereco, area_m2, valor, status, id_proprietario, id_empreendimento)
VALUES
(1, 'Apartamento', '2 quartos, 1 suíte, vaga de garagem', 'Rua das Acácias, 110', 65, 280000, 'Disponível', 1, 1),
(2, 'Casa', '3 quartos, quintal amplo e garagem para 2 carros', 'Av. Central, 520', 120, 450000, 'Disponível', 2, 2),
(3, 'Apartamento', '1 quarto, ideal para estudante', 'Rua das Acácias, 115', 42, 190000, 'Disponível', 1, 1);


INSERT INTO Cliente (id_cliente, nome, cpf, telefone, email, tipo_cliente)
VALUES
(1, 'Carlos Pereira', '11122233344', '22977776666', 'carlos.p@mail.com', 'Comprador'),
(2, 'Ana Lima', '55566677788', '22966665555', 'ana.lima@mail.com', 'Locatário'),
(3, 'Fernanda Dias', '99988877766', '22955554444', 'fernanda.d@mail.com', 'Comprador');



INSERT INTO Corretor (id_corretor, nome, creci, telefone, email, status)
VALUES
(1, 'Roberto Torres', 'RJ12345', '22955553333', 'roberto.torres@mail.com', 'Ativo'),
(2, 'Juliana Costa', 'RJ54321', '22944442222', 'juliana.costa@mail.com', 'Ativo'),
(3, 'Marcelo Andrade', 'RJ78901', '22933331111', 'marcelo.andrade@mail.com', 'Inativo');


INSERT INTO Visita (id_visita, data_visita, horario, observacoes, id_cliente, id_corretor, id_imovel)
VALUES
(1, '2025-01-20', '14:00', 'Cliente interessado. Solicitou simulação.', 1, 1, 1),
(2, '2025-01-22', '10:00', 'Achou o valor acima do esperado.', 2, 2, 2),
(3, '2025-01-25', '16:00', 'Cliente gostou muito. Possível fechamento.', 3, 1, 3);


INSERT INTO Contrato (id_contrato, tipo_contrato, data_inicio, data_fim, valor_final, id_cliente, id_corretor, id_imovel)
VALUES
(1, 'Compra', '2025-02-05', NULL, 275000, 1, 1, 1),
(2, 'Locação', '2025-03-01', '2026-03-01', 1800, 2, 2, 2);
