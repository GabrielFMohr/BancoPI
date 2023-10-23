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

<<<<<<< Updated upstream
;
=======
insert into USUARIOS ( senha, nivel_de_acesso, login)
values ("M@iones3", 0,"MAZDARX7" ),
("M@Peido", 0,"Cralos Ícaro" ),
("Geromel", 1,"Andrei" ),
("macaco", 0,"MicoMeu" ),
("blaze", 1,"FelipeNeto" ),
("Azul", 1,"Smurfette" ),
("Gorro", 1,"PapaSmurf" ),
("Azar", 0,"Desastrado" ),
("Bobo", 1,"Joca" ),
("Forte", 0,"Robusto" ),
("Ruiva", 1," Sassette" ),
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
>>>>>>> Stashed changes


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

/*Tabela funcionarios*/

insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Gerry', 'Delucia', 'Staff Accountant II', '$9526.14');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Editha', 'Stede', 'Account Executive', '$9016.38');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Agosto', 'Franchyonok', 'Computer Systems Analyst III', '$7291.94');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Giselbert', 'Duthy', 'Project Manager', '$5890.71');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('L;urette', 'Smalridge', 'Data Coordinator', '$6530.11');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Kym', 'Wakerley', 'Recruiter', '$1477.57');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Aymer', 'Tunbridge', 'Human Resources Manager', '$5917.57');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Lindie', 'Kaygill', 'Paralegal', '$8184.42');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Suzi', 'Rickarsey', 'Automation Specialist IV', '$4905.58');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Jonell', 'Devine', 'Senior Editor', '$2276.33');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Mae', 'McNess', 'Marketing Assistant', '$9164.21');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Moishe', 'McCrea', 'Senior Sales Associate', '$6212.93');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Winny', 'Butterworth', 'Payment Adjustment Coordinator', '$2643.54');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Wynn', 'MacAllester', 'Chief Design Engineer', '$9734.61');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Charmaine', 'Chilcott', 'Teacher', '$3291.06');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Hortense', 'Dwyr', 'Structural Analysis Engineer', '$7856.25');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Chadwick', 'Ewen', 'Research Assistant I', '$7086.47');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Tally', 'Liffe', 'Programmer Analyst I', '$5948.04');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Letisha', 'Huggon', 'Accounting Assistant III', '$9692.93');
insert into Funcionarios (nome, sobrenome, funcao, salario) values ('Mose', 'Jozwicki', 'Administrative Officer', '$2530.39');

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

insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('8:08 AM', '10:05 AM', 9, 'Lotlux', '02/09/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('9:10 AM', '4:55 AM', 4, 'Voyatouch', '27/07/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('10:57 AM', '11:59 AM', 12, 'Y-find', '23/09/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('11:20 AM', '12:56 AM', 4, 'Domainer', '01/10/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('6:41 AM', '10:00 AM', 15, 'Zathin', '07/12/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('9:40 AM', '10:27 AM', 7, 'Kanlam', '27/10/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('10:03 AM', '4:06 AM', 15, 'Daltfresh', '20/12/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('11:15 AM', '6:37 AM', 10, 'Y-find', '13/08/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('8:17 AM', '2:32 AM', 11, 'Lotstring', '19/01/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('9:55 AM', '11:47 AM', 12, 'Stim', '09/08/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('11:12 AM', '1:06 AM', 4, 'Stringtough', '21/09/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('10:03 AM', '1:37 AM', 14, 'It', '06/02/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('11:08 AM', '2:46 AM', 15, 'Y-find', '28/06/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('10:40 AM', '8:08 AM', 8, 'Opela', '29/11/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('7:45 AM', '6:54 AM', 13, 'Lotlux', '18/01/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('9:24 AM', '9:55 AM', 14, 'Lotlux', '06/02/2023');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('10:31 AM', '5:12 AM', 6, 'Stim', '27/11/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('7:09 AM', '1:52 AM', 18, 'Andalax', '23/05/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('11:07 AM', '9:40 AM', 17, 'Zathin', '01/11/2022');
insert into Atividades (horario, horario_fim, restricao_idade, nome_atividade, data) values ('11:36 AM', '1:20 AM', 16, 'Regrant', '17/08/2022');
