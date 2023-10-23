-- MySQL Workbench Forward Engineering

DROP DATABASE IF EXISTS;

CREATE database IF NOT EXISTS `mydb` ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table -- -----------------------------------------------------
CREATE TABLE 'USUARIOS' IF NOT EXISTS (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `senha` VARCHAR(45) NOT NULL,
  `nivel_de_acesso` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario`))

;


-- -----------------------------------------------------
-- Table `mydb`.`Hospedes`
-- -----------------------------------------------------
CREATE TABLE 'HOSPEDES' IF NOT EXISTS (
  `Hospede_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `data_nasc` DATE NOT NULL,
  `CPF` BIGINT(11) NOT NULL,
  `Nacionalidade` VARCHAR(45) NOT NULL,
  `Pronome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`Hospede_id`, `id_usuario`),
 
  CONSTRAINT `fk_Hospedes_Usuários1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES (`id_usuario`)
    )
;


-- -----------------------------------------------------
-- Table `mydb`.`servicos`
-- -----------------------------------------------------
CREATE TABLE 'SERVICOS' IF NOT EXISTS  (
  `id_servicos` INT NOT NULL AUTO_INCREMENT,
  `preco_servico` FLOAT NOT NULL,
  `nome_servico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_servicos`))
;


-- -----------------------------------------------------
-- Table `mydb`.`Hospedagens`
-- -----------------------------------------------------
CREATE TABLE 'HOSPEDAGENS' IF NOT EXISTS  (
  `Hospedagens_id` INT NOT NULL AUTO_INCREMENT,
  `chekin` DATE NOT NULL,
  `checkout` DATE NOT NULL,
  PRIMARY KEY (`Hospedagens_id`))
;


-- -----------------------------------------------------
-- Table `mydb`.`Quartos`
-- -----------------------------------------------------
CREATE TABLE 'QUARTOS' IF NOT EXISTS  (
  `id_Quartos` INT NOT NULL AUTO_INCREMENT,
  `max_pessoas` INT NOT NULL,
  `manutencao` VARCHAR(45) NOT NULL,
  `tipo_cama` VARCHAR(45) NOT NULL,
  `frigobar` TINYINT NOT NULL,
  `ar_condicionado` TINYINT NOT NULL,
  `banheira` TINYINT NOT NULL,
  `tv` TINYINT NOT NULL,
  `preco_quarto_dia` FLOAT NOT NULL,
  PRIMARY KEY (`id_Quartos`))
;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionarios`
-- -----------------------------------------------------
CREATE TABLE 'FUNCIONARIOS' IF NOT EXISTS  (
  `funcionario_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  `salario` FLOAT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`funcionario_id`, `id_usuario`),
  CONSTRAINT `fk_Funcionarios_Usuários1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES (`id_usuario`)
    )
;


-- -----------------------------------------------------
-- Table `mydb`.`Atividades`
-- -----------------------------------------------------
CREATE TABLE 'ATIVIDADES' IF NOT EXISTS  (
  `id_atividade` INT NOT NULL AUTO_INCREMENT,
  `horario` VARCHAR(45) NOT NULL,
  `horario_fim` VARCHAR(45) NOT NULL,
  `funcionario_id` INT NOT NULL,
  `restricao_idade` INT NOT NULL,
  `nome_atividade` VARCHAR(45) NOT NULL,
  `data` DATE NOT NULL,
  `funcionario_id` INT NOT NULL,
  PRIMARY KEY (`id_atividade`, `funcionario_id`),

  CONSTRAINT `fk_Atividades_Funcionarios1`
    FOREIGN KEY (`funcionario_id`)
    REFERENCES `mydb`.`Funcionarios` (`funcionario_id`)
   )
;


-- -----------------------------------------------------
-- Table `mydb`.`servicos_consumidos`
-- -----------------------------------------------------
CREATE TABLE 'SERVICOS_CONSUMIDOS' IF NOT EXISTS (
  `id_servicos_consumidos` INT NOT NULL AUTO_INCREMENT,
  `id_hospede` INT NOT NULL,
  `id_serviço` INT NOT NULL,
  `id_hospedagens` INT NOT NULL,
  PRIMARY KEY (`id_servicos_consumidos`, `id_hospede`, `id_serviço`, `id_hospedagens`),

  CONSTRAINT `fk_Hospedes_has_servicos_Hospedes1`
    FOREIGN KEY (`id_hospede`)
    REFERENCES `mydb`.`Hospedes` (`Hospede_id`)
   ,
  CONSTRAINT `fk_Hospedes_has_servicos_servicos1`
    FOREIGN KEY (`id_serviço`)
    REFERENCES `mydb`.`servicos` (`id_servicos`)
    ,
  CONSTRAINT `fk_Hospedes_has_serv`
    FOREIGN KEY (`id_hospedagens`)
    REFERENCES `mydb`.`Hospedagens` (`Hospedagens_id`)
    )
;


-- -----------------------------------------------------
-- Table `mydb`.`Hospedagens_quartos`
-- -----------------------------------------------------
CREATE TABLE 'HOSPEDAGENS_QUARTOS' IF NOT EXISTS  (
  `id_Hospedagem_quartos` INT NOT NULL AUTO_INCREMENT,
  `id_Quartos` INT NOT NULL,
  `Hospedagens_id` INT NOT NULL,
  `id_Hospede` INT NOT NULL,
  PRIMARY KEY (`id_Hospedagem_quartos`, `id_Quartos`, `Hospedagens_id`, `id_Hospede`),

  CONSTRAINT `fk_Hospedagens_has_Quartos_Quartos1`
    FOREIGN KEY (`id_Quartos`)
    REFERENCES `mydb`.`Quartos` (`id_Quartos`)
   ,
  CONSTRAINT `fk_Hospedagens_quartos_Hospedagens1`
    FOREIGN KEY (`Hospedagens_id`)
    REFERENCES `mydb`.`Hospedagens` (`Hospedagens_id`)
    ,
  CONSTRAINT `fk_Hospedagens_quartos_Hospedes1`
    FOREIGN KEY (`id_Hospede`)
    REFERENCES `mydb`.`Hospedes` (`id_usuario`)
    )
;


-- -----------------------------------------------------
-- Table `mydb`.`Atividades_hospede`
-- -----------------------------------------------------
CREATE TABLE 'ATIVIDADES_HOSPEDE' IF NOT EXISTS  (
  `id_hospede_atividade` INT NOT NULL AUTO_INCREMENT,
  `Hospede_id` INT NOT NULL,
  `id_atividade` INT NOT NULL,
  PRIMARY KEY (`id_hospede_atividade`, `Hospede_id`, `id_atividade`),

  CONSTRAINT `fk_Hospedes_has_Atividades_Hospedes1`
    FOREIGN KEY (`Hospede_id`)
    REFERENCES `mydb`.`Hospedes` (`Hospede_id`)
    ,
  CONSTRAINT `fk_Hospedes_has_Atividades_Atividades1`
    FOREIGN KEY (`id_atividade`)
    REFERENCES `mydb`.`Atividades` (`id_atividade`)
    )
;

/*Tabela Usuarios*/

insert into USUARIOS ( senha, nivel_de_acesso, login)
values ("M@iones3", 0,"MAZDARX7" ),
("eido", 0,"Cralos Ícaro" ),
("Geromel", 1,"Andrei" ),
("macaco", 0,"MicoMeu" ),
("blaze", 1,"FelipeNeto" ),
("Azul", 1,"Smurfette" ),
("Gorro", 1,"PapaSmurf" ),
("Azar", 0,"Desastrado" ),
("Bobo", 1,"Joca" ),
("Forte", 0,"Robusto" ),
("Ruiva", 1,"Sassette" ),
("Burro", 1,"Gênio" ),
("Feliz", 0,"Ranzinza" ),
("Horrível", 1,"Habilidoso" ),
("Bonitão", 0,"Vaidoso" ),
("Véio", 0,"VovôSmurf" ),
("Bonzinho", 1,"DevilSmurf" ),
("Bom", 0,"Tuffy" ),
("Rastreio", 1,"Caçador" ),
("Véia", 1,"VovóSmurf" ),
("AgroBoy", 1,"Fazendeiro" ),
("Pedreiro", 1,"TimberSmurf" ),
("BadBoy", 0,"AngelSmurf" ),
("Woolly", 1,"WoolySmurf" );
 
 /*Tabela Hóspedes*/
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Stacee', 'Glisenan', '01-09-1986', 60733218277, 'Uganda', 'Genderfluid', 'sglisenan0@mail.ru');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Elisa', 'Volette', '06-11-1984', 75142501376, 'Peru', 'Female', 'evolette1@stanford.edu');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Maxwell', 'Haycraft', '16-02-1977', 31614968640, 'Brazil', 'Male', 'mhaycraft2@wikispaces.com');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Gussy', 'Fries', '26-10-2003', 39541520114, 'China', 'Female', 'gfries3@stumbleupon.com');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Duff', 'Mungham', '21-09-2023', 80509776425, 'Philippines', 'Male', 'dmungham4@histats.com');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Kristo', 'Honnan', '21-02-2019', 63601549306, 'Mongolia', 'Male', 'khonnan5@ovh.net');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Teodoor', 'Skeels', '23-05-2008', 42138161925, 'Sweden', 'Male', 'tskeels6@themeforest.net');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Malachi', 'Barnewille', '14-04-1999', 42755982555, 'France', 'Male', 'mbarnewille7@newyorker.com');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Wallis', 'Bree', '15-12-1990', 63606874913, 'Norway', 'Female', 'wbree8@instagram.com');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Marius', 'Bratton', '31-10-1994', 29858326213, 'Brazil', 'Male', 'mbratton9@mashable.com');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Obadiah', 'Aylesbury', '14-04-2017', 12934643418, 'China', 'Male', 'oaylesburya@europa.eu');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Wright', 'Alkin', '19-09-1980', 94973566802, 'Yemen', 'Male', 'walkinb@surveymonkey.com');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Rikki', 'Youson', '10-06-1994', 83340713218, 'Thailand', 'Male', 'ryousonc@vk.com');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Benedicto', 'Hodgin', '16-12-1970', 19839714567, 'Iran', 'Male', 'bhodgind@photobucket.com');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Lennie', 'Lembrick', '23-06-1975', 88247607206, 'Pakistan', 'Male', 'llembricke@un.org');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Eachelle', 'Gonoude', '26-09-1998', 68586216347, 'China', 'Female', 'egonoudef@is.gd');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Freddie', 'Millott', '22-06-2012', 36367897999, 'Greece', 'Female', 'fmillottg@xing.com');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Had', 'Babar', '13-08-2015', 26918828156, 'Russia', 'Male', 'hbabarh@addtoany.com');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Amanda', 'Harbach', '08-10-1979', 70071628332, 'United States', 'Female', 'aharbachi@google.fr');
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email) values ('Lurlene', 'Crampsy', '08-01-1966', 48039871227, 'Bosnia and Herzegovina', 'Female', 'lcrampsyj@tiny.cc');
