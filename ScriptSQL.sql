DROP TABLE IF EXISTS CARGO_POLITICO;
DROP TABLE IF EXISTS MIDIA;
DROP TABLE IF EXISTS MEIO_COMUNICACAO;
DROP TABLE IF EXISTS FOTO;
DROP TABLE IF EXISTS ELEITOR;
DROP TABLE IF EXISTS PARTIDO;
DROP TABLE IF EXISTS CANDIDATO;
DROP TABLE IF EXISTS REGIAO;
DROP TABLE IF EXISTS PESSOA;
DROP TABLE IF EXISTS NOTICIA;

CREATE TABLE PESSOA(
  id_pessoa INTEGER PRIMARY KEY AUTO_INCREMENT,
  cpf VARCHAR(20) NOT NULL,
  p_nome VARCHAR(15) NOT NULL,
  u_nome VARCHAR(15) NOT NULL,
  data_nascimento DATE NOT NULL,
  idade INTEGER NOT NULL,
  endereco VARCHAR(120) NOT NULL
);

CREATE TABLE REGIAO(
  id_regiao INTEGER PRIMARY KEY AUTO_INCREMENT,
  nome_regiao VARCHAR(20) NOT NULL,
  num_eleitores INTEGER,
  num_candidatos INTEGER
);

CREATE TABLE ELEITOR(
  id_eleitor INTEGER PRIMARY KEY AUTO_INCREMENT,
  id_pessoa INTEGER NOT NULL,
  id_regiao INTEGER NOT NULL,
  zona VARCHAR(50) NOT NULL,
  secao INTEGER NOT NULL,
  FOREIGN KEY(id_pessoa) REFERENCES PESSOA(id_pessoa),
  FOREIGN KEY(id_regiao) REFERENCES REGIAO(id_regiao)
);

CREATE TABLE CANDIDATO (
  num_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  id_pessoa INTEGER NOT NULL,
  id_regiao INTEGER NOT NULL,
  FOREIGN KEY(id_pessoa) REFERENCES PESSOA(id_pessoa),
  FOREIGN KEY(id_regiao) REFERENCES REGIAO(id_regiao)
);

CREATE TABLE FOTO (
  foto_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  id_pessoa INTEGER NOT NULL,
  nome_foto VARCHAR(50) NOT NULL,
  tamanho_foto INTEGER NOT NULL,
  formato_foto VARCHAR(5) NOT NULL,
  FOREIGN KEY(id_pessoa) REFERENCES PESSOA(id_pessoa)
);

CREATE TABLE CARGO_POLITICO (
  id_cargo INTEGER PRIMARY KEY AUTO_INCREMENT,
  num_id INTEGER NOT NULL,
  nome_cargo VARCHAR(50) NOT NULL,
  FOREIGN KEY(num_id) REFERENCES CANDIDATO(num_id)
);

CREATE TABLE PARTIDO (
  id_partido INTEGER PRIMARY KEY AUTO_INCREMENT,
  id_regiao INTEGER NOT NULL,
  nome_partido VARCHAR(30) NOT NULL,
  sigla VARCHAR(10) NOT NULL,
  data_fundacao DATE,
  FOREIGN KEY(id_regiao) REFERENCES REGIAO(id_regiao)
);

CREATE TABLE NOTICIA (
  noticia_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  data_publicacao DATE,
  titulo_noticia VARCHAR(200) NOT NULL,
  texto VARCHAR(1000) NOT NULL
);

CREATE TABLE MIDIA (
  id_midia INTEGER PRIMARY KEY AUTO_INCREMENT,
  noticia_id INTEGER NOT NULL,
  tipo_midia VARCHAR(20) NOT NULL,
  nome_arq VARCHAR(30) NOT NULL,
  tamanho_arq INTEGER NOT NULL,
  formato_arq VARCHAR(5) NOT NULL,
  FOREIGN KEY(noticia_id) REFERENCES NOTICIA(noticia_id)
);


CREATE TABLE MEIO_COMUNICACAO(
  comunicacao_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  noticia_id INTEGER NOT NULL,
  tipo_meiocom VARCHAR(20) NOT NULL,
  data_postagem DATE,
  FOREIGN KEY(noticia_id) REFERENCES NOTICIA(noticia_id)
);

INSERT INTO PESSOA(id_pessoa, cpf, p_nome, u_nome, data_nascimento, idade, endereco)
values (1, 13371337, 'Bruce', 'Wayne', '1971-2-14', 47, 'Wayne Mansion, 17, Gotham Federal'),
       (2, 10011001, 'Thor', 'Thundergod', '516-07-04', 1502, 'City Hall, 01, Asgard de Janeiro'),
       (3, 12345678, 'Bruce', 'Banner', '1962-05-11', 56, 'River Street, 30, Dayton, Atlantis do Norte'),
       (4, 89453845, 'Sheriff', 'Woody', '1995-12-22', 22, 'Bed, Andy´s Bedroom, Ohio Grosso'),
       (5, 99999999, 'Faisca', 'McQueen', '2006-06-30', 12, 'Radiator Springs, 120, California do Sul'),
       (6, 10000001, 'Aqua', 'Man', '1941-11-02', 77, 'Aurania, 10, Atlantis do Norte'),
       (7, 19984471, 'Ron', 'Wesley', '1999-05-13', 22, 'Downhill Abbey, 133, Asgard de Janeiro'),
       (8, 14625879, 'Albus', 'Dumbledore', '1881-04-15', 137, 'Hogwarts School of Wizardry, Ohio Grosso'),
       (9, 66587831, 'Tony', 'Stark', '1963-01-17', 55, 'Stark Building, 91, Atlantis do Norte'),
       (10, 14725836, 'Capitao', 'America', '1941-03-15', 77, 'Venture Park, 32, California do Sul'),
       (11, 15947538, 'Eobard', 'Thawne', '1963-09-22', 55, 'S.T.A.R. Labs, 154, Gotham Federal'),
       (12, 14563289, 'Diana', 'Prince', '1941-10-05', 77, 'Central Park, 11, Ohio Grosso'),
       (13, 86248426, 'Pinguim', 'Surfista', '2007-10-26', 11, 'Praia das Rochas, 1337, California do Sul');
	   
INSERT INTO REGIAO(id_regiao, nome_regiao, num_eleitores, num_candidatos)
values (1, 'Gotham Federal', 2, 1),
       (2, 'California do Sul', 3, 1),
       (3, 'Atlantis do Norte', 3, 1),
       (4, 'Ohio Grosso', 3, 2),
       (5, 'Asgard de Janeiro', 2, 2);
	   
INSERT INTO ELEITOR(id_eleitor, id_pessoa, id_regiao, zona, secao)
values (1, 3, 3, 'Atlantis High School', 011),
       (2, 4, 4, 'Ohio´s Law School', 120),
       (3, 5, 2, 'California Kindergarten', 084),
       (4, 9, 3, 'Atlantis High School', 009),
       (5, 10, 2, 'California Kindergarten', 051),
       (6, 11, 1, 'Gotham´s Library', 003),
       (7, 2, 5, 'Asgardian Community College', 010),
       (8, 6, 3, 'Atlantis High School', 005),
       (9, 7, 5, 'Asgardian Community College', 015),
       (10, 8, 4, 'Ohio´s Law School', 122),
       (11, 12, 4, 'Ohio´s Kids School', 012),
       (12, 13, 2, 'Californa Kindergarten', 080);

INSERT INTO CANDIDATO(num_id, id_pessoa, id_regiao)
values (1, 1, 1),
       (2, 7, 5),
       (3, 12, 4),
       (4, 6, 3),   
       (5, 2, 5),
       (6, 8, 4);

INSERT INTO FOTO(foto_id, id_pessoa, nome_foto, tamanho_foto, formato_foto)
values (1, 1, 'batman_presidente', 110, 'jpg'),
       (2, 1, 'batman_2017', 109, 'jpg'),
       (3, 6, 'aquaman_2018', 111, 'png'),
       (4, 12, 'diana_3x4', 89, 'jpg'),
       (5, 12, 'diana_no_df', 281, 'png'),
       (6, 2, 'thor_3x4', 90, 'png'),
       (7, 3, 'bruce_2009', 211, 'jpg'),
       (8, 4, 'woody', 198, 'png'),
       (9, 5, 'faisca_mcqueen_2007', 101, 'jpg'),
       (10, 7, 'ron_wesley2', 222, 'png'),
       (11, 8, 'dumbledore_2012', 199, 'png'),
       (12, 9, 'tonystark1', 256, 'jpg'),
       (13, 10, 'cpt_america_3x4', 99, 'png'),
       (14, 11, 'prof_zoom', 211, 'jpg'),
       (15, 13, 'pinguim_3x4', 199, 'png');

INSERT INTO CARGO_POLITICO(id_cargo, num_id, nome_cargo)
values (1, 6, 'Presidente'),
       (2, 5, 'Governador'),
       (3, 4, 'Prefeito'),
       (4, 3, 'Vereador'),
       (5, 2, 'Deputado Estadual'),
       (6, 1, 'Deputado Estadual');

INSERT INTO PARTIDO(id_partido, id_regiao, nome_partido, sigla, data_fundacao)
values (1, 3, 'Partido da Marvel', 'PdM', '1947-06-11'),
       (2, 1, 'Partido da DC', 'PDC', '1934-08-17'),
       (3, 1, 'Partido Pixar', 'PP', '1986-02-03'),
       (4, 2, 'Partido Harry Potter', 'PHP', '2002-05-11');

INSERT INTO NOTICIA(noticia_id, data_publicacao, titulo_noticia, texto)
values (1, '2018-05-12', 'Presidente Batman promete aumento de 200 reais nos salarios', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'),
       (2, '2018-09-28', 'Partido da DC desviou 200 milhoes em 2017', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
       (3, '2018-10-02', 'PHP e PP formam alianca', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.'),
       (4, '2018-11-14', 'Candidata Diana lidera a corrida por 12 milhoes de votos', 'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?'),
       (5, '2018-05-22', 'Vereador Aquaman preso por lavagem de dinheiro', 'Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.');

INSERT INTO MIDIA(id_midia, noticia_id, tipo_midia, nome_arq, tamanho_arq, formato_arq)
values (1, 1, 'Imagem', 'batman_2017', 109, 'jpg'),
       (2, 4, 'Imagem', 'grafico_votos', 201, 'png'),
       (3, 5, 'Audio', 'aquaman_interrogatorio', 2110, 'mp3'),
       (4, 4, 'Video', 'diana_em_sp', 13490, 'avi'),
       (5, 2, 'Audio', 'prova_desvio_alfa', 1600, 'mp3'),
       (6, 3, 'Imagem', 'omega_alia_beta', 170, 'jpg'),
       (7, 5, 'Imagem', 'aquaman_2018', 111, 'jpg'),
       (8, 3, 'Video', 'omega_beta_em_rj', 9550, 'mp4');

INSERT INTO MEIO_COMUNICACAO(comunicacao_id, noticia_id, tipo_meiocom, data_postagem)
values (1, 4, 'Jornal TV', '2018-11-15'),
       (2, 1, 'Jornal Internet', '2018-05-13'),
       (3, 1, 'Jornal TV', '2018-05-13'),
       (4, 2, 'Redes Sociais', '2018-08-28'),
       (5, 3, 'Jornal Internet', '2018-10-02'),
       (6, 5, 'Jornal TV', '2018-05-22'),
       (7, 4, 'Jornal Internet', '2018-11-14');

CREATE VIEW cand AS
SELECT num_id AS Id,
       id_pessoa AS Pessoa,
       id_regiao AS Regiao
FROM candidato;

SELECT * FROM cand;

DELIMITER $$
CREATE PROCEDURE selecionar_pessoas (OUT quantidade INT)
BEGIN
    SELECT COUNT(*) INTO quantidade FROM pessoa;
END $$
DELIMITER ;

CALL selecionar_pessoas(@total);
SELECT @total;
