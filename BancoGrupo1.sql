-- MySQL Workbench Forward Engineering

DROP DATABASE IF EXISTS `mydb`;

CREATE database IF NOT EXISTS `mydb` ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `USUARIOS`(
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `senha` VARCHAR(45) NOT NULL,
  `nivel_de_acesso` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario`));

-- -----------------------------------------------------
-- Table `mydb`.`Hospedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOSPEDES`(
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
    REFERENCES `mydb`.`Usuarios`(`id_usuario`)
    )
;


-- -----------------------------------------------------
-- Table `mydb`.`servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS  `SERVICOS` (
  `id_servicos` INT NOT NULL AUTO_INCREMENT,
  `preco_servico` FLOAT NOT NULL,
  `nome_servico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_servicos`))
;


-- -----------------------------------------------------
-- Table `mydb`.`Hospedagens`
-- -----------------------------------------------------
CREATE TABLE  IF NOT EXISTS `HOSPEDAGENS` (
  `Hospedagens_id` INT NOT NULL AUTO_INCREMENT,
  `chekin` DATE NOT NULL,
  `checkout` DATE NOT NULL,
  PRIMARY KEY (`Hospedagens_id`))
;


-- -----------------------------------------------------
-- Table `mydb`.`Quartos`
-- -----------------------------------------------------
CREATE TABLE  IF NOT EXISTS `QUARTOS` (
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
CREATE TABLE  IF NOT EXISTS `FUNCIONARIOS` (
  `funcionario_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  `salario` FLOAT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`funcionario_id`, `id_usuario`),
  CONSTRAINT `fk_Funcionarios_Usuários1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mydb`.`Usuarios`(`id_usuario`)
    )
;


-- -----------------------------------------------------
-- Table `mydb`.`Atividades`
-- -----------------------------------------------------
CREATE TABLE  IF NOT EXISTS `ATIVIDADES` (
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
CREATE TABLE  IF NOT EXISTS `SERVICOS_CONSUMIDOS`(
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
CREATE TABLE  IF NOT EXISTS `HOSPEDAGENS_QUARTOS` (
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
CREATE TABLE  IF NOT EXISTS `ATIVIDADES_HOSPEDE` (
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
("macaco", 0,"Mico" ),
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
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Stacee', 'Glisenan', '01-09-1986', 60733218277, 'Uganda', 'Genderfluid', 'sglisenan0@mail.ru',1);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Elisa', 'Volette', '06-11-1984', 75142501376, 'Peru', 'Female', 'evolette1@stanford.edu',2);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Maxwell', 'Haycraft', '16-02-1977', 31614968640, 'Brazil', 'Male', 'mhaycraft2@wikispaces.com',3);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Gussy', 'Fries', '26-10-2003', 39541520114, 'China', 'Female', 'gfries3@stumbleupon.com',4);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Duff', 'Mungham', '21-09-2023', 80509776425, 'Philippines', 'Male', 'dmungham4@histats.com',5);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Kristo', 'Honnan', '21-02-2019', 63601549306, 'Mongolia', 'Male', 'khonnan5@ovh.net',6);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Teodoor', 'Skeels', '23-05-2008', 42138161925, 'Sweden', 'Male', 'tskeels6@themeforest.net',7);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Malachi', 'Barnewille', '14-04-1999', 42755982555, 'France', 'Male', 'mbarnewille7@newyorker.com',8);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Wallis', 'Bree', '15-12-1990', 63606874913, 'Norway', 'Female', 'wbree8@instagram.com',9);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Marius', 'Bratton', '31-10-1994', 29858326213, 'Brazil', 'Male', 'mbratton9@mashable.com',10);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Obadiah', 'Aylesbury', '14-04-2017', 12934643418, 'China', 'Male', 'oaylesburya@europa.eu',11);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Wright', 'Alkin', '19-09-1980', 94973566802, 'Yemen', 'Male', 'walkinb@surveymonkey.com',12);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Rikki', 'Youson', '10-06-1994', 83340713218, 'Thailand', 'Male', 'ryousonc@vk.com',13);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Benedicto', 'Hodgin', '16-12-1970', 19839714567, 'Iran', 'Male', 'bhodgind@photobucket.com',14);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Lennie', 'Lembrick', '23-06-1975', 88247607206, 'Pakistan', 'Male', 'llembricke@un.org',15);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Eachelle', 'Gonoude', '26-09-1998', 68586216347, 'China', 'Female', 'egonoudef@is.gd',16);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Freddie', 'Millott', '22-06-2012', 36367897999, 'Greece', 'Female', 'fmillottg@xing.com',17);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Had', 'Babar', '13-08-2015', 26918828156, 'Russia', 'Male', 'hbabarh@addtoany.com',18);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Amanda', 'Harbach', '08-10-1979', 70071628332, 'United States', 'Female', 'aharbachi@google.fr',19);
insert into Hospedes (nome, sobrenome, data_nasc, CPF, Nacionalidade, Pronome, email,id_usuario) values ('Lurlene', 'Crampsy', '08-01-1966', 48039871227, 'Bosnia and Herzegovina', 'Female', 'lcrampsyj@tiny.cc',20);

/*Tabela funcionarios*/

insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Gerry', 'Delucia', 'Camareiro', '$9526.14');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Editha', 'Stede', 'Zeladora', '$9016.38');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Agosto', 'Franchyonok', 'Zelador', '$7291.94');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Giselbert', 'Duthy', 'Faxineira', '$5890.71');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('L;urette', 'Smalridge', 'camareira', '$6530.11');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Kym', 'Wakerley', 'Zeladora', '$1477.57');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Aymer', 'Tunbridge', 'Recepcionista', '$5917.57');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Lindie', 'Kaygill', 'Jardineira', '$8184.42');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Suzi', 'Rickarsey', 'Jardineira Specialist IV', '$4905.58');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Jonell', 'Devine', 'Garçom', '$2276.33');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Mae', 'McNess', 'Garçom', '$9164.21');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Moishe', 'McCrea', 'Secretário', '$6212.93');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Winny', 'Butterworth', 'Secretário', '$2643.54');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Wynn', 'MacAllester', 'Gerente', '$9734.61');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Charmaine', 'Chilcott', 'camareira', '$3291.06');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Hortense', 'Dwyr', 'Diarista', '$7856.25');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Chadwick', 'Ewen', 'Faxineiro', '$7086.47');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Tally', 'Liffe', 'Diarista', '$5948.04');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Letisha', 'Huggon', 'Diarista', '$9692.93');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Mose', 'Jozwicki', 'Diarista', '$2530.39');

/*Tabela Quartos*/

insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (27, 1, 'Casal', 1, 0, 1, 0, 927.53);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (43, 0, 'Casal', 0, 0, 0, 1, 387.28);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (28, 0, 'Casal', 1, 0, 0, 1, 733.04);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (44, 0, 'Casal', 0, 1, 0, 0, 1593.7);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (41, 1, 'Casal', 0, 0, 0, 1, 576.8);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (29, 0, 'Casal', 1, 1, 0, 1, 773.33);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (15, 1, 'Casal', 0, 0, 1, 1, 1478.15);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (15, 1, 'Casal', 0, 1, 1, 0, 765.21);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (21, 1, 'Casal', 1, 0, 0, 0, 735.41);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (21, 0, 'Casal', 1, 1, 1, 1, 508.69);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (33, 1, 'Solteiro', 1, 1, 1, 0, 1963.8);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (22, 0, 'Solteiro', 0, 0, 0, 1, 1298.17);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (41, 0, 'Solteiro', 0, 0, 0, 1, 1673.81);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (30, 1, 'Solteiro', 0, 0, 1, 1, 633.46);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (39, 1, 'Solteiro', 0, 0, 1, 1, 449.5);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (17, 0, 'Solteiro', 0, 0, 0, 1, 1547.8);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (42, 1, 'Solteiro', 0, 1, 0, 1, 459.85);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (17, 0, 'Solteiro', 1, 0, 0, 0, 1102.29);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (27, 0, 'Solteiro', 0, 0, 0, 1, 1484.32);
insert into Quartos (max_pessoas, manutencao, tipo_cama, frigobar, ar_condicionado, banheira, tv, preco_quarto_dia) values (47, 0, 'Solteiro', 0, 0, 0, 1, 1907.04);

/*Tabela hospedagens*/

insert into Hospedagens (checkin, checkout) values ('7/28/2023', '10/29/2023');
insert into Hospedagens (checkin, checkout) values ('11/29/2022', '5/27/2023');
insert into Hospedagens (checkin, checkout) values ('8/8/2023', '6/28/2023');
insert into Hospedagens (checkin, checkout) values ('6/4/2022', '4/23/2023');
insert into Hospedagens (checkin, checkout) values ('6/30/2023', '11/18/2023');
insert into Hospedagens (checkin, checkout) values ('11/6/2022', '6/1/2023');
insert into Hospedagens (checkin, checkout) values ('6/21/2023', '4/8/2023');
insert into Hospedagens (checkin, checkout) values ('4/30/2023', '9/11/2023');
insert into Hospedagens (checkin, checkout) values ('6/8/2022', '8/28/2023');
insert into Hospedagens (checkin, checkout) values ('10/3/2023', '6/29/2023');
insert into Hospedagens (checkin, checkout) values ('2/24/2022', '5/10/2023');
insert into Hospedagens (checkin, checkout) values ('1/8/2023', '6/21/2023');
insert into Hospedagens (checkin, checkout) values ('12/23/2022', '12/28/2022');
insert into Hospedagens (checkin, checkout) values ('5/7/2023', '9/7/2023');
insert into Hospedagens (checkin, checkout) values ('2/28/2023', '12/24/2022');
insert into Hospedagens (checkin, checkout) values ('9/15/2022', '1/22/2023');
insert into Hospedagens (checkin, checkout) values ('12/14/2022', '6/10/2023');
insert into Hospedagens (checkin, checkout) values ('6/3/2022', '3/24/2023');
insert into Hospedagens (checkin, checkout) values ('5/31/2022', '5/11/2023');
insert into Hospedagens (checkin, checkout) values ('7/2/2022', '5/30/2023');

/*Tabela Atividades */

insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('8:08 AM', '10:05 AM', 9, 'Passeio a cavalo com guia', '02/09/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('9:10 AM', '4:55 AM', 4, 'Passeio de buggy', '27/07/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('10:57 AM', '11:59 AM', 12, 'Pesca', '23/09/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('11:20 AM', '12:56 AM', 4, 'Trilha de offroad 4x4', '01/10/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('6:41 AM', '10:00 AM', 15, 'Trilha a pé com guia', '07/12/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('9:40 AM', '10:27 AM', 7, 'Alpinismo', '27/10/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('10:03 AM', '4:06 AM', 15, 'Surf', '20/12/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('11:15 AM', '6:37 AM', 10, 'Natação', '13/08/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('8:17 AM', '2:32 AM', 11, 'Futebol', '19/01/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('9:55 AM', '11:47 AM', 12, 'Vôlei', '09/08/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('11:12 AM', '1:06 AM', 4, 'Hipismo', '21/09/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('10:03 AM', '1:37 AM', 14, 'Luau', '06/02/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('11:08 AM', '2:46 AM', 15, 'Yoga', '28/06/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('10:40 AM', '8:08 AM', 8, 'Oficina de artesanato', '29/11/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('7:45 AM', '6:54 AM', 13, 'Oficina de jardinagem', '18/01/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('9:24 AM', '9:55 AM', 14, 'Caça ao tesouro', '06/02/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('10:31 AM', '5:12 AM', 6, 'Passeio de trator', '27/11/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('7:09 AM', '1:52 AM', 18, 'Visita ao mirante', '23/05/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('11:07 AM', '9:40 AM', 17, 'Teatro ao ar livre', '01/11/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('11:36 AM', '1:20 AM', 16, 'Pratica de cerâmica com guia', '17/08/2022');

/*Tabela Servicos*/

insert into Servicos (preco_servicos, nome_servicos) values (249.96, 'Massagemn');
insert into Servicos (preco_servicos, nome_servicos) values (260.5, 'Frigobar');
insert into Servicos (preco_servicos, nome_servicos) values (129.43, 'Máquina de venda');
insert into Servicos (preco_servicos, nome_servicos) values (93.83, 'Café da manhã');
insert into Servicos (preco_servicos, nome_servicos) values (89.98, 'Sala de jogos');
insert into Servicos (preco_servicos, nome_servicos) values (108.29, 'Internet');
insert into Servicos (preco_servicos, nome_servicos) values (117.71, 'TV a cabo');
insert into Servicos (preco_servicos, nome_servicos) values (257.47, 'Aluguel de filmes');
insert into Servicos (preco_servicos, nome_servicos) values (47.94, 'Ar condicionado');
insert into Servicos (preco_servicos, nome_servicos) values (110.91, 'Kart');
insert into Servicos (preco_servicos, nome_servicos) values (57.17, 'Aula de surf');
insert into Servicos (preco_servicos, nome_servicos) values (56.23, 'Aula de hipismo');
insert into Servicos (preco_servicos, nome_servicos) values (18.3, 'Academia');
insert into Servicos (preco_servicos, nome_servicos) values (296.42, 'Festa Pagode');
insert into Servicos (preco_servicos, nome_servicos) values (189.84, 'Bailão');
insert into Servicos (preco_servicos, nome_servicos) values (246.18, 'Quiroprata');
insert into Servicos (preco_servicos, nome_servicos) values (252.25, 'Sauna');
insert into Servicos (preco_servicos, nome_servicos) values (229.48, 'Babás');
insert into Servicos (preco_servicos, nome_servicos) values (184.17, 'Lavanderia');
insert into Servicos (preco_servicos, nome_servicos) values (275.8, 'Aula de dança do ventre');

/*Tabela Atividades_hospede*/

insert into Atividades_hospede(Hospede_id, id_usuario)
values (1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20);

/*Tabela serviços consumidos*/

insert into servicos_consumidos (id_hospede, id_servico, id_hospedagens)
values(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10),
(11,11,11),
(12,12,12),
(13,13,13),
(14,14,14),
(15,15,15),
(16,16,16),
(17,17,17),
(18,18,18),
(19,19,19),
(20,20,20);

/*Tabela hospedagens_quartos*/

insert into Hospedagens_quartos (id_hospede, id_quartos, id_hospedagens)
values(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10),
(11,11,11),
(12,12,12),
(13,13,13),
(14,14,14),
(15,15,15),
(16,16,16),
(17,17,17),
(18,18,18),
(19,19,19),
(20,20,20);

/*Selects*/

Select count(*) from Usuarios;
Select count(*) from Hospedes;
Select count(*) from Servicos;
Select count(*) from Hospedagens;
Select count(*) from Quartos;
Select count(*) from Funcionarios;
Select count(*) from Atividades;
Select count(*) from servicos_consumidos;
Select count(*) from hospedagens_quartos;
Select count(*) from ATIVIDADES_HOSPEDE;

/*Select ALL*/

select * from Funcionarios;
select * from Usuarios;
select * from Atividades;
select * from Hospedes;
select * from Atividades_hospede;
select * from servicos_consumidos;
select * from servicos;
select * from Hospedagens;
select * from Hospedagens_quartos;
select * from Quartos;

/*Select Join*/

<<<<<<< Updated upstream
/*>>>>>>> Stashed changes*/
=======
SELECT * FROM Funcionarios INNER JOIN Usuarios ON Funcionarios.id_usuario = Usuarios.id_usuario;

SELECT * FROM Funcionarios INNER JOIN Atividades ON Funcionarios.funcionario_id = Atividades.funcionario_id;

SELECT * FROM Usuarios INNER JOIN Hospedes ON usuario.id_usuario = Hospedes.id_usuario;

SELECT * FROM Atividade_hospede INNER JOIN Hospede ON Atividades_hospede.Hospede_id = Hospedes.Hospedes_id INNER JOIN Atividades ON Atividades_hospede.id_atividade = Atividades.id_atividade;

SELECT * FROM Hospedagens INNER JOIN Hospedes ON Hospedagens.Hospede_id = Hospedes.Hospede_id;

SELECT * FROM Hospedagens_quartos INNER JOIN Quartos ON Hospedagens_quartos.id_Quartos = Quartos.id_Quartos INNER JOIN Hospedagens ON Hospedagens_quartos.Hospedagens_id = Hospedagens.Hospedagens_id INNER JOIN Hospede ON Hospedagens_quartos.Hospede_id = Hospede_id;

SELECT * FROM servicos_consumidos INNER JOIN Hospede ON servicos_consumidos.id_hospede = Hospede.id_hospede INNER JOIN sevicos ON servicos_consumidos.id_servicos = servicos.id_servicos INNER JOIN Hospedagens ON servicos_consumidos.id_hospedagens = Hospedagens.id_hospedagens;



>>>>>>> Stashed changes
>>>>>>> Stashed changes

/*Update Servicos*/
update Servicos
set preco_servico= 250, nome_servicos='aula de boxe'
where id_servico=1;
update Servicos
set preco_servico= 10, nome_servicos='prato do dia'
where id_servico=11;
update Servicos
set preco_servico= 157.09, nome_servicos='aula de capoeira'
where id_servico=7;
update Servicos
set preco_servico= 243.11, nome_servicos='aula de futebol'
where id_servico=12;
update Servicos
set preco_servico= 143.33, nome_servicos='pôker'
where id_servico=18;
update Servicos
set preco_servico= 111.11, nome_servicos='aula de karatê'
where id_servico=5;
update Servicos
set preco_servico= 250, nome_servicos='aula de kickbox'
where id_servico=9;
update Servicos
set preco_servico= 250, nome_servicos='piscina'
where id_servico=7;
update Servicos
set preco_servico= 132, nome_servicos='sauna'
where id_servico=19;
update Servicos
set preco_servico= 250, nome_servicos='bugy'
where id_servico=20;

/*Update Hospedagens*/
update Hospedagens
set checkin = '13/12/2023', checkout = '16/12/2023'
where  hospedagens_id = 1;
update Hospedagens
set checkin = '01/07/2023', checkout = '07/07/2023'
where  hospedagens_id = 2;
update Hospedagens
set checkin = '09/02/2023', checkout = '14/02/2023'
where  hospedagens_id = 3;
update Hospedagens
set checkin = '16/05/2023', checkout = '25/05/2023'
where  hospedagens_id = 4;
update Hospedagens
set checkin = '30/8/2023', checkout = '05/09/2023'
where  hospedagens_id = 5;
update Hospedagens
set checkin = '04/06/2023', checkout = '10/06/2023'
where  hospedagens_id = 6;
update Hospedagens
set checkin = '12/03/2023', checkout = '17/03/2023'
where  hospedagens_id = 7;
update Hospedagens
set checkin = '16/03/2023', checkout = '20/03/2023'
where  hospedagens_id = 8;
update Hospedagens
set checkin = '04/04/2023', checkout = '07/04/2023'
where  hospedagens_id = 9;
update Hospedagens
set checkin = '10/10/2023', checkout = '15/10/2023'
where  hospedagens_id = 10;






