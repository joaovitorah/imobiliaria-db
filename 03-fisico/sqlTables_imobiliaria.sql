CREATE TABLE proprietario (
    id_proprietario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf_cnpj VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150)
) ENGINE=InnoDB;

CREATE TABLE empreendimento (
    id_empreendimento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    construtora VARCHAR(150),
    endereco VARCHAR(200),
    status VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150),
    tipo_cliente VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE corretor (
    id_corretor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    creci VARCHAR(20) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150),
    status VARCHAR(50)
) ENGINE=InnoDB;


CREATE TABLE imovel (
    id_imovel INT AUTO_INCREMENT PRIMARY KEY,
    tipo_imovel VARCHAR(100) NOT NULL,
    descricao TEXT,
    endereco VARCHAR(200),
    area_m2 DECIMAL(10,2),
    valor DECIMAL(12,2),
    status VARCHAR(50),
    id_proprietario INT NOT NULL,
    id_empreendimento INT,
    FOREIGN KEY (id_proprietario) REFERENCES proprietario(id_proprietario)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_empreendimento) REFERENCES empreendimento(id_empreendimento)
        ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE visita (
    id_visita INT AUTO_INCREMENT PRIMARY KEY,
    data_visita DATE NOT NULL,
    horario TIME,
    observacoes TEXT,
    id_cliente INT NOT NULL,
    id_corretor INT NOT NULL,
    id_imovel INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_corretor) REFERENCES corretor(id_corretor)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_imovel) REFERENCES imovel(id_imovel)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    tipo_contrato VARCHAR(50),
    data_inicio DATE NOT NULL,
    data_fim DATE,
    valor_final DECIMAL(12,2),
    id_cliente INT NOT NULL,
    id_corretor INT NOT NULL,
    id_imovel INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_corretor) REFERENCES corretor(id_corretor)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_imovel) REFERENCES imovel(id_imovel)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;