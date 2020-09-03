/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: Cache
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Cache` (`contexto` text DEFAULT NULL) ENGINE = InnoDB DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: EmailBloqueado
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `EmailBloqueado` (
  `email` varchar(150) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: Mensagem
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Mensagem` (
  `id` varchar(100) NOT NULL,
  `texto` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: Usuario
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Usuario` (
  `id` int(20) unsigned NOT NULL,
  `nome_completo` varchar(80) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `forma_de_pagamento` varchar(20) NOT NULL,
  `status_assinatura` varchar(30) NOT NULL,
  `aviso_banimento` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: UsuarioGratuito
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `UsuarioGratuito` (
  `id` int(20) unsigned NOT NULL,
  `nome_completo` varchar(200) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_de_assinatura` date NOT NULL,
  `dias_de_uso` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: Cache
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: EmailBloqueado
# ------------------------------------------------------------

INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('adsadasd@adad.co');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('almeidinhacustom@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Andréjanones@gmail.com.br');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('asdad@ads.co');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('asdasd@asd.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('bernardes.matheus@outlook.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('darlanneiva29@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('esterrocha@asdad.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('francisco.gringo@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Gabrielpaz0101@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Gggggggggg@ggggggg.ggg');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('gleisoneliel@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Guizinka@hotmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Ianmillermatos@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Irismael96@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('ivancaldeira.per@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Jhoninhopessoa3@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('jose@asd.co');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('jose@hotmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Jskwjw@jdkwks.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('kaiquejoaosilva@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('kajsndkajsnd@asd.co');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Kelvinfelipeoliveira@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('lakcmalkcma@sdgb.co');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('laksdmalk@asda.co');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Leonardocorreiia66@outlook.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('lilianiramos04@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Lukaspodolsk1998@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('marcia.alves@chromapar.com.br');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('marketeirosafado@outlook.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Marquinata@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('matheus.email@email.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('matheus@email.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('maycontimoteo9@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('negblackawesome@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('ptimbo94@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('rafael_vribeiro@hotmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Remersonsoyza@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('ricardosafadao567@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('rsdpereira401@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('suporte@semprerico.com.br');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Teedbbb@jjko8r3.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('teteu.campos157@gmail.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('thomashenrike@outlook.com');
INSERT INTO
  `EmailBloqueado` (`email`)
VALUES
  ('Wesley-cavallcante@hotmail.com');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: Mensagem
# ------------------------------------------------------------

INSERT INTO
  `Mensagem` (`id`, `texto`)
VALUES
  (
    'mensagem-doji',
    'Puts, terminou em doji. Vamos considerar como Loss!'
  );
INSERT INTO
  `Mensagem` (`id`, `texto`)
VALUES
  ('mensagem-loss', 'Loss.');
INSERT INTO
  `Mensagem` (`id`, `texto`)
VALUES
  ('mensagem-win', 'Wiiiiinnnn ');
INSERT INTO
  `Mensagem` (`id`, `texto`)
VALUES
  (
    'sticker-loss',
    'CAACAgIAAxkBAAEBLjJfMetXCHwf8lzKrMt-rde6UfgBkgAC0wADJQNSD-qct6VORlmzGgQ'
  );
INSERT INTO
  `Mensagem` (`id`, `texto`)
VALUES
  (
    'sticker-win',
    'CAACAgIAAxkBAAEBLjBfMer7bi12BrzUTJYZzKfaEc_NFwAC1AADJQNSD6MYw2CtetUAARoE'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: Usuario
# ------------------------------------------------------------

INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    482952238,
    'Robson',
    '13997788328',
    'jucaparisfeliz@gmail.com',
    'boleto',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    620352905,
    'Douglas Dario Vieira',
    '21969549540',
    'douglas.dario1@gmail.com',
    'cartao_de_credito',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    857329452,
    'Eric Patric Porto',
    '19991125954',
    'ericpatric14@gmail.com',
    'boleto',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    917100810,
    'Noel',
    '38999975457',
    'fanmoto450@gmail.com',
    'cartao_de_credito',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    938335456,
    'Pedro Vicente ferreira neto',
    '83996822644',
    'pedrotraderbrasil@gmail.com',
    'cartao_de_credito',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    952315741,
    'Rafael De Assis Moura ribeiro',
    '13981106866',
    'rafael_assis94@hotmail.com',
    'cartao_de_credito',
    'cancelada',
    3
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    974603575,
    'Fernando Martins',
    '66996534837',
    'fernando.finan@gmail.com',
    'boleto',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1037922648,
    'Victor Augusto DAvila',
    '44998929827',
    'Victoraugustodavila@gmail.com',
    'boleto',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1050256412,
    'Wesley Caetano Marinho',
    '21981063267',
    'ninhodo32@gmail.com',
    'cartao_de_credito',
    'cancelada',
    3
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1066303705,
    'Rogger Marcelino',
    '21 98385852',
    'roggermarcelino@gmail.com',
    'cartao_de_credito',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1073737612,
    'Douglas Inácio Vieira',
    '27999593498',
    'douglas_vieira12@live.com',
    'cartao_de_credito',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1083044916,
    'Deiverson da Silva Ferreira Rocha',
    '66996996708',
    'rochadeiverson@gmail.com',
    'boleto',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1090978855,
    'Jessé Ferreira Camara',
    '67991704219',
    'jesseferreirac@gmail.com',
    'cartao_de_credito',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1100713844,
    'Noel Pereira dos Santos',
    '38999975457',
    'fanmoto450@gmail.com',
    'cartao_de_credito',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1108976979,
    'Watson Medeiros',
    '84999535353',
    'watsonmedeiros@hotmail.com',
    'cartao_de_credito',
    'cancelada',
    3
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1127666757,
    'Jairo Dos Santos Ferreira',
    '94991604980',
    'jairo77sf@gmail.com',
    'boleto',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1134484853,
    'Gustavo Macedo da Silva',
    '13988657502',
    'gustavomacedodasilva@gmail.com',
    'cartao_de_credito',
    'cancelada',
    3
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1139891304,
    'Douglas Jean Silva Pinheiro',
    '92982376940',
    'douglaspinheiro1991@gmail.com',
    'cartao_de_credito',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1152321726,
    'Jonis da Silva Sousa',
    '67999114426',
    'jonis_silva_sousa@hotmail.com',
    'boleto',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1181656369,
    'Eduardo Camargo Gonçalves',
    '41989020382',
    'Eduardoldgoficial@gmail.com',
    'cartao_de_credito',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1214296724,
    'Izaak Rerisson Silva De Santana Lima',
    '13981125537',
    'Izaaksantanaaz09@gmail.com',
    'cartao_de_credito',
    'cancelada',
    3
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1224094825,
    'Wagner Maldini Ferreira',
    '48984269795',
    'wagnermf159@gmail.com',
    'cartao_de_credito',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1260128449,
    'Eduardo Ribeiro',
    '49 99964716',
    'eduardomkt4@hotmail.com',
    'cartao_de_credito',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1276128328,
    'Maurício Machado Gonçalves Serra',
    '67984326576',
    'mdr124578@gmail.com',
    'boleto',
    'ativa',
    0
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1359893966,
    'Michel Tenório Dall Alba',
    '9499174017',
    'michel.dallalba@gmail.com',
    'cartao_de_credito',
    'cancelada',
    3
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1360459060,
    'Willian da Silva Oliveira',
    '21974218773',
    'willian_car_med@outlook.com',
    'boleto',
    'cancelada',
    3
  );
INSERT INTO
  `Usuario` (
    `id`,
    `nome_completo`,
    `telefone`,
    `email`,
    `forma_de_pagamento`,
    `status_assinatura`,
    `aviso_banimento`
  )
VALUES
  (
    1375331318,
    'Márcia Silva Alves',
    '11958237640',
    'marcia.alves@chromapar.com.br',
    'cartao_de_credito',
    'ativa',
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: UsuarioGratuito
# ------------------------------------------------------------

INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    89664357,
    'Edney da Silva Amorim',
    '00713166126',
    '63992816050',
    'Edneyamorim9@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    99593427,
    'Alef Carvalho Alves de Sá',
    '06471312180',
    '61982252616',
    'Alef.mills@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    102607555,
    'Ricardo',
    '94223700430',
    '81999998888',
    'teste@teste.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    159746593,
    'Jefson Andrade Monte',
    '00231140290',
    '69992095439',
    'vnorte2@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    171976295,
    'Ezequiel aparecido pedroso',
    '10984295674',
    '11975420438',
    'Ezequiel_aparecido@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    175771438,
    'Luiz Fernando Machado Da Silva',
    '44409420836',
    '16992056645',
    'lfmds69@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    203451078,
    'Jose flavio morais',
    '01072905370',
    '88997829409',
    'Netofechine88@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    203582274,
    'Anderson Fernando Farias',
    '74764740826',
    '38991438643',
    'maylson-tecladista@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    204536166,
    'José Haref Vieira Maciel',
    '04481699400',
    '83998379842',
    'harefmaciel@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    227273965,
    'Marcelo Henrique Almeida cerioli de oliveira',
    '03377447261',
    '69992127603',
    'marcelohenriquealmeidacerioli@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    238620975,
    'Josias campos de oliveira',
    '12344209700',
    '21991912758',
    'josiascamposdeoliveira@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    240405606,
    'Adinan José de Jesus',
    '06401860928',
    '44997012200',
    'dinanj_@1234hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    272570365,
    'Marcus Vinicius Alves Botelho',
    '05332504128',
    '77999010136',
    'marcusbotelho12@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    307863024,
    'Cesar Augusto Feliciano',
    '16392084886',
    '16993900020',
    'felitche07@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    312734549,
    'Caíque Gonzaga',
    '41586869892',
    '19996178277',
    'cqgonzaga@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    328893446,
    'Wesley falcuci Silva',
    '34136166842',
    '16999889009',
    'Wesleyfalcuci@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    344256771,
    'André Luis Silva Bernardo',
    '06323482916',
    '47984613898',
    'andreluisbernardo@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    382066913,
    'Taiandro santos moreira',
    '01629297224',
    '92982263732',
    'Taiandromoreira@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    414074502,
    'Robson de Almeida',
    '13192791713',
    '21969435281',
    'robisomsoares@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    420028281,
    'Thiago Lincon Viana Barauna',
    '01802169296',
    '92993501297',
    'Luiskillerdx@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    428706100,
    'WELTON DEYVID DA SILVA DE OLIVEIRA',
    '04707068219',
    '94984307844',
    'weltondeyvid1998@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    458402473,
    'David de Jesus Almeida',
    '86167079560',
    '74999040702',
    'david.almeida9916@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    460921001,
    'Eduardo Henrique Silva de Sousa',
    '12248265409',
    '81985427814',
    'edusousabike@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    462731674,
    'Jonatan da Silva Muniz',
    '47719071883',
    '15998256738',
    'taanmuniz@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    471917851,
    'Taís Michelle de Melo Lira',
    '36699263803',
    '18988035681',
    'taisliracomercial@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    476175253,
    'Duan victor guimaraes Santos',
    '11229505431',
    '82988712919',
    'duanvictorr@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    480261050,
    'Vitor bruno aires moreira da cunha',
    '14086047799',
    '24998393143',
    'Vitorbruno.rs@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    484047596,
    'Tulio Galdino do Nascimento',
    '09131872409',
    '81981700940',
    'tgdnnascimento@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    489322122,
    'pedro luiz lopes junior',
    '49311012831',
    '19994759576',
    'pedroluizlopesjunior@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    496391899,
    'Rafael de Souza Santos',
    '15612337736',
    '22997986211',
    'rafaelsouza-mg-rj@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    514500059,
    'Douglas Marques de Souza',
    '15469933474',
    '81985550048',
    'Douglas.mds24@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    522594572,
    'Dodô calil',
    '37205413800',
    '11951210464',
    'Dodocalil@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    537275787,
    'Nubia Suely',
    '56321970506',
    '21999018555',
    'castritoiwnl@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    552297346,
    'Marcelo Brandão da Silva',
    '17246522735',
    '27992812360',
    'mail.marcelobrandao@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    553324009,
    'Pedro fellipe de Araujo Lima',
    '01019653205',
    '92991984233',
    'Fellipelevita@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    554945274,
    'FABIO FRANCISCO PRATES',
    '95969462268',
    '69993684205',
    'mdinvestiments@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    556818466,
    'Robson Port de Jesus',
    '01993703039',
    '54996143881',
    'robson_portjesus@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    558398922,
    'Felipe da Silva Ferreira',
    '36716855815',
    '62999567319',
    'nahiwex614@youlynx.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    561952540,
    'João carlos scheitt',
    '55968953004',
    '51981378389',
    'gustavosceitt@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    565539578,
    'Pedro Igor da Silva Alves',
    '05492704346',
    '85991731831',
    'pedroiigor9@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    565667764,
    'Allan Rodrigo de Moura',
    '07247177497',
    '81996020317',
    'alanmoura101@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    568555888,
    'Pedro henrique ribeiro da silva',
    '47456561818',
    '18998098521',
    'Ph2984530@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    574548658,
    'Matheus',
    '14124945671',
    '31994726273',
    'fullcabana@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    579678857,
    'Izabella Amaral Motta',
    '02386913147',
    '62994790419',
    'Itza.amaral2012@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    584971970,
    'Wagner dos santos vieira',
    '41443794856',
    '11973234109',
    'Wagnerbolt44@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    588178678,
    'Elton J B Araujo',
    '02426979178',
    '66999398989',
    'tom.brt@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    593526343,
    'Gustavo silva',
    '13375410603',
    '34999963885',
    'Gustavocamargos1996@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    595465007,
    'Cleverson Willian Silveira',
    '09553537936',
    '48996278662',
    'djchatofloripa@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    601067883,
    'Daniel Volkmann',
    '10378712942',
    '47999165595',
    'danielvolkmann00@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    612242812,
    'Thallis Alves Vieira',
    '16474639636',
    '32999048722',
    'thallisalves1999@yahoo.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    613918126,
    'Francisco da Silva Machado',
    '06172216341',
    '21986766625',
    'chagasdasilva08@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    615324339,
    'Emerson Amaral',
    '09589885950',
    '49991011911',
    'emersonasouza1@outlook.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    617510718,
    'Leonardo Alves Marchiori Filho',
    '08341366606',
    '32984672145',
    'coachleonardomarchiori@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    618918477,
    'Vitor vv',
    '59248146023',
    '14991718934',
    'themixmusicbr@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    622215304,
    'Marcos Paulo Batista Souza',
    '70139685103',
    '62994805379',
    'marcospaulo300@hotmail.com.br',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    623009552,
    'Vanessa Olímpia da Conceição',
    '34263367820',
    '11955543489',
    'vanesolimpia@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    623343347,
    'João Ferreira da Silva',
    '00183590279',
    '86988167745',
    'Ggizzi@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    628084551,
    'Marcones rosa de lima',
    '01930448627',
    '33999333131',
    'Marcones.rosa20@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    628573980,
    'Fernando Rodrigues de matos',
    '43979034844',
    '11981198822',
    'fernando.tenent96@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    628585290,
    'Gabriel Ribeiro',
    '47013783803',
    '12981528447',
    'gabririber342@yahoo.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    628718851,
    'Eduardo Machado Gomes',
    '06394054798',
    '21982933209',
    'duduzeiros@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    630039552,
    'Paulo Alfonso Zimermann',
    '01040415954',
    '47996537945',
    'sunkpaulo@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    630204481,
    'Diego Veríssimo Batista',
    '10922950628',
    '34998786080',
    'haalz@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    630844799,
    'João Batista Gimenes',
    '32031701835',
    '11958157606',
    'Jbggimenes@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    631883311,
    'Alexsandro leite',
    '04340487120',
    '66997135161',
    'Sanbaroleite4@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    632065159,
    'Luan Felipe Sant ana de Araujo',
    '12740510616',
    '31994079447',
    'luanamacinema@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    632863967,
    'Thiago da Silva Barros',
    '35835820801',
    '11942979203',
    'Tsb_sandra@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    634772875,
    'José Willas da Costa Rodrigues',
    '05763922190',
    '63984731622',
    'willas15@live.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    636150870,
    'Luiz Carlos Corrêa de Oliveira',
    '12194387234',
    '41998655245',
    '4ndrefigueiredo@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    640545635,
    'Henrique Miguel Martin Gomes',
    '20340000139',
    '61985607428',
    'AHLAcontato@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    640672774,
    'João Victor Cherede Lima',
    '14712719788',
    '22998371061',
    'jgclima646@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    641615842,
    'Gabriel Witt',
    '01697610021',
    '51996535109',
    'gabwitttraide@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    642554408,
    'Daiane Domingues da Silva',
    '39474485895',
    '14997591519',
    'daiane_d.a.i@Hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    644427357,
    'Pedro Henrique Ribeiro',
    '45030420843',
    '12981103105',
    'Pedhenriqueribeiro@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    650633383,
    'Juan',
    '04041603102',
    '61981607181',
    'juanbattera@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    650637246,
    'Daniel Jonathas Elias Fernandes Dos Santos',
    '05144178383',
    '82991606363',
    'Danieljonathas33@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    650702526,
    'Lucas Vinicius Alves Macedo',
    '15918526684',
    '31998887372',
    'Hlucashvinicius70.lv@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    656907888,
    'Talles Carniel Polidorio',
    '06403121103',
    '66996294309',
    'tallescarniel@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    656997777,
    'Guilherme Pereira Da Rosa',
    '46429877892',
    '11964795800',
    'Contatoguihermepereira@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    657623663,
    'Antônio Luís de Menezes Soares',
    '11088228437',
    '84998183407',
    'antonioluis96962211@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    659325871,
    'Caroline Fernanda Moretti',
    '08376138928',
    '41996639918',
    'carolinefemp@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    659495235,
    'Leonardo Tavares Cotrim Ribeiro',
    '07748830908',
    '44999955292',
    'consultorleonardoc@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    659635517,
    'Yago dos Santos Petersol de Miranda',
    '16487578711',
    '21994775489',
    'yago.petersol@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    659758805,
    'Ana Paula Defant',
    '05938766109',
    '65996380041',
    'Pauladefant@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    660735248,
    'Ruan Kalebe Lopes Maltez',
    '51497037883',
    '19989529357',
    'ruankalebec4@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    664172085,
    'Betanio de Oliveira Santana',
    '06006951584',
    '71992384250',
    'betaniooliveira5064@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    664237072,
    'Rafael',
    '44713047040',
    '91992923913',
    'grafael@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    664550988,
    'Antonnyo lucas Alves Cabral Salomé',
    '06140158125',
    '66996454508',
    'lucasroo43@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    664822929,
    'Igor Pereira Gonçalves',
    '07388835571',
    '75998509313',
    'Igor.igo13@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    671306347,
    'Karlos Eduardo Rodrigues Dos Santos',
    '13163860400',
    '55986133859',
    'Karloscontato@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    671603995,
    'Tiago da silva de carvalho',
    '06761254922',
    '47984776692',
    'Dasilva3264@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    676057067,
    'Luiz Erick Pereira',
    '50903550881',
    '11948860730',
    'luizerickk2017@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    677676622,
    'Synario Pereira de Sousa',
    '10573366454',
    '83999368594',
    'Synariopereira@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    683165738,
    'Gustavo Lima',
    '93773405006',
    '61991422735',
    'oficialcontato.hsr@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    685516532,
    'Anderson Ribeiro neto',
    '24584255008',
    '19997708914',
    'niltongomeslima9@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    688299723,
    'Endreo Tragino Plotegher',
    '12769499793',
    '33998040171',
    'endreo_plotegher@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    693116918,
    'Felipe Silva Abramo',
    '50711221898',
    '11966513750',
    'monepassos9@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    697910136,
    'José de Ribamar Carvalho Rocha',
    '04122839300',
    '98987284597',
    'ribamar050893@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    699181104,
    'Eduardo Henrique Ferreira Conceição',
    '06336847160',
    '63999385406',
    'edhi.k@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    702292324,
    'Victor Hugo Oliveira do Nascimento',
    '02140665686',
    '31985410139',
    'Victorhugooliveira2301@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    704336346,
    'Renan Erik',
    '11639934928',
    '43999375106',
    'Renan.erik@outlook.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    705212795,
    'Leonardo Cristiano dos Santos',
    '10229462936',
    '45998764432',
    'leosantosleosan@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    705941423,
    'Djalma Alves de Araújo',
    '41620276844',
    '94991680340',
    'djalma2040@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    706306804,
    'Tiago Gomes de anhaia',
    '35861262802',
    '15996092528',
    'Anhaia_13@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    708087161,
    'Agnaldo de Santana barreto',
    '02375144511',
    '22981051660',
    'maykomsantana78@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    708912951,
    'Luiz Paulo Caetano Pereira',
    '01866027581',
    '73999568946',
    'luizpaulofenomenal10@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    711883734,
    'Vinicius Almeida',
    '01754658601',
    '31987841253',
    'Marcso-vini96@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    712606559,
    'Vinícius Simões de Almeida',
    '37976572857',
    '11993492715',
    'vinicius-simoes@outlook.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    713688839,
    'Jorlan da Cruz Araújo',
    '37145004801',
    '11982944825',
    'jorlan.araujo01@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    713827288,
    'Junior pontes',
    '52211142915',
    '94989034567',
    'Noclashnogain@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    714083836,
    'Magno Guimarães Costa Silva Filho',
    '04357943531',
    '75991787692',
    'magnogcs@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    715081233,
    'Robson Felipe dos Santos Fernandes',
    '13891988710',
    '21976369869',
    'felip20011@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    716360953,
    'Rubens de Souza',
    '11538157705',
    '27998869287',
    'rubens@uniaoeletromecanica.com.br',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    716502432,
    'Lucas Guilherme Moreira Paixão',
    '45766822880',
    '16988012866',
    'lucaslove74@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    719429213,
    'Fabio Nunes Batista Santos',
    '37816380810',
    '18988007499',
    'fabiionunespv2@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    721016999,
    'Carlitos Oliveira Silva',
    '36721210886',
    '21987139946',
    'Carlitos.oliveira@outlook.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    721545237,
    'William Vinicius Cecatto',
    '04148825390',
    '85999576604',
    'William_cecatto@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    721557882,
    'Matheus',
    '16210642713',
    '21997532998',
    'bernardes.matheus@outlook.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    725280854,
    'Willian Rafael Bernardino',
    '33981866886',
    '19998390590',
    'wlnrafael@terra.com.br',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    725500831,
    'Filipe Oliveira Farias',
    '00603064248',
    '69993114362',
    'filipe98f@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    725909612,
    'Adriano Lavor',
    '06189892345',
    '85981311730',
    'adriano.lmaciel94@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    726146917,
    'Carlos Humberto Rosa Guilherme Júnior',
    '13969451728',
    '24992025483',
    'carloshumbertoj444@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    727994158,
    'João Hosken N Spiacci',
    '05341871960',
    '43996485686',
    'Joaohosken16@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    729394771,
    'José Alexsandro Gomes de Sousa',
    '06994942309',
    '89994069682',
    'alexgomsousa@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    730179059,
    'Leonardo Manoel voltz',
    '02452232076',
    '51983081280',
    'Leomvoltz@icloud.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    734231495,
    'Vinícius de Aguiar Martins',
    '48541358836',
    '11970421569',
    'vini200081@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    735008181,
    'Anderson dos Santos PEreira',
    '02104957079',
    '66999270240',
    'hander-gmo@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    735033071,
    'Diego Lima',
    '05290587900',
    '41997076654',
    'dhiegolhma33@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    736740892,
    'Luiz Caio Felipe Pires',
    '29442039407',
    '11995194731',
    'luizcaiofelipepires-81@dmarquivo.com.br',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    736769466,
    'Luis Antônio rombaiolo pinho',
    '44923551895',
    '17996640712',
    'pinholuis@outlook.com.br',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    737273973,
    'Walisson passos',
    '61694484319',
    '99991458025',
    'Walissonpassos577@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    738102221,
    'Aguinaldo dos santos Souza',
    '16394607215',
    '51996661256',
    'Danimarunick69@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    739244125,
    'João Lucas Lourenço Neves',
    '06982445674',
    '34991769900',
    'Nevesnegociosonline@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    739520101,
    'João Hugo Teles Guimarães Falcão',
    '22510487825',
    '86981110160',
    'joaohugofalcao@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    739719175,
    'Lucas Gabriel Gerhardt',
    '09847930970',
    '49988214108',
    'lucas.gerhardt1@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    742287402,
    'Lucas Latansa',
    '42083238842',
    '11981775445',
    'Latansatrader@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    743177253,
    'Alisson Felipe da Silva',
    '09583299901',
    '43999576615',
    'Alisson.bidu12@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    743488849,
    'Natanael Santana Souza',
    '40324909888',
    '47991844104',
    'tael_ao_cubo@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    746045212,
    'LUCAS EDUARDO ALMEIDA',
    '08118129365',
    '86998209519',
    'lucaswalker537@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    748863177,
    'William Emmanoel Silva Amorim',
    '08524787554',
    '75988001786',
    'william.emmanoel@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    749276975,
    'Luan Alcântara',
    '37766262835',
    '11974256317',
    'Luanalvantarans@outlook.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    751089338,
    'CPF: 04862601944\nNome:\nGISELE MARIA DA SILVA\nDt. Nasc:\n28/06/1984 00:00:00\nNome da Mãe:\nMARIA PULCENA DA SILVA',
    '04862601944',
    '69993828680',
    'Dannyellll33@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    751213571,
    'Elcio Magno',
    '95844643615',
    '32998382420',
    'trabalhopaulobastos@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    751805500,
    'Joyce Gusmão',
    '11430690640',
    '33991703069',
    'cuseco97@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    752080145,
    'Sara Fernanda giromini',
    '75870748720',
    '34997544331',
    'overwatch125@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    752803965,
    'Moisés Lincoln Santiago Costa',
    '60632124342',
    '98985144574',
    'Madlincon2@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    754468580,
    'Matheus Vinicius Cruz dos Santos',
    '86652245566',
    '71981301436',
    'Matheusv.eb@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    755788708,
    'Lucas Alves do nascimento',
    '43583645863',
    '18997301957',
    'Lukinhaalvess18@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    755828146,
    'Gabriel Andrade da Silva',
    '49779185844',
    '11952380702',
    'ga6710345@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    756286409,
    'Gilson aparecido dias dos santos',
    '41773227840',
    '14996798253',
    'gilsonsantosyt@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    756531272,
    'Frederico Cruz Pereira',
    '06093885330',
    '86981909451',
    'fredericocruzconsultor@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    758996217,
    'Patrick Vieiro Nunes',
    '04202837061',
    '55996127980',
    'patryckvieironunes@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    759113690,
    'Mateus de Oliveira',
    '07898484576',
    '73991168016',
    'Dr_carlosbispo@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    759194863,
    'Leonardo pereira borges',
    '41133203817',
    '16996099717',
    'leonardopereiraborges20188@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    761896590,
    'Afonso caos',
    '72821808062',
    '11981599000',
    'Affonsoca5@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    761934851,
    'Raul Martins Venancio',
    '47609902837',
    '11947034073',
    'rm_venancio@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    762430064,
    'Alexandre rogerio Bráz',
    '11533741883',
    '88998588900',
    'Rogeriobraz@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    762651735,
    'Octávio Vieira Costa e Silva',
    '10302040471',
    '84981268023',
    'anaetato@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    767488656,
    'Orlan Gomes Martins',
    '70567973182',
    '62991428789',
    'ronegomesa@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    767882889,
    'Matheus Carbonera dos Santos',
    '04860827171',
    '65999151375',
    'matheuskobi@live.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    769089799,
    'Claudenir do Carmo dos Santos',
    '05001760941',
    '46999195459',
    'claudenircamila2019@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    769737673,
    'Elias Félix de Abreu Júnior',
    '45357991804',
    '11930842592',
    'Eliasfelixdeabreu@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    772506008,
    'Rafael flores',
    '01603145001',
    '51997958298',
    'raffael.fflores25@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    774208578,
    'Geovane de Sousa Lemos',
    '01809533201',
    '63985174316',
    'geovane521@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    774496791,
    'Humberto xavier de souza',
    '02613119721',
    '21988027910',
    'Fretecarreto@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    775406177,
    'César Trigo Camargo Pigini',
    '37446469803',
    '11981059472',
    'cesar-tcp@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    776933939,
    'Leandro Gomes Barbosa',
    '06563531040',
    '31996136117',
    'Leandrolg499@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    778393416,
    'Otávio Henrique da Silva Marques',
    '08876425608',
    '34997637327',
    'otaviiioz1@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    779891401,
    'Mateus Ferreira',
    '03838784545',
    '73988422201',
    'mateussanfer05@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    780620002,
    'Daniel Carioni Nobrega Garcia',
    '05830549948',
    '48996939434',
    'Danicng@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    781256302,
    'Higor Patrick Sousa Luz',
    '04493149280',
    '94984190414',
    'higgortrader@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    784525041,
    'Jorge Eduardo Bessa Figueiredo',
    '09054798408',
    '84994248143',
    'jorge.dk.st@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    784665411,
    'Lucas henrique silva',
    '10966294610',
    '37991120402',
    'Jhonnyhenrique@yahoo.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    786407206,
    'Kaviel gomes',
    '04450932005',
    '51992936428',
    'rafaelbigo.cruz@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    790981320,
    'Leonardo Contarini',
    '35034293870',
    '14998211650',
    'Leozinnx@outlook.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    791204941,
    'Gabriel Albuquerque Simões Blanes',
    '03396064526',
    '73991800406',
    'gabrielradioetelevisao@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    791346369,
    'Anderson Araújo Rodrigues',
    '05341727339',
    '94984226819',
    'buffon.a.a.r@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    791779942,
    'Ricardo Diogenis Mocock Fonseca',
    '09493781437',
    '81997225967',
    'ricardomocock@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    792304196,
    'Willian zang machado',
    '07771739997',
    '45998435274',
    'willian_zang@outlook.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    794817501,
    'Cristiano Cosme Silva',
    '07531755688',
    '31993819559',
    'cristianosilva484@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    797491453,
    'Francisco miguel de Andrade neto',
    '12073276466',
    '83996467554',
    'Andradenetoneto@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    798106196,
    'Eduardo Graciano santos',
    '38309099851',
    '11942665616',
    'Fernandotecmec@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    798318848,
    'Lucas oliveira',
    '41755623895',
    '16997292722',
    'Lukedesiderio@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    798396258,
    'Igor Santana do Nascimento Barreto',
    '06535177505',
    '73988493654',
    'igorbarretto777@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    799450317,
    'Yan Dias',
    '46717930837',
    '11988781784',
    'ghost.mw4@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    800334600,
    'Alex Teixeira Bezerra',
    '06093344509',
    '71988234230',
    'alexteixeira08@yahoo.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    800947031,
    'Victor Gabriel Alves Ferreira',
    '09720778989',
    '41995934178',
    'Victor.gabriel10@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    801424831,
    'Iago Rafael Silva Teixeira',
    '16157542705',
    '21968006163',
    'Iago.r.silva@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    801916618,
    'Diogo Mendes Cavalcante',
    '86531275502',
    '71988333564',
    'Trevolodio@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    803579368,
    'Diogo Ferreira da Silva',
    '44710647895',
    '12988435611',
    'ferreiradiogo607@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    803808471,
    'Wesllye Guedes da Silva',
    '46427662864',
    '11945557673',
    'wesllye.guedes@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    803997330,
    'YSLAN DOS ANJOS SILVA',
    '07512859511',
    '79996779332',
    'Yslan200@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    804486635,
    'Danilo Bento da Silva',
    '12781620971',
    '43998073621',
    'bentodanilo864@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    804577465,
    'Antonio Danilo Gomes',
    '12205459880',
    '17996372988',
    'jeffersonfelix001995@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    804880432,
    'Rone Duarte Sampaio',
    '02438678240',
    '69993231617',
    'roneduarte7@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    806063372,
    'Gyan Luca Ramos',
    '09604058959',
    '41998790442',
    'gyanlucaramos@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    806199239,
    'Juan Fernandes Lamas Hermida de Mesquita',
    '17465210747',
    '21971307335',
    'juan_lamas_mesquita@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    806312974,
    'Wesley obnesorg',
    '33586210817',
    '15981281416',
    'Wesleyobnesorg@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    807140961,
    'Dayane Guimarães da costa',
    '16134314730',
    '21964646242',
    'roneydantaspink3@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    807432843,
    'Antônio Hitalo Freire',
    '06462954388',
    '88992300900',
    'investimentoseguro19@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    807862969,
    'João Victor Menezes Pinto',
    '16431416783',
    '12997768559',
    'jotavictor97@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    808668415,
    'Daniel Chagas de Andrade',
    '51603740864',
    '12991368689',
    'danichagas2002@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    808739491,
    'Carlos Silva',
    '27605179006',
    '51985244803',
    'carrochoque@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    809416024,
    'Ricardo farias jansen',
    '05720590358',
    '61998137563',
    'ricardojansen320@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    809754492,
    'Gustavo de Aguiar dos anjos',
    '08733867950',
    '41987873116',
    'gustavoadosanjosspam@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    810257338,
    'Giovani Antônio de Souza',
    '06405183971',
    '47992815153',
    'Giovanisouza1989@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    810801557,
    'GABRIEL SIEPMANN Chaves',
    '11739112946',
    '46999230718',
    'gabrielchaves.capanema@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    811073286,
    'Leonardo Gomes de Oliveira',
    '13921885710',
    '51995359764',
    'Leogomeesolive@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    811191746,
    'Ailton Alves da Silva Júnior',
    '08469846442',
    '81998327904',
    'Juniorpancadao007@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    811726226,
    'Josué Luiz Almeida',
    '05582831959',
    '49998122127',
    'Almeidinhacustom@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    811901566,
    'Enio Felipe Freitas da Silva',
    '06629565401',
    '92999949560',
    'eniofelipe22@outlook.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    812925534,
    'Luciano Gomes Santiago',
    '01571891200',
    '92982192802',
    'Lucianoicloud1@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    813376793,
    'Nilton Botelho',
    '10213185407',
    '81996009222',
    'Niltonbotelhoti@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    814371185,
    'Douglas oliveira',
    '49896638888',
    '11966633535',
    'Douglas.julio29@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    814411566,
    'RONIVALDO DE ALMEIDA Campos',
    '10724981977',
    '48988155057',
    'Ronialmeida313@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    814642578,
    'Janaina Alves sous',
    '70072477687',
    '37999830260',
    'vecchipedro@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    815174102,
    'Evania Rodrigues da invenção',
    '05304081552',
    '77999450429',
    'evaniarodriguez-@Outlook.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    816825052,
    'Gabriel Pupo',
    '47226383810',
    '12981988066',
    'Gabrielpupo26@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    817077184,
    'Sandro victor',
    '05739277582',
    '11952969285',
    'Brabohp@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    817995185,
    'Se',
    '52096571081',
    '14981323459',
    'Megamente@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    818459169,
    'Luiz Onofre',
    '02338522800',
    '11997399705',
    'luiz.onof66@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    818627883,
    'Monique da Silva Lourenço',
    '11548544779',
    '28999055941',
    'dufirmino@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    820012582,
    'Agonoliveira',
    '08244347570',
    '73981679655',
    'agonoliveira362@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    820018053,
    'Italo Basilio da Silva',
    '38751235811',
    '19974030169',
    'Italoinvestforex@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    822023610,
    'Felipe pedrazza grunwald',
    '05794971517',
    '79998907694',
    'rs98893757@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    822196337,
    'Yago Lima Capistrano',
    '07112839319',
    '88998311944',
    'yagolimacapistranho@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    822929112,
    'Anderson Sodre de Almeida',
    '39048815827',
    '11986268386',
    'Andersonvsa2010@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    823655884,
    'Jonathan José de lima',
    '38164570885',
    '11997626711',
    'jonathandroid18@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    824652255,
    'Gerson Soares da Silva',
    '34065131820',
    '19993838188',
    'Gerson.soares.silva@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    824982952,
    'Pedro Neto Anacleto Costa',
    '13885328674',
    '37999288527',
    'pedro.minasca@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    826537010,
    'Elione littig',
    '20675401739',
    '27992654316',
    'Elioneittig@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    827017406,
    'Pablo Michael Alves Rodrigues Nascimento',
    '08844176629',
    '37999092459',
    'mcphabulousoficial@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    827200892,
    'Amiel Magalhães Santos',
    '00636115208',
    '91980306131',
    'amixmagalhaes@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    827633776,
    'Ayres Junnior Minholi Maciel',
    '04972888180',
    '67999010141',
    'ayresmm08@outlook.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    828520408,
    'William nascimento de melo',
    '38172072805',
    '11963903429',
    'William.melo8787@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    828857327,
    'Danilo Antônio Souza de Omena',
    '12534111400',
    '82988362801',
    'daniloalgm@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    829384925,
    'José Marcelo de Albuquerque lima',
    '11295673460',
    '81996770663',
    'marceloalbuquerque122@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    830228846,
    'Fernando yago de Oliveira',
    '05845642361',
    '85987148139',
    'nando-g4@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    830260139,
    'Alan Martins da Fé',
    '39024939844',
    '15996645651',
    'alandafe@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    830497010,
    'Leticia Lorena Oliveira Santos',
    '11982366630',
    '31991689993',
    'leticialorena1993@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    831209704,
    'Eric Azevedo Rosa da Silva',
    '41669170802',
    '11952336742',
    'eric.a.r.s@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    831277985,
    'Pablo rhuann Freitas Ribeiro',
    '11691773441',
    '62986347573',
    'Sobrateste@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    832253047,
    'Everton b',
    '01496940083',
    '47992302653',
    'Evertonbarbosa.tixo@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    833540128,
    'Jorbson Oliveira',
    '04519215501',
    '71982330370',
    'jorbson.mkt@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    834213309,
    'Isaac Santos Souza',
    '05965226578',
    '73988986834',
    'zath_ss@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    834372173,
    'Luan dos Santos',
    '03473787060',
    '53981404360',
    'luansasi@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    834514288,
    'Luiz Fernando',
    '46252580813',
    '19995171360',
    'luiz.classea@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    835758928,
    'Bruno Yuri Ian Fogaça',
    '18628254323',
    '45991904791',
    'bbrunoyuriianfogaca@associate.com.br',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    838047950,
    'Gabriel José Nicácio Marques',
    '71007224460',
    '81989886380',
    'gabrieljosemarques@outlook.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    838196493,
    'Anderson Domingos da Silva Serafim',
    '14224973723',
    '21990355140',
    'domingosanderson46@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    839813535,
    'Leonardo Kons Curcio',
    '09787972990',
    '48996347723',
    'Leonardokons2712@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    840535580,
    'Ezequiel Rodrigues da Silva',
    '46066798839',
    '11977329903',
    'ezequiel.rodrigues.mkt@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    841510384,
    'Jose carlos neto',
    '25242916001',
    '81996580195',
    'Legolixx@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    843225994,
    'CARLOS VITOR DA SILVA SOARES',
    '11330661788',
    '22997846508',
    'carlosvitorsilvas@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    843542427,
    'Fernando Mateus Custodio',
    '70349985154',
    '62994843299',
    'ferluxbr@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    844332264,
    'Bruno Gomes Moreira dos Santos',
    '42575380820',
    '13996693295',
    'uknowloks@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    844857054,
    'Adbison melquiades Roberto',
    '05034196131',
    '62995703657',
    'Brucybarroso@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    845355349,
    'Niel Godoy Silva',
    '10849987695',
    '11966253816',
    'Niel_godoy18@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    845912981,
    'Renan Augusto Neves',
    '37981681804',
    '17996817772',
    'renan2_augusto@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    846059658,
    'Joao pedro Magalhães neres Gomes',
    '07303839119',
    '63984241122',
    'Joao-2001@bol.com.br',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    848118929,
    'Victor Caio',
    '60411103377',
    '98988528125',
    'Victorcaiodesouzas2012@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    848134897,
    'Everton Isidoro Santos',
    '02484300506',
    '73991914448',
    'ev.isidoross@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    848599737,
    'Pablo Henrique Rodrigues de Freitas',
    '09231921150',
    '61993661262',
    'pablo2090@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    849329483,
    'Lucas rocha alves',
    '06778938170',
    '63992601994',
    'Lucasaarr90@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    849374029,
    'Leonardo Lopes dos Santos',
    '31117488802',
    '11972763366',
    'leonardo.lsantos14@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    849543913,
    'Ewerton da Silva Marques',
    '18276088708',
    '21983854090',
    'ewertonm451@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    852030598,
    'Ricardo Magedanz',
    '04234872059',
    '55996496857',
    'Ricardomagedanz489@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    852181287,
    'Rafael mateus Araújo',
    '07526066462',
    '11948060567',
    'Rafael_mateus07rm@outlook.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    852270204,
    'Matheus Sousa Almeida',
    '18710660771',
    '21983021312',
    'Almeida12342021@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    855960908,
    'Marcelo Vinicius Cius',
    '11234643910',
    '41984397346',
    'marcelovinicius408@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    856444766,
    'Dheydson Silva Pereira',
    '03534603540',
    '73999602569',
    'Espetosdj@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    856505339,
    'Leonardo Pereira Rocha',
    '12980550671',
    '35999956311',
    'leoepccc.rocha@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    856958843,
    'Ismaley dias',
    '87491788220',
    '85996615480',
    'Ismalleydias@yahoo.com.br',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    858090968,
    'Marlon Andersen de Jesus Castro',
    '97853119291',
    '92984251084',
    'macastro.ander@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    858582737,
    'Leonardo Madeira Do Nascimento',
    '10896065758',
    '21967610045',
    'Leomadeira03@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    859824954,
    'Vinícius Trindade de Lima',
    '11180832450',
    '84996272088',
    'viniciustrindadesm@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    860046145,
    'gleidson oliveira macedo',
    '62882729227',
    '38991954285',
    'gleidson_oliveira@yahoo.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    861084944,
    'Vagner da silva dantas',
    '06679607590',
    '75998230155',
    'Vagner.burao123@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    862085948,
    'Marco Aurélio',
    '10252420683',
    '34999361699',
    'iptvudi@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    862274800,
    'Tiago dos santos',
    '07334393902',
    '44991499431',
    'ts60235@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    862500137,
    'Gabriel Medeiros de Oliveira',
    '53321172801',
    '11972576630',
    'gabriel.fit.thai@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    864379554,
    'Roberta Cunha',
    '47557016866',
    '11973484682',
    'Robertacunha1801@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    867161537,
    'Thalisson Abmael e Sá Muller',
    '10746794908',
    '46999324643',
    'thalissonabmael@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    868740551,
    'Rosiane Carlos do Nascimento',
    '04488171362',
    '88989812226',
    'Rosecarlos@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    868775954,
    'Marco Antônio Fragnam',
    '40278584845',
    '11984004818',
    'marcoaf92@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    869492134,
    'Diego Alejandro zerbinate passos',
    '49868681871',
    '19984183382',
    'Diegopassos2799@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    869592775,
    'Luiz Fernando da Silva leite',
    '21034402005',
    '15991300063',
    'lzfrnndleite@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    871063660,
    'Ronaldo Braga da Costa',
    '02539944205',
    '92995017455',
    'Ronaldobraga08@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    872061162,
    'Jaciel Bruno dos Santos bezerra',
    '09351438406',
    '87996060861',
    'Brubruno_showbc@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    874462507,
    'Maria Eduarda Mendes',
    '14335975600',
    '32999937097',
    'duda.mendes.456@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    874524962,
    'Emerson Fernando Silva Da Rosa Dos Santos',
    '04403155065',
    '54999469973',
    'fernandoemerson025@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    876141672,
    'Michel Douglas da Cunha Oliveira',
    '09785327914',
    '47989094111',
    'micheloliveiramg@hotmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    877402571,
    'Mateus de Jesus Garros Abreu',
    '05425866305',
    '98983307306',
    'mateusabreug20@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    877889827,
    'Henrique Lemos de Oliveira',
    '04277755232',
    '93992075494',
    'Henriquelemosabcd@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    877917241,
    'RIAN DA SILVA MARQUES',
    '61823743307',
    '88993398124',
    'rian.silva.tv@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    879487441,
    'Matheus Henrique de Sousa',
    '05940712320',
    '86999150715',
    'mhs.mhs04@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    881381453,
    'Monalizi Tataine Moreira Consoniche',
    '42535152827',
    '16993253925',
    'Mona_moreira@yahoo.com.br',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    882792713,
    'Clebeson Conceição Menezes',
    '37270943893',
    '19982876193',
    'clebesonartigos@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    883069588,
    'Igor',
    '06811123109',
    '61993708210',
    'igormedeiros.f@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    883178698,
    'Yury Lins Gomes',
    '10886832403',
    '82987045349',
    'yurytrader22@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    883793843,
    'Tamires Felippe Sousa',
    '36850177800',
    '17996254064',
    'Tamires.felippe@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    883804474,
    'Guilherme Henrique Dias',
    '07790195123',
    '67984044264',
    'guilherme.henrique.dias.moreira@hotmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    884898669,
    'Roberto dias dos reis',
    '07353228644',
    '61996133029',
    'goiasacessorio@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    885656427,
    'Isac Rosendo de Oliveira',
    '15398821601',
    '35997140010',
    'kellyccb2023@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    886022084,
    'Felipe Garcia',
    '40413037886',
    '19996291656',
    'feh_skull@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    886515368,
    'Maxravel ribeiro oliveira',
    '86529564560',
    '75988097550',
    'irineug2a008@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    888679130,
    'Leandro Menezes Rocha',
    '10752926624',
    '38988088982',
    'leandromrochamoc@bol.com.br',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    889268091,
    'Matheus Lucas brum',
    '19868084083',
    '51984538908',
    'Matheus.maluco@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    890224828,
    'Gabriel Silva',
    '29518738831',
    '86988051811',
    'vitor_vieira2012@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    890394272,
    'Bruno de Souza',
    '08083000914',
    '47996740947',
    'ironnsoldier@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    890402446,
    'Gabriel de muzzio',
    '44091903851',
    '16993701167',
    'Gabriel.muzzio@outlook.com.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    891097621,
    'Germano cavaleiro de miranda neto',
    '03625414260',
    '96981196876',
    'Germanoneto190@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    891472626,
    'Tais Aguiar Da Silva',
    '03981368312',
    '86981382037',
    'Pr828382@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    891622784,
    'Itanael dos Santos Gabriel',
    '97461679368',
    '99991119905',
    'iatanael.criolo@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    892438720,
    'Wesley Weiss Rangel',
    '05633675126',
    '65996183883',
    'Wesleyrangelmm@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    892654569,
    'João Eduardo Snaihtniroc Rossi',
    '11435336909',
    '43998258802',
    'joaoeduardorossi5@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    893628963,
    'Antonio  Henrique Quintino Pereira',
    '46581239836',
    '11997176885',
    'Antoniohenrique.q1@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    893935911,
    'Rafael Costa Brito',
    '05641745308',
    '99991861510',
    'rb5431745@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    894038753,
    'Lucas Ribeiro de Albuquerque',
    '13749924708',
    '27992265954',
    'l.rialbuq@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    894291550,
    'BRENO VIEIRA SOUSA',
    '86449722517',
    '77988123859',
    '3vieirabreno250@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    894762155,
    'Marcos Vinicius Emanuel Nogueira',
    '22257976843',
    '18996898869',
    'rznclapointblank@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    895081250,
    'Diego Araújo',
    '02655544030',
    '51995583690',
    'diegofjuuniversal@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    895394427,
    'Adriano Leite Ferreira',
    '41577988809',
    '11995723183',
    'adrianoferreirawf@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    895503169,
    'Rafael Albuquerque',
    '11880779455',
    '11959040870',
    'Eu.trader.rafael@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    895752173,
    'Pedro Emanuel da silva',
    '12733379992',
    '43988124288',
    'Pedroemanuel190@outlook.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    897203119,
    'Jose carlos ferreira junior',
    '10916432963',
    '41992888577',
    'Juuniorjose@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    897598176,
    'Allan Cardoso da Silva',
    '49432098826',
    '11983680369',
    'allan.cds55@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    897868819,
    'Guilherme Ferreira',
    '41889107808',
    '15996275022',
    'Guiferreira@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    898986476,
    'Luis André Ribeiro Oliveira',
    '14256001743',
    '21974275351',
    'l.andre_oliveira@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    899363558,
    'Roberto Hermann',
    '21664894861',
    '11988022566',
    'Hackersanonymos6@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    900232553,
    'Erci Lucio Conte',
    '00750773022',
    '55999382783',
    'ercilucio@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    900433868,
    'Talita de Jesus Santos',
    '08819028530',
    '75982827638',
    'nan.dopeixoto.nando@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    900795237,
    'Gabriel Fernandes Silva',
    '44326612835',
    '19993325649',
    'Ga.fernands@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    901184347,
    'Gustavo Henrique de Souza Silva',
    '02677763141',
    '62992340054',
    'gustavoeng.civil7@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    901423546,
    'Gabriel de Araújo Rodrigues',
    '15826853719',
    '21966037194',
    'Gsps2@live.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    901428497,
    'Renê Sousa Franco',
    '92406963268',
    '91982919075',
    'rene.franco.famed@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    901995152,
    'Lucas Volpini',
    '09617758903',
    '43998037897',
    'lucas_volpini@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    902255103,
    'Renildo Gomes de Souza',
    '07403215524',
    '19999586464',
    'renildog7@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    902512986,
    'Jeferson Mendes',
    '04405320942',
    '67999281803',
    'Jefersomendescdr@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    902762427,
    'Thiago da Silveira Ribeiro',
    '70940522195',
    '62994441841',
    'theitachipllay@icloud.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    903092397,
    'Ana Carla Moraes Nascimento',
    '06829647193',
    '63999591563',
    'anafreepaulafire@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    903177145,
    'Richard Ramos',
    '14588993739',
    '22997231512',
    'richardramoses@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    903422088,
    'Kauan Henrique da Silva Garcia',
    '42914441843',
    '18997614038',
    'kauan_henrique@outlook.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    903714679,
    'Tiago Henrique dos Santos gois',
    '15922964402',
    '81994680613',
    'tiagohenriqueee20@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    905051155,
    'Caíque Alberto Maciel Bonifácio',
    '11726214621',
    '35999617022',
    'caiquebae2008@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    905056242,
    'Murilo de Oliveira Freitas',
    '82319486860',
    '11960333692',
    'mz.games.look@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    905590102,
    'Gianluca Bontempo Magalhães',
    '01521531285',
    '73981989909',
    'gianlucabontempo172@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    906307991,
    'Luiz',
    '05795830151',
    '65996936977',
    'guilhermelupespb@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    906846357,
    'José Gomes de lima filho',
    '70590723499',
    '83981572355',
    'zefilhoifpb7@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    908932123,
    'Marcelo de oliveira silva',
    '06400802940',
    '44997726633',
    'Deoliveirasilvamarcelo70@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    909015121,
    'Aderbal Edson da Costa Júnior',
    '46514575846',
    '19994263751',
    'aderbaledson@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    909163470,
    'Jhony Santos Martiniano',
    '37613417840',
    '12997542142',
    'Jhony_litoral@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    909612116,
    'Lucas Lopes da Silveira',
    '46973309860',
    '11940754895',
    'lucaslopessilveira1297@outlook.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    909735198,
    'Wanderson Furtado de Almeida Inglês',
    '01358196281',
    '96991981701',
    'waandersoon.ap1@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    909947122,
    'Hercules borges',
    '02699196002',
    '51991457951',
    'herculesborges333@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    910499587,
    'Whender de Almeida Alvarenga',
    '09945682741',
    '22998771491',
    'whender97@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    910687222,
    'Lucas Henrique Santos',
    '10193118947',
    '04591142071',
    'lucash1303@outlook.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    910779055,
    'Nicholas Regis Araujo Falcão',
    '15513802775',
    '21970309454',
    'nicholasfalcao.nf97@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    911199692,
    'Arthur Souza Viana',
    '11949507955',
    '48996653712',
    'arthursv03@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    911211098,
    'Wilton Inácio Ferreira',
    '09132633467',
    '81983307221',
    'wiltoninacio1636@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    911626993,
    'Erison Gomes dos santos',
    '03530771350',
    '86994247026',
    'Erisonbratio@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    911830757,
    'Josemar Gomes Martins Junior',
    '08230346151',
    '66992179919',
    'josemarbarra12@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    912060486,
    'Daniel salles de souza',
    '04529591280',
    '92996128490',
    'dani.salles2@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    912206131,
    'Henrique Lima Guerreiro',
    '40031803806',
    '11970203067',
    'Lima_henrique10@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    912356698,
    'Rafael Medina de Lima',
    '00958920010',
    '51997844008',
    'Rafinhamedina11@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    912683802,
    'Rodrigo Oliveira Maciel',
    '92357091568',
    '73981239055',
    'Rodrigoitabuna3@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    912713119,
    'Felipe Vasconcelos',
    '11296136906',
    '47997298350',
    'felipevasconcelos137@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    912831989,
    'Valdir Fernandes Pereira',
    '38865314818',
    '17981102755',
    'valdirfp7@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    914973197,
    'Andrei Erivelton falcao',
    '01062825063',
    '45999363963',
    'andreifalcao100@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    915154164,
    'Edenilson ramos veber do nascimento',
    '10700297936',
    '49999501631',
    'Edecapoeira@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    915389405,
    'Israel Oliveira dos Santos',
    '08903918584',
    '77998377350',
    'Israeloliver16.io@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    915468684,
    'Filipe Silva de Oliveira',
    '15336796735',
    '21996667557',
    'Filbiersack@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    915510724,
    'Hugledson Paulino De Franca',
    '60425085392',
    '88981121456',
    'hugledsonpaulino355@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    915710509,
    'María dilva Pereira Ramos lima',
    '30458579300',
    '99991213354',
    'fawanteixeira01@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    916297675,
    'Thiago ribeiro pinheiro',
    '44610499819',
    '11975021649',
    'Thiago.pcc@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    916626762,
    'Eduardo Guimarães',
    '16021374711',
    '21996690996',
    'edugchi@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    917146065,
    'Renilson dias Soares',
    '02148940619',
    '38988186858',
    'Nildias606@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    917195837,
    'Gustavo henrique souza telles',
    '13653984637',
    '31971460769',
    'Gh48586@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    917693469,
    'Leone Aparecido Paes Lopes Barbosa',
    '35161300833',
    '11988961084',
    'leolopestrader255@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    917760799,
    'Alexandre Rodrigues Silva',
    '06793068113',
    '61981549278',
    'hutcit5158@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    918228159,
    'José Augusto de Macedo xavier',
    '70828382476',
    '84991481646',
    'augumacedo@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    918917618,
    'José lucas bezerra Martins',
    '06682849354',
    '88981564445',
    'lucasmartinsflamengo10@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    919943035,
    'Jackson Luiz Tavares De Oliveira',
    '18675722737',
    '21968163072',
    'Wangleyanjos15@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    920438118,
    'Diogo Rodrigues Santos',
    '14986341766',
    '21997390363',
    'Diogodjsx@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    920602878,
    'Pablo rodrigues alves ferreira',
    '07597464517',
    '79996920486',
    'Pablorodriguesoficial120@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    921362875,
    'paulo henrique S. lino',
    '07123235118',
    '67991706103',
    'phph1396@icloud.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    921465143,
    'Wilson Junior',
    '03035992517',
    '77999789188',
    'juniorcrf_360@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    921624584,
    'Joeferson ferreira dos santos',
    '14924728756',
    '22996186867',
    'joeferson.ferreira@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    922324575,
    'Marcelo Cardoso',
    '39669520843',
    '19999443166',
    'Marelo.apcardoso@outlook.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    922405644,
    'Pablo souza',
    '12253149764',
    '21980262005',
    'pa993557@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    922903225,
    'Pedro Elias Edson Cavalcanti',
    '43282405871',
    '11991164951',
    'ppedroeliasedsoncavalcanti@budsoncorporation.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    923769783,
    'Nilce Vilma Caldas Oliveira',
    '47356969890',
    '11992418288',
    'nilce_caldas@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    924030719,
    'Gabriel sousa Muniz linhares',
    '03252096340',
    '99984838689',
    'Gabriel.messiasgod@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    924212899,
    'PAULO CYSNEIROS DE OLIVEIRA NETO',
    '06610998493',
    '81996753008',
    'paulo.cysneiros@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    924532140,
    'Roberio Silva dos Santos',
    '06742328525',
    '75992872058',
    'roberio_guita@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    926655551,
    'Laércio SILVA Costa Moreira',
    '18624940702',
    '21986588129',
    'Laercio_kbka@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    926681513,
    'Leandro Barbosa de Souza',
    '70192709640',
    '61998528449',
    'clwjogando9@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    927144314,
    'William Gabriel della torre',
    '47720907892',
    '19998456370',
    'willdellatorrevlogs@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    928019448,
    'Nícolas Emanuel Rodrigues de Oliveira',
    '09553656439',
    '87996368752',
    'nicolas98247225@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    928249329,
    'Salatiel Duailibi',
    '04481430117',
    '67984282583',
    'salatielduailibi3@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    929837950,
    'Thalles henrique',
    '70131374133',
    '62991915743',
    'Thalles.henriq2@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    930280791,
    'Larissa Soares de Oliveira',
    '13837488616',
    '34988830521',
    'lara2010-str@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    930387008,
    'Francisco José Martins',
    '02544383348',
    '85992203638',
    'fcojosemartins25@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    930413978,
    'Ramon Barbosa Costa',
    '55304591291',
    '91989001720',
    'ramonbarbosa2909@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    930726201,
    'Guilherme Henrique de Oliveira',
    '13402600692',
    '34997937498',
    'guilherme_henrique_2009@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    931686773,
    'Emanuel do nascimento barbalho',
    '70739711423',
    '84994237685',
    'Camaramateus57@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    932969293,
    'Sidney puccinello',
    '17443144709',
    '22992711892',
    'sidney_puccinello@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    933058846,
    'Patrik Lorran',
    '09202910901',
    '41995262887',
    'patriklorran@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    933185153,
    'Patricia Soares Barbosa',
    '05208422948',
    '47995084227',
    'percyjuliano1@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    933721914,
    'Kacio Oliveira Rodrigues',
    '04415693156',
    '61995714521',
    'kacio956@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    933934774,
    'Felipe Oliveira',
    '46409710879',
    '11933489552',
    'Oliveirafelipe465@yahoo.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    934596645,
    'Lucas Silva',
    '57041204820',
    '11988886543',
    'lucasalces@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    936046192,
    'Theo césar Ramos',
    '15015216750',
    '95991159503',
    'juniorsilva72710@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    936666923,
    'João Vitor polidoro',
    '32853805867',
    '85981236025',
    'joaovitorpolidoro18@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    937032571,
    'Jeremias Pereira da Silva',
    '52525871839',
    '11947723947',
    'contato.gabrielperess@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    937547831,
    'Sidney Alexandre paixão dos santos',
    '41145503802',
    '11957159695',
    'alehpaixao58@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    937593994,
    'Luciano da Silva de Jesus',
    '03682912002',
    '51983348724',
    'lucianodsdj008@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    937888069,
    'Alex Garcia da Silva',
    '70057220433',
    '83988967433',
    'alex_23silva@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    939572060,
    'David Henrique',
    '45103363810',
    '47991771131',
    'david.contas2@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    939955024,
    'Elias Douglas Lima Silva',
    '37535279805',
    '13997824098',
    'eliasdouglas12@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    940510862,
    'Talita de Oliveira Gonçalves',
    '70227923642',
    '34999320849',
    'traderimpdtalita@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    940804690,
    '/canais',
    '70249013223',
    '98984367151',
    'msvdjq3929@faxapdf.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    940891159,
    'Claudeir junior queiros gomes',
    '11729296700',
    '27998841390',
    'Juninhogolf@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    941061388,
    'Dackson Cleber dos santos',
    '04577702959',
    '44999644998',
    'dackson@jmxcorretora.com.br',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    941115774,
    'Valdir Dos Santos Costa Júnior',
    '03595305086',
    '53984544463',
    'Juhsantos19943366@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    941284983,
    'Higor Rodrigues Portella',
    '15483432770',
    '24981382221',
    'higorrodriguesportella@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    941331661,
    'Edgar Lucas Flaviano',
    '93000753060',
    '31992741254',
    'edgar.unibhuth@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    941470166,
    'Felipe Cavalcante de Carvalho',
    '02375376307',
    '86999822897',
    'felipe@mcarvalho.com.br',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    941846668,
    'Leonardo Alves da Silva',
    '10633805963',
    '43991971374',
    'lol.silva-alves@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    942081824,
    'Diego Silva Almeida',
    '10796866490',
    '87996804974',
    'Diego_silva08@yahoo.com.br',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    942111167,
    'Rafael Vieira Ribeiro',
    '11324246740',
    '21964631649',
    'rafael_vribeiro@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    942177816,
    'Douglas Henrique Xavier Silva',
    '25843503194',
    '21984028922',
    'hackezzizyeasy@email.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    942874599,
    'João Gonçalves de sousa neto',
    '06299648317',
    '88999346592',
    'Jneto5786@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    943177350,
    'Jaidir silva',
    '26842185017',
    '47999888602',
    'Fernandoschell406769@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    943473546,
    'Jefferson Willian Tavares de Oliveira',
    '01622503201',
    '92992929806',
    'jefferson_harper@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    943665738,
    'Kelmax Quaresma cruz',
    '06943431293',
    '94991749850',
    'Kelmaxcruz123@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    943999317,
    'Diego Arcanjo Virgínio Silva',
    '03726183167',
    '61986794930',
    'diego.upis@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    944278625,
    'Samuel Pedro Alves da Costa',
    '50332920801',
    '11961653481',
    'samuelpedroac@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    945443154,
    'Vinicius Richta Almeida',
    '49558961892',
    '15996491683',
    'vrichta16@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    945572622,
    'Bruno Martin',
    '08685130913',
    '44988273962',
    'judaschef@outlook.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    946226914,
    'Israel carvalho marques',
    '20331885743',
    '24998829627',
    'israel.carvalho3536@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    946370841,
    'Weslley santana',
    '12273725906',
    '47992684227',
    'Weslley2016@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    946826824,
    'Carlos Machado',
    '12178434690',
    '31973622827',
    'Carlosparatrader@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    946839248,
    'petterson Tarley Marques dos Santos',
    '03365470131',
    '62985601075',
    'pettertarley@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    947087615,
    'Janderson de Almeida Santos',
    '06267196747',
    '27998155854',
    'trabalho10293@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    947101033,
    'Weder Rosa Dias',
    '70213840170',
    '62999038278',
    'Weder-dias410@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    947692508,
    'Raphael Antonio Daumas Peçanha Moreira',
    '73061727191',
    '13996515054',
    'rapmor@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    947984648,
    'Otávio Gomes Rocha',
    '01059809192',
    '67991941434',
    'gomesotavio0@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    948290992,
    'Gabriel Carvalho',
    '18384092702',
    '22997695512',
    'Gabrielcarvalho034@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    948645350,
    'Jachson Miranda da Silva',
    '01776727304',
    '99984878209',
    'jachsonm4@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    948709609,
    'Maick de Melo Matias',
    '70567593193',
    '62992640788',
    'maickmatias2@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    948830133,
    'Mattheus lopes',
    '05934570137',
    '61995370224',
    'Mattheuslopes4@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    949004631,
    'Paulo Alves de Moraes Junior',
    '00413588211',
    '41985041100',
    'pauloalvesdemoraisjunior@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    951382693,
    'Jonata Luiz',
    '46180817839',
    '16992143243',
    'Jonata21luiz@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    951644525,
    'Renier pantoja serrao',
    '70322277167',
    '62992782003',
    'canalmundotecnologico@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    951656134,
    'José Renato Leiria Cassiano',
    '06028353132',
    '66992185655',
    'joserenatoleiriacassiano@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    953049773,
    'Bruno Fortes',
    '00490505244',
    '47997070955',
    'brunofortesdesouza1@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    953454183,
    'Renan Cachoeira',
    '09644522940',
    '47997557245',
    'Cachoeirarenan98@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    954300894,
    'Rodrigo Debatin',
    '06465094975',
    '47991379613',
    'Rd91379613@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    954443297,
    'Henrique Rodrigues',
    '11716467985',
    '49991895090',
    'rodrihenrique1901086@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    954498811,
    'Leandro dos Santos Brito',
    '03271298327',
    '42998232007',
    'leanndrobrito2020@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    954866792,
    'Zayne Fábio Silveira da Silva',
    '13888507707',
    '28999059266',
    'zaynesilva2003@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    954983778,
    'Dylvan de Oliveira da Silva',
    '03681385181',
    '82988344805',
    'dylvan123@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    955747363,
    'Dalton Eric Biguelini',
    '04463856035',
    '51982435599',
    'Daltoneric@hotmail.com.br',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    955912843,
    'Capgiano de Sousa',
    '00342350358',
    '85988537368',
    'capgianoss@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    955955594,
    'William Koiti Watari',
    '39253890835',
    '11954904205',
    'Will_fiel@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    956590884,
    'Rafael Maximiliano de assis',
    '10312015640',
    '31988886877',
    'Rafaelbrasilceramica@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    957474314,
    'John herbert martins dos santos',
    '42065308826',
    '14998854031',
    'John.herbert.martins@outlook.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    959085522,
    'Weberson santos costa',
    '01624641695',
    '32999777290',
    'webe1989@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    959218869,
    'Cyrle Bastos Neto',
    '15859558767',
    '27992746505',
    'cyrle.bastos@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    959636369,
    'Bruno da Silva Fernandes',
    '39745598259',
    '31971484380',
    'BrunoFernandes87@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    959817335,
    'Tiago Sousa Moreira',
    '03198389194',
    '61993340787',
    'Tiagosmbrasil@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    960738113,
    'Daniel costa santos',
    '13206807638',
    '38992038494',
    'Dmaiorsp11@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    961077308,
    'Calixto de Souza Santos',
    '48091351879',
    '11950836697',
    'calixtosanttos551@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    961893449,
    'Eliana de Jesus Santos',
    '50733263852',
    '13997854095',
    'Elianasantosrock@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    962059051,
    'Sarah Oliveira de Lima',
    '37889246838',
    '11959977328',
    'laralucas1953@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    962072655,
    'Lécio Lanjoni Ferreira da Silva',
    '39340509803',
    '17997692503',
    'escritafiscallecio@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    962130903,
    'Luan da Silva Mello',
    '02278604031',
    '55991658313',
    'Luandasilmello@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    962234638,
    'Ismael Rodrigues Da Silva',
    '14524566406',
    '87999659563',
    'Irismael96@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    962304100,
    'Vinicius Tiago Cardoso',
    '80558327575',
    '77988410265',
    'jose01tn@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    962437152,
    'Vitor Gusmao',
    '15185216735',
    '28999408642',
    'vgacademyoficial@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    962489691,
    'Misael ferreira',
    '05114833251',
    '94992779227',
    'misaelmotovlog189@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    963092305,
    'Leonardo Augusto Silva Lima',
    '11494975645',
    '35998047822',
    'leonardo.eng.lima@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    963353364,
    'Vinicius Vaz',
    '14973404705',
    '27998708553',
    'vazpenna@outlook.com.br',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    964243100,
    'Carlos alberto',
    '02911203933',
    '47984657634',
    'Carlosalberto321@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    964268256,
    'Luciano dos santos',
    '15871457827',
    '19991020502',
    'leonardodepaulabernardo@outlook.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    964607377,
    'Welbert da paz Fernandes',
    '04465983565',
    '73999612583',
    'welbertdapraca@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    964672897,
    'Paulo vitor m silva',
    '70112048145',
    '62993357845',
    'Hdpaulo10@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    964849482,
    'Leontino Bruno Bandeira Lima',
    '07344009188',
    '63992412201',
    'Leontinobruno18@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    964941374,
    'Diego ram9s',
    '12874998729',
    '24998690764',
    'Diegoramoos@hotmail.co',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    965005778,
    'Emerson Expedito de Oliveira Ribeiro',
    '13989433636',
    '35998221691',
    'ribeiroemerson010@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    965751687,
    'Robson Monteiro de Carvalho',
    '07310490126',
    '61996163374',
    'robfla97@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    965761356,
    'Pablo Vinício Alves de moura',
    '04179355108',
    '62985665559',
    'pabloviniciodiamante@outlook.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    965762936,
    'Douglas Vynícius Monteiro Braga',
    '06487144118',
    '61994570027',
    'douglasrudy99@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    965764508,
    'Junilson Rafael Martins Souza',
    '03674934388',
    '95991108613',
    'junilsoisbl@hotmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    966270652,
    'Maria Eduarda b',
    '11119576490',
    '84991964284',
    'Eddduardabandeira@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    968332347,
    'Alisson Mendes',
    '08678808993',
    '42991487991',
    'alissaum.13@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    969126761,
    'Felipe aranha dos reis Fontoura',
    '02294531124',
    '62996799705',
    'felipeafontoura@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    971575646,
    'Cristiano de Moraes Ribeiro',
    '36712810817',
    '18981266029',
    'Neguinho.delicia@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    971618937,
    'Lucas Francisco Santos Souza',
    '46620670814',
    '11973578287',
    'lucasfsantossouza@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    972699049,
    'Vinícius ramos Dos Santos',
    '92540164030',
    '71997359588',
    'felipe.m.030820@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    973003325,
    'Flavio leite Oliveira',
    '13088879650',
    '37991576059',
    'flavioleiteoliveira@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    973290838,
    'Rosivaldo da silva barbosa',
    '02024112226',
    '64999464620',
    'Pretocopy@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    973823600,
    'Rafael Sousa Da Silva',
    '61064662382',
    '86981005233',
    'raphasilva.sousa@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    974584943,
    'Leonardo scheffer dos Santos',
    '12084542936',
    '48991800886',
    'Palomaleo.123@Hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    975002744,
    'Nycolas Bezerra de Souza',
    '17440632737',
    '21986358550',
    'nycolas1221@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    975125541,
    'Erika dos Santos Pereira Figueredo',
    '04161591098',
    '54984050482',
    'lwwam.colorado@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    975688710,
    'Douglas Eduardo da Silva',
    '10518876900',
    '48988040981',
    'douglas.eduardo.97@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    975760759,
    'Wendel Sousa Moura',
    '46544963860',
    '11945139396',
    'wendelsousamoura@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    975884309,
    'David Jônatas Machado',
    '44216439802',
    '11943369594',
    'david.jonatas1994@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    976580672,
    'Lucas Barbosa Palmeira',
    '52526173841',
    '11940310812',
    'optioniq1982@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    976633926,
    'David Oliveira',
    '12223109888',
    '61982909119',
    'davidioliveira171@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    976797575,
    'Gabriele Euzébio de Brito Noronha',
    '01198597003',
    '54991381994',
    'gabrielenoronhacxs@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    976968442,
    'Ruan cyplayker moreira de sousa',
    '70129507148',
    '62993275008',
    'Ruanmoreira48@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    978073265,
    'Rafael Chaves',
    '01978672357',
    '99992203057',
    'rafaelchavez101@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    978209683,
    'Carlos Alexandre da Silva Costa',
    '11139705709',
    '22998506957',
    'carlosscosta9@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    978291227,
    'Gabriel Theodes',
    '17800194752',
    '24998844020',
    'Gr9095@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    978444487,
    'Samuel Rodrigues de Sousa',
    '05753027121',
    '61983611499',
    'samucaa1313@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    979315658,
    'Tiago menezes de oliveira',
    '07808494500',
    '75998464588',
    'Tiagomenezes50@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    979858475,
    'Rogério dos Reis Filho',
    '14859747631',
    '31984763583',
    'Rogrioreis292@yahoo.com.br',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    980549917,
    'Paulo Henrique dos Santos Viegas',
    '05460223407',
    '83996018684',
    'henrico32018@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    981397743,
    'IZABEL CRISTINA BELIZARIO',
    '10599431660',
    '34988924738',
    'isabel_str@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    982437327,
    'Diego Ramos',
    '18429039775',
    '21966790305',
    'diegomquatro@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    983397241,
    'Cleber Batista Fontes',
    '85430773549',
    '71988644368',
    'cleberfontes24@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    983476074,
    'Rones wesley Lourenço Vasconcelos',
    '08260515377',
    '88996737672',
    'rones.w@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    983727895,
    'Moises Alves Pereira Lima',
    '60650113390',
    '99992060739',
    'Moizez1424@gmai.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    984743709,
    'Meire Carvalho da Silva',
    '50795163568',
    '71987055420',
    'Metenanhcahe@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    985345470,
    'Nicolas abreu',
    '04635371069',
    '55991812175',
    'nicoabreubr@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    985703998,
    'Willian dos santos ribeiro',
    '10878543937',
    '46991250504',
    'willianribeiro1013@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    986381139,
    'Kariston Bruno Soares leal',
    '11870935640',
    '38999184189',
    'karistonbrunoleal@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    986383630,
    'Cheng Che Yang Liu',
    '88017354053',
    '51986051117',
    'yangpablo1@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    986593157,
    'Laerty Simao',
    '47948569898',
    '11940746527',
    'Laertysimao@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    987333293,
    'Manoel Lucas da Silva Santos',
    '09264428488',
    '34993409892',
    'lucasnegociorich@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    987945889,
    'Gilson de Assis Rodrigues da Silva',
    '03739794100',
    '65999620269',
    'gilsondea127@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    988396830,
    'Rodolfo Alfredo Garcia',
    '41282198866',
    '14997398974',
    'dorfo.tati@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    988703075,
    'Lorenzo Ultramar inacio',
    '10703466755',
    '28999659646',
    'lorenzoultramar@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    989844294,
    'Carlos Henrique Rodrigues Lacerda Alves',
    '04327885142',
    '94984220654',
    'Carloscapiroto@icloud.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    990019194,
    'Luciano aparecido scaliante junior',
    '44718336856',
    '16992881705',
    'Lucianoscaliante@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    990232029,
    'Ana lucia Rodrigues dos Santos',
    '11746120614',
    '37999316085',
    'Diegohenrique980@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    991028513,
    'Felipe da Silva',
    '05956380900',
    '41999029244',
    'feelipe_07@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    991067197,
    'João Henrique Marques Santos Aguiar',
    '86542507558',
    '71986100298',
    'henrrick015shaforostov@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    992276945,
    'Marcio Rocha Soares',
    '12663973700',
    '24981230341',
    'raiknusjjr@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    992333681,
    'Alejandro w s costa',
    '45717059809',
    '11995041074',
    'Alejandro.wallace_@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    992421826,
    'Amilson Oliveira Dourado',
    '32711435873',
    '11986433099',
    'amilsondourado@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    992732749,
    'Carlos Santos Souza',
    '06303856535',
    '64992011523',
    'Carlossantos1992@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    993043714,
    'Evandro arrais mota',
    '03486771701',
    '19981428589',
    'srtans.arrais@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    993461194,
    'Guilherme Ferreira Nunes',
    '14228709605',
    '38988088243',
    'gfnunes07@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    993705461,
    'Guilherme Berlini Serrano',
    '48829599840',
    '11930056608',
    'guilhermebloodstrike@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    993885521,
    'José carlos ferreira de souza',
    '44243146420',
    '28999948953',
    'silvageferson2016@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    993914376,
    'Maicon Casagrande',
    '06469823971',
    '48999493799',
    'gerencia.comercial@multiscv.com.br',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    993942539,
    'Lucas Bordoy Dias',
    '47961441883',
    '12991715040',
    'lucasbordoy@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    994084267,
    'Rodrigo Tenorio',
    '15231270741',
    '22992595468',
    'r.tenorioh@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    994335618,
    'Tiago Gustavo ribeiro',
    '06092335727',
    '21990526131',
    'Tioted6622@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    994401894,
    'Antonionni Barbosa Gomes dos santos',
    '02288263571',
    '74988631669',
    'tonyjac1002@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    994450297,
    'Robinson Alves da Silva',
    '02984711084',
    '53991625790',
    'robinsoniqoption@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    995049224,
    'Leandro Rodrigues Massarini',
    '07490375983',
    '43996177606',
    'leandro.massarini@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    995057535,
    'Bruno de Almeida silva',
    '36846613846',
    '11997790526',
    'Bnk.almeida@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    995255077,
    'Eduardo Franco Gouvea',
    '10394617789',
    '27996873310',
    'eduardo-gouvea@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    995255316,
    'Abel Lima de Souza',
    '72674130482',
    '83996467458',
    'aynoandelgado@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    995494073,
    'César Roberto Souza Correa Junior',
    '07514429336',
    '98991115289',
    'cesarroberto034@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    996465703,
    'João bolota',
    '10907926894',
    '04799084687',
    'Caradogueto@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    996605381,
    'Matheus brunetto',
    '35511454826',
    '11960429183',
    'Valongo_@hotmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    996935834,
    'Diego Fernando Ramos',
    '32252221860',
    '17981699015',
    'diego.debora010@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    997055416,
    'Wisley Gustavo de Moura',
    '01991301677',
    '34999628950',
    'Wisleygustavo3@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    997077837,
    'Thiago Denys Carvalho da Silva',
    '01752594371',
    '99992045470',
    'thiagodenys_npa@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    997518470,
    'Pedro rodrigo garrido montoro',
    '46446604858',
    '18996803449',
    'Pedrexd@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    997641205,
    'JANIELE ALMEIDA Rocha',
    '07945363520',
    '11932029849',
    'janyalmeida51@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    997873772,
    'José Roberto Gomes',
    '09062533906',
    '44999275867',
    'olivirprjr@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    998537670,
    'Josinete Fonseca de Carvalho',
    '98825542372',
    '98982879056',
    'kyohanelson@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    998881389,
    'Diego Martins da Silva',
    '02553903197',
    '64992911817',
    'diegomartinsjc@outlook.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    998882583,
    'Ronaldo Ferreira Cardoso',
    '08403451865',
    '11947795379',
    'Importados.cardosos@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    999825989,
    'Daiane cristina moretto thomé',
    '32077460806',
    '17988292221',
    'Paulothomejunior@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1000217795,
    'Lucas Willian do Nascimento',
    '70449010422',
    '81998643682',
    'lucaswillian704@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1000323305,
    'Larryson da silva costa',
    '02310907227',
    '91993555164',
    'Larryson71@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1000350173,
    'Diego Martins',
    '05812294798',
    '28999355758',
    'diegotagima1986@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1000463328,
    'Axcel Donizete Galdona Volcani',
    '42738790852',
    '16992534138',
    'axcelvolcani94@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1000570753,
    'Emilio Santos de Jesus',
    '70082690219',
    '93988123340',
    'esjemilioalq@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1000911106,
    'Rafael Coelho',
    '25088561008',
    '11971964452',
    'rafa_rsc@outlook.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1001512833,
    'Rosilene Tuni',
    '05019040932',
    '47988390422',
    'sangalli0711@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1002079979,
    'Élisson Brito Dias',
    '81378563077',
    '48996558595',
    'Elisson290598@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1002103072,
    'Yago Felipe dos Santos',
    '42692224841',
    '13992091351',
    'Trader.yago20@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1002110221,
    'William Eleuterio Teixeira',
    '01784578258',
    '92991385926',
    'williamteixeira.wt98@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1002628993,
    'Guilherme da Silva',
    '04692852062',
    '51994605197',
    'guisilva88550@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1002981853,
    'Almiro rayran oliveira',
    '05325184547',
    '79996437047',
    'almirantefhkyran@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1003325561,
    'fabiana cardoso esteves de sales',
    '85005282300',
    '11943407272',
    'ml2014sp@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1003492595,
    'Zilber Antony Saretta',
    '07264495639',
    '33999066566',
    'Zilberantony0@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1003723678,
    'Leandro Luiz Alves',
    '40471805807',
    '15981064903',
    'luizlehalves@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1003773814,
    'Gabriel Lopes Soares Sales',
    '07503230517',
    '75999367315',
    'salessgabriell@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1003949738,
    'Guilherme Augusto de Souza Pinheiro',
    '46342836892',
    '11983273916',
    'Guilherme.pinheiro2101@outlook.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1004441087,
    'Mariana Pedrosa da Silva',
    '14047025470',
    '83986233715',
    'vivianemarinhodiias95@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1004801636,
    'Natan ramos da Silva',
    '05998988108',
    '67993088228',
    'natanramosdasilvaa@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1005058488,
    'Murilo de souza',
    '09038629990',
    '41998029358',
    'Murilo.soouza94@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1005124877,
    'Luiz Gustavo Almeida Gomes',
    '70386717150',
    '62995323754',
    'lgusta18@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1005217028,
    'Guilherme Borges Aguiar',
    '09779312935',
    '48999020758',
    'guiborges.a25@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1005403415,
    'Deividi Luis da rosa',
    '06351075971',
    '47999203349',
    'deividicartola31@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1006078767,
    'Cleber Junior de Oliveira',
    '08968483965',
    '48999476132',
    'cleberjunior95@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1006592306,
    'Willian chaves santos',
    '11403889910',
    '41996319747',
    'Willian198chavessantos@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1006957496,
    'João Vitor Lopes',
    '14839465681',
    '31971573276',
    'lopes24325@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1006962453,
    'RODRIGO CHAVES CORREA',
    '70184773288',
    '92981500598',
    'Skankunnamed@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1007810099,
    'Lizmar Silva',
    '03719346218',
    '91985557753',
    'lizmarsilva770@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1007967714,
    'Jackson soares dos santos',
    '05582653597',
    '73999324657',
    'jacksonsoaresjack0@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1008163808,
    'Joshua Yohane Kikuti',
    '23611305804',
    '12988454406',
    'joshuakikuti14@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1008187408,
    'Ismael de moraes rodrigues',
    '03133476114',
    '62985404708',
    'Ismael.go.r7@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1008192995,
    'José pinto ferro',
    '28581817130',
    '41984072132',
    'Cs_novak@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1008338872,
    'Edivan Amâncio de lima',
    '95442286249',
    '92993625968',
    'Edivan.rosana@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1008801595,
    'André Luiz Carvalho Machado',
    '15644137724',
    '22998145391',
    'machadoalcm@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1008852517,
    'João Victor Gonçalves de Mendonça',
    '19062092780',
    '22998401773',
    'joao.jvgm@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1009539237,
    'Vanderlei José da Silva',
    '03750714312',
    '88981435523',
    'vanderleijs61@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1009965897,
    'Samuel Almeida',
    '70775574139',
    '62994248091',
    'almeidasamuel102938@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1009973576,
    'Emickson ribeiro Rodrigues',
    '48076313813',
    '11954437826',
    'ribaswin@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1010130994,
    'Walker Cardoso Martins',
    '14059777790',
    '27998862926',
    'walker.vrcconsorcio@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1010197766,
    'Alexandre Luis Lizardo',
    '37631761876',
    '19981643885',
    'alizardo57@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1010239780,
    'Anderson Rosa da Silva',
    '86154947542',
    '62999681888',
    'anderson-r-@outlook.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1010323091,
    'Erlon Antonio frozi',
    '08189888943',
    '46991331218',
    'erlon.frozi@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1010705278,
    'Vinícius Almeida',
    '08671652432',
    '83998415290',
    'vanegociodigital@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1010901208,
    'David da Silva Nativo',
    '05333771103',
    '61996141983',
    'david.nato3636@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1011133912,
    'Michell Axel Souza da Silva',
    '11561071994',
    '47991568773',
    'michellaxelsouzadasilva07@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1011304145,
    'Cleyton bontorim',
    '32215897864',
    '19996956559',
    'Vadio9@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1011828317,
    'Andersol Silva',
    '30287750000',
    '47886346542',
    'sjjsjw@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1012322792,
    'Filipe Ribeiro da Hora',
    '07314386633',
    '31988701789',
    'filipe.trader@bol.com.br',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1013131369,
    'Francildo Silva de Araujo',
    '01138414263',
    '95991189057',
    'cyldo22@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1013321428,
    'Alexandre Soares da Silva',
    '07135047141',
    '67999449283',
    'alesoaressilva00@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1013347713,
    'Elias Mateus Ferreira',
    '14054126669',
    '35984334282',
    'eliasmateus8@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1013456911,
    'Anderson sutelo',
    '87201186000',
    '53991852920',
    'andeersonjunior2@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1014433810,
    'HERIK AVELINO DE AGUIAR',
    '48636745896',
    '11951319395',
    'herickfreire96@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1014982410,
    'Fabio Correia Santos',
    '06200668906',
    '44999160166',
    'fabio.s_hquimica@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1015442705,
    'Renner Silva santos',
    '06168828150',
    '66999191648',
    'Rennernx48@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1015671423,
    'jean Oliveira silva',
    '44491111847',
    '17996368871',
    'jeanoliveira5423@outlook.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1016141829,
    'Éder Becker de Siqueira',
    '03016437090',
    '51998869862',
    'edersiqueira1414@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1016340777,
    'Brenda Araújo frois',
    '11208267647',
    '31988648106',
    'brendhasantosfrois@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1016482557,
    'Ciro Frazao de sousa',
    '02872716335',
    '98988835360',
    'laerciociro@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1016789980,
    'Jose caio ferreira Souza',
    '06624860138',
    '64993263706',
    'Josecaio1220@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1016834901,
    'Wellington Gabriel Coelho Da Silva',
    '07366610348',
    '88998007441',
    'sextasexta211@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1017381003,
    'Marcos Henrique dos Santos',
    '50701793813',
    '13997111392',
    'tucamarcos712@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1017516305,
    'Matheus Cardoso Lummertz',
    '86148710072',
    '51982471573',
    'mlumertztrader@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1017817219,
    'Damião Tales de Araújo',
    '07304370351',
    '88981767792',
    'Damiaotalis7@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1018623529,
    'Rodrigo Theodoro',
    '02419934075',
    '54992568896',
    'Rodrigo.theodoro@icloud.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1018944504,
    'Luis Felipe Rocha thomaz',
    '34685478894',
    '12997831104',
    'Luisfelipexuxinha@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1019496036,
    'Lauane Nunes',
    '11822608619',
    '35984331040',
    'Lauannynunes@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1019601265,
    'Luiz lima',
    '48872760879',
    '17988023982',
    'beluciosantos2020@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1019770914,
    'Yan Wilson Evencio de Souza',
    '52456997883',
    '19997034016',
    'yanwilson76@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1019776354,
    'Jonas Henrique Stephano',
    '04701600989',
    '43999215820',
    'jonasiqoption3000@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1019780859,
    'CARLOS HENRIQUE CRIPPA',
    '41794969845',
    '19992066587',
    'carloscrippa15@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1019914617,
    'SADAITI ORITA',
    '06954111953',
    '13995865458',
    'phellipe.designergja@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1020119232,
    'Jorge Valdecir',
    '27860817004',
    '54981203526',
    'schneiderjoao26@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1021046892,
    'José Wesley Cavalcante de Lima',
    '06908894452',
    '84988506081',
    'Wesley-cavallcante@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1021275172,
    'Kenedy carvalho da silva',
    '14068610657',
    '34987213359',
    'kenedycsilva@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1021723483,
    'Raulennon Ulisses Costa Silva',
    '70290316103',
    '62982050289',
    'raultrader2@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1021866131,
    'Alesson Santos Oliveira',
    '07207528507',
    '73988195445',
    'Alissonpfcdejesus300@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1021936638,
    'Edevandro luiz grando',
    '05743413908',
    '46999324006',
    'Grando1005@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1022094985,
    'Ygor Brito',
    '08075266307',
    '88988077557',
    'ygorvieira007.yv@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1023449560,
    'Alex Mendes schechtel',
    '05317936993',
    '42988484200',
    'Alexm.sche@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1023610950,
    'Bruno de Freitas Givoni',
    '02792838221',
    '92982898266',
    'Quadrarosa@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1023625434,
    'Everson Gustavo de Oliveira',
    '37412234846',
    '17992738424',
    'gustavoliver87@outlook.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1023667459,
    'Douglas Rodrigues Pereira Alves',
    '47358889851',
    '17997416560',
    'douglasrodriguespontalinda@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1023724567,
    'marcus vinicius machado',
    '43028839873',
    '15997669511',
    'marcus074vinicius@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1024295383,
    'Paula Christini Silva Galvão',
    '13654159702',
    '21981142514',
    'paulinhatyler@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1024745739,
    'Allan Silvestre Roberto',
    '46494301860',
    '17988286653',
    'allansroberto@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1024987280,
    'Wilson aveano de Jesus Neto',
    '07317946303',
    '98985745754',
    'willneto755@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1026022830,
    'christian marins',
    '44249410862',
    '15991386019',
    'christianmarins97@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1026217134,
    'Samuel Silva Braga',
    '08250000501',
    '77988127151',
    'panhead20552@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1026303269,
    'Joao Felipe Silveira da Silva',
    '09502689925',
    '47997262878',
    'Joaofelipeki00@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1026305551,
    'Otavio kanashiro Oliveira ramos',
    '45265855807',
    '11958477164',
    'otavio.kanashiro@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1026341874,
    'Luiz Fernando Nunes',
    '08595378975',
    '41997507590',
    'Fernando@frtec.inf.br',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1026620111,
    'Luciano Fischer de Oliveira',
    '02765204241',
    '69981063246',
    'luciano-fischer1@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1026662803,
    'Thales Tegani Florêncio',
    '46589900833',
    '14998506657',
    'thlstegany@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1026981592,
    'Henrique Lopes Macedo',
    '10262670992',
    '48988182296',
    'hrq.snap@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1027332056,
    'Júlio Cesar Ventura da Silva',
    '11646424484',
    '82998240886',
    'julioventura379@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1027517305,
    'Filipe Botelho da Silva',
    '07850278585',
    '73999312212',
    'Fillipebotelho07@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1028063896,
    'Ricardo Praxedes Da Silva',
    '61795347309',
    '99984533114',
    'Praxedeseduardo9@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1028434886,
    'Anderson Afonso silva',
    '01841631108',
    '62994188897',
    'Wilsupertrader@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1028484944,
    'Maycon Douglas',
    '05728644180',
    '67999739804',
    'Maycondouglas_md@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1028889571,
    'Patrick Gomes da Silva',
    '02812694084',
    '51985511158',
    'patrickgomesdasilva2009@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1028965196,
    'Matheus Souza do amaral',
    '51742408850',
    '11977699459',
    'Matheus.souza172@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1029014497,
    'Ricardo Gabriel Bruno dos Santos',
    '19834002700',
    '21964434124',
    'ricardofixado134@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1029295407,
    'Tales Ferreira da Silva',
    '03930259265',
    '94992512550',
    'teste12930@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1029642260,
    'Jeferson amorim',
    '04530122131',
    '67991267986',
    'Jefersonamorim@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1029883847,
    'Rogério Carvalho de Sousa',
    '03052719203',
    '91989242341',
    'Srogerio@outlook.com.br',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1029923375,
    'Witor Almeida da Silva',
    '10919235905',
    '47996362371',
    'robertobross2@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1029978408,
    'Thiago Pereira da Cruz',
    '00297743228',
    '92993116630',
    'thiagocruzjogos77@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1030252309,
    'Paulo Eduardo Araujo',
    '61252858396',
    '99991679208',
    'paulohotmart015@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1030264735,
    'Gustavo Moura',
    '09114126974',
    '41995216006',
    'guumoura@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1030419514,
    'Eduardo Ramos',
    '05625786097',
    '51995091850',
    'duduskater2002@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1030949494,
    'Lucas dos santos pedrozo',
    '03308699222',
    '95991215184',
    'Lucaspedrozzo7@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1031931463,
    'Matheus Santiago Torres',
    '14047755605',
    '35991583811',
    'mathewstorres506@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1031989981,
    'RAFAEL FARIA CHAVES',
    '01528255682',
    '34999402314',
    'rafaelfpatos@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1032027836,
    'Douglas de souza dasinger',
    '14085934759',
    '27996609145',
    'Douglas.s.dasinger@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1032028102,
    'Andre Ataliba',
    '16708292785',
    '21992579151',
    'Andre-ctl@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1033291863,
    'Andrei Alexandre Camargo leme',
    '10986025950',
    '44991852324',
    'andreicamargo80@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1033648470,
    'Matheus Soares do Nascimento',
    '04386886001',
    '54996514134',
    'matheussoares660@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1033941976,
    'Whernon Alberto Simião de Amorim',
    '09104495462',
    '81987045099',
    'Whernon.adm@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1034933504,
    'Arthur Rodrigues kothe',
    '07939433962',
    '43998080755',
    'rodrigueskothe@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1034981143,
    'Pedro Henrique da Silva',
    '70077563107',
    '62995306210',
    'pedrohs45973@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1035023465,
    'Leonardo Gutierrez',
    '09020991914',
    '41998983218',
    'leonardogutierrezcwb@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1035064780,
    'Luis Fernando Santo de Lima',
    '02004988002',
    '55996104645',
    'Lu.ze1988@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1035547102,
    'Eli Winte Shockness júnior',
    '03009030223',
    '69993052841',
    'shocknesseli@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1035668880,
    'Gustavo Aloisio Werlang',
    '05070442155',
    '66996511960',
    'werlanggustavo12@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1036196209,
    'Benaia welintom santos',
    '06488873164',
    '61998123046',
    'Benaia1998@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1036305703,
    'Rafael Silva lima',
    '71024734439',
    '81985584340',
    'faellima9636@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1036560611,
    'Jardel Garcia da Silva',
    '10959124969',
    '48996307393',
    'jardeladp@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1036802384,
    'Fábio Augusto de Oliveira Júnior',
    '41132644810',
    '11949512666',
    'fafabio2014@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1037470133,
    'Bruno Stello Oliveira',
    '04838954077',
    '55984260679',
    'brwno.s.oliveira@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1037530236,
    'Sebastiao junio Vieira de sa',
    '04182477308',
    '61983809303',
    'xeleleujunio@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1037534904,
    'João Paulo Teixeira Machado',
    '08424469666',
    '31992491959',
    'Joao_paulo_tm@yahoo.com.br',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1037545113,
    'Divaldo carlos soares',
    '99730456291',
    '91989503727',
    'soaresdivaldo@yahoo.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1037653658,
    'Elessandro Paranha',
    '37881075880',
    '43991630440',
    'eparanha@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1037792776,
    'Everton Gabriel de Abreu',
    '40117373800',
    '19974042941',
    'twyst27@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1037884685,
    'Kleber Marins Branco',
    '43479176860',
    '15997565119',
    'klebermarinsbranco@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1037900385,
    'Marcio de Oliveira Junior',
    '43702688935',
    '44984171788',
    'mcsurvivalold@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1038139238,
    'Francisco das Chagas Melo de Albuquerque',
    '04180552388',
    '21969114571',
    'maodeferro115@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1038492280,
    'Fredson Amaral do Carmo',
    '07583244560',
    '19996875026',
    'fredsonAmaral@outlook.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1038610927,
    'Gabriel Ventura P Barbosa',
    '06418346165',
    '65984474109',
    'Gabriellvlk69@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1038781427,
    'Marcelo Júnior Ferreira da Silva',
    '03043068009',
    '54996150352',
    'Marcelopc.silva62@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1038994692,
    'Danilo Ferreira da Silva',
    '04637520150',
    '65999572506',
    'danilosilva720@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1039281633,
    'Guilherme Marques Bernardes',
    '70519694120',
    '62992084838',
    'Guilherme.bernades17@Gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1039702768,
    'Gabrielle Oliveira de Albuquerque',
    '06383657755',
    '21990892061',
    'gabrielle.oliveira.albuquerque.22@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1039871587,
    'Wellington santos',
    '50150726864',
    '75993024332',
    'Angelorealsilva@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1040015712,
    'José Armando Alves Da Silva Santos',
    '07574773130',
    '62984061945',
    'josearmandosmith186@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1040134174,
    'Elton Batista Pinto',
    '12533936995',
    '41995549625',
    'eltonbp02@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1040137903,
    'K',
    '46103771870',
    '11957871043',
    'danielmatheusarcanjo022@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1040197625,
    'Renan Alisson Carbonato dos Santos',
    '05709829102',
    '61998746556',
    'adv.renanalisson@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1040226309,
    'Edivania de aguiar oliveira',
    '00443528241',
    '69999602092',
    'Vanamargon@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1040364222,
    'José Antônio silva',
    '39347858919',
    '34986589267',
    'gustavo.rodrigues.net@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1040937115,
    'Kaynan alcantara rodrigues',
    '70221153624',
    '11959392633',
    'Kaynan1998@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1041466612,
    'Clintom blaulim Alves de sousa',
    '53974301291',
    '95991180364',
    'clintomblaulim@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1041992093,
    'Silas Gomes Lins',
    '01365047440',
    '84999065316',
    'Silaslins@live.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1041993794,
    'Caio Peres Carvalho Sena Sabino',
    '44362352899',
    '11983173339',
    'caiopcss1@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1042039988,
    'Rodrigo Rodrigues Alves',
    '05842848104',
    '62993733671',
    'Rodrigoalves.rr49@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1042331113,
    'Marco Barcarol',
    '02647295018',
    '54991778080',
    'Nkgluftd@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1042363914,
    'gabrieli aparecida francisco',
    '49689009885',
    '16988637892',
    'gabrieliapfrancisco61@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1042849835,
    'Mateus Fernando Batista de oliveira',
    '51215365187',
    '61995957939',
    'Mateusyou28@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1042983241,
    'bruno William gollis Silva de Oliveira',
    '47317551821',
    '11988722689',
    'bruno.gollis@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1043362930,
    'Gabriel debs',
    '14942558719',
    '24981141533',
    'gabrieldebs1994@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1043492680,
    'Mateus Augusto da Silva',
    '10413156605',
    '35997186886',
    'Mateuschexao@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1044628207,
    'Igor Lucas Amaral da silveira',
    '13394977940',
    '47996229836',
    'Aze09pedre@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1045096850,
    'Wesley dos Santos Costa',
    '06209077382',
    '11981762021',
    'wesleysantos395@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1045625241,
    'Daniel Pereira',
    '08315190962',
    '44998032080',
    'daniel.per.p@outlook.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1045632087,
    'Vitor Wender Moreira Nunes',
    '05298223184',
    '65984176354',
    'vitorbmn@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1045799456,
    'Murilo Gomes da Silva',
    '52843642876',
    '11983468358',
    'xeltezer@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1045873307,
    'Rhayan Danyel Pontes',
    '11670603938',
    '43984148554',
    'danyelppontes234@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1046652269,
    'Brian Richart de Padua',
    '47916156890',
    '12988551569',
    'brinpaduah@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1047162790,
    'Pedro Freitas de Moraes',
    '56972890225',
    '92993913749',
    'Pedrofmoraes@hotmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1047574448,
    'Wellinton Carlos de Assis',
    '15386806610',
    '34988650760',
    'wellintoncarlos032@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1047866521,
    'Adryan Lima de Almeida',
    '11943169489',
    '82999831929',
    'adryangfx@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1048409744,
    'Vilmair Vieira De Souza',
    '00362320179',
    '64996465373',
    'vilmairsouza2@hotmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1048513357,
    'Edevane Malagutte Schmatz',
    '03802452992',
    '51999106732',
    'Ateodoro2002@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1048568299,
    'Cristopher Bortoloti',
    '07671731986',
    '41999223273',
    'Bortolotic@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1048587923,
    'Denis lima',
    '12290744654',
    '35984565121',
    'contatodnsinformatica@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1048644670,
    'Cleber de Jesus vieira',
    '06002490345',
    '88993301847',
    'Clebervieira4273@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1048941351,
    'Ana Carolina Carvalho Assis',
    '11048487679',
    '31987813975',
    'anacemerick21@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1049277242,
    'Gabriel Gois Rezende',
    '02396660110',
    '62999144575',
    'goisr1997@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1049332147,
    'Estevan Thomaz',
    '04563459062',
    '51989133260',
    'Estevanandlauri@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1049746133,
    'Gabriel viana de medeiros',
    '71224956478',
    '84999807196',
    'gabrielviana070@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1049770042,
    'Caio de Barros Silva',
    '47625482863',
    '11985436060',
    'caiosilva639@yahoo.com.br',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1049861969,
    'Eduardo Batista Dos Passos',
    '07302269998',
    '41984133667',
    'Eduardofju@outlook.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1049872082,
    'Rafaelcandidodasilva',
    '12017889431',
    '34984178324',
    'rafaelcandido767@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1049896645,
    'Matheus Costa Perez',
    '14664475675',
    '31995078090',
    'Matheuscostaperez@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1050162668,
    'Vitor Hugo Rodrigues Alves',
    '12564227627',
    '61998496805',
    'Vitorhugoalves.78@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1050272315,
    'Fernando Oliveira',
    '36391656088',
    '35992004941',
    'diego.pcx@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1050315264,
    'Vinicius Mesquita Rodrigues',
    '17167328758',
    '21993772045',
    'Vinymesquitarodrigues@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1050551879,
    'João Augusto Santos Pinto',
    '03553008180',
    '61999898552',
    'joaoaugusto.sp@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1051112636,
    'Eric dos santos',
    '16613483788',
    '24993151022',
    'eric_traderiniciante@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1051635788,
    'Bruno Nascimento',
    '88475824234',
    '91980240771',
    'brunocn30@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1052037060,
    'Silas Magdyel Francino da Silva',
    '11482857928',
    '45991119514',
    'silas8437@outlook.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1052048920,
    'Lucas Matheus Rodrigues de Oliveira',
    '09266200450',
    '83996352669',
    'lucas7kill@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1052313740,
    'Jhonatan Moreira',
    '11244889440',
    '81993367300',
    'moreiradonta@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1052569914,
    'Jéssica Nascimento',
    '13830453728',
    '27998179653',
    'jessicapanhis@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1052674384,
    'Maicon Douglas Mariano guissoni',
    '49005720808',
    '16992938041',
    'maicongiussoni@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1053393226,
    'Stanley harrisom felicio',
    '70003893626',
    '34996829727',
    'Stanleyfelicio10@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1053509812,
    'Marlon cley moreira',
    '07609389978',
    '41991183301',
    'marloncley1990@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1053861221,
    'Gustavo Francisco Luiz',
    '46462889829',
    '11963407930',
    'gustavof.luiz@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1053933639,
    'Davi moura Andrade Junior',
    '15444321602',
    '31993509572',
    'davi.mandrade@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1054175287,
    'Davis Paranhos Cesar Silva',
    '38822933818',
    '11957809009',
    'Davis_paranhos@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1054258757,
    'José Fabiano Bernardo da Silva',
    '05459832314',
    '88996103090',
    'Fabiosilvacrajubar@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1055790685,
    'Abner Henrique de Oliveira',
    '44775720856',
    '14991359566',
    'abner.07.ao@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1055796986,
    'Wanderson silva Moreira',
    '04973258296',
    '69993818259',
    'wandersonmoreira479@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1055883067,
    'Carlos Henrique Gonçalves Tavares',
    '07298962930',
    '45991325056',
    'Carlos@ads.ind.br',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1056117210,
    'gislene aparecida dos santos da silva',
    '14098915693',
    '35999393573',
    'gisleneareado@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1056353955,
    'Genario Xavier da Silva Neto',
    '11903110467',
    '83988043325',
    'genarioneto98@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1056406044,
    'Darwin Alfredo Martinez Silva',
    '70602463203',
    '95991134727',
    'Alfredosilva.drax@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1056425347,
    'Willian Lopes',
    '02586078152',
    '67992125237',
    'gasmontealegre@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1056462743,
    'Samuel Filipe de Jesus Oliveira',
    '07500951302',
    '81986435852',
    'samuelfilipe189@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1056504475,
    'Davi schleu de oliveira pinto',
    '05467978578',
    '71993807247',
    'Davischleu@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1057004229,
    'Fábio Alencar da Silva',
    '08629651601',
    '32998264748',
    'fabinho07101987@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1057429605,
    'José Roberto dos Santos Junior',
    '07481590613',
    '31989483147',
    'betobelmont.junior@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1057637968,
    'Lucas Ramos de Souza',
    '06321891770',
    '22992036894',
    'lucascebb@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1057658991,
    'Andrei Klein De Lara',
    '11665454903',
    '46999206705',
    'andreiklein17@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1057693060,
    'Caio teixeira de freitas',
    '13707942660',
    '31983906623',
    'Caioteix1996@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1058268819,
    'Ezequiel Conceição Dos Santos',
    '03149334500',
    '71992217006',
    'euamow.amanda@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1058292085,
    'giovanni costa da Silva Pereira',
    '45812579806',
    '12992544590',
    'gihcostasil@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1059264131,
    'Filipe Moreira de vargas',
    '00787065056',
    '51999551609',
    'Filipevargas87@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1059293240,
    'Anderson Santos Da Silva',
    '06117696388',
    '88996351841',
    'santosa605@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1059296462,
    'Cristhian hugo da silva alves',
    '36334780867',
    '17991078386',
    'Cristhian.black.2019@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1059547611,
    'Diego Brito Ferreira',
    '10433401494',
    '83999807775',
    'Diegobrito6666@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1059603247,
    'Luiz Antônio',
    '77988667017',
    '81991319140',
    'Luiz@bol.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1059635813,
    'Caio souza lopes',
    '50948062894',
    '17992606047',
    'caio_souza2016@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1059823301,
    'Saulo Emannuel chalmes dadalt',
    '04266177038',
    '51992878254',
    'Saulodadalt2808@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1059929702,
    'Pedro Gomes',
    '06156377018',
    '41984657890',
    'grabagencia@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1060277399,
    'STEFAN NATAN KUHNE',
    '08021434902',
    '41992048004',
    'stefankuhne@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1060845263,
    'Filipe Barcelos Bento',
    '17078339746',
    '27998313522',
    'filipe120898@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1061340130,
    'Robson Pereira Mota',
    '13192993693',
    '33988970020',
    'robsonmotta12@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1061508601,
    'Vinícius Afonso Tozatti',
    '10114928908',
    '43996204319',
    'vinitozatti@outlook.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1061617261,
    'Cristiano neves costa',
    '06189118984',
    '64993086685',
    'Cristianoneves769@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1062220081,
    'Romario Batista Lima',
    '01850604207',
    '68992407601',
    'rbl9363@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1062558701,
    'Maxuel dos santos costa',
    '85881876555',
    '73998243475',
    'maxsantsdj@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1063446581,
    'Gabriel Andrade Millem',
    '11259615626',
    '31994064876',
    'Gabrielmillen@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1064115095,
    'Vinicius Alves mena',
    '45722779822',
    '11930817538',
    'viniciussurita@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1064992794,
    'Carlos Nathan Toledo',
    '41359121846',
    '12997737611',
    'nathantrader94@outlook.con',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1065015252,
    'Janderson marcelo',
    '09259906989',
    '41999270791',
    'Marcelojanderson231@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1065711441,
    'Diego Rabelo',
    '01978575076',
    '11984578906',
    'diegoscheir1301@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1066013761,
    'Nicholas Soares de Lima Nasser',
    '12727730608',
    '35999820066',
    'nicholas.nasser@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1066755540,
    'Josefa Claudiane Silva Cruz',
    '06062406596',
    '79996822587',
    'Claudianegalega17@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1066928147,
    'João Joaquim dos Palmares',
    '71330600860',
    '11980765565',
    'pipoca2413@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1068137198,
    'Rafael Barbosa',
    '07742467909',
    '43999701828',
    'Rb654742@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1068526483,
    'Lucas Lopes da Silva Santos',
    '15801176780',
    '21999430042',
    'Pedrilucas09@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1068908864,
    'Luiz Otávio Lopes Galvaza',
    '63497630098',
    '27997667940',
    'luizgalvaza@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1069480932,
    'Lucas Koniarski Feghera',
    '11501284967',
    '48991171659',
    'Lucasfegheraluh@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1069534970,
    'PAULO JUNIOR RAMOS CASSIMIRO',
    '06428281139',
    '66999767100',
    'paulocassimiro2002@hotmal.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1069760842,
    'Gabriel de Brito Gomes',
    '46658616841',
    '19999528111',
    'g.brito01@outlook.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1070029840,
    'Fellipe Sanches',
    '22882433840',
    '11947291086',
    'lipe_sanches@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1070271412,
    'Matheus Bueno Silva',
    '03337148069',
    '51993232949',
    'matheusbuenosilva@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1070674697,
    'Carlos Henrique Alves de Lima',
    '48276878890',
    '11989817721',
    'Carlosmoisa63a@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1070738330,
    'Lucas ronald',
    '42019431866',
    '11943392528',
    'lucasronald99@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1070764098,
    'Rafael casarotto',
    '02226721029',
    '54999307972',
    'rafacasarotto20@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1070943212,
    'Otávio Júnior Cavalcante',
    '80634880837',
    '13997903039',
    'otavioratoloko@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1071000345,
    'Lucas',
    '81344588077',
    '21959141988',
    'Oi@oi.com.br',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1071571009,
    'Enzo Lopes',
    '08167582981',
    '47997929516',
    'scafibeat@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1073368840,
    'Marluce Pedrosa da Silva',
    '42407036468',
    '83988757210',
    'mariana.pedrosa2002@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1073429665,
    'Eduardo Costa grilo',
    '50585095809',
    '19996246288',
    'educgrilo47@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1073934193,
    'João Marcelo',
    '08876124900',
    '42988336801',
    'confessopilantra@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1073982135,
    'Gabriel cavalcanti ferreira',
    '13375605617',
    '34984023616',
    'bieltkdskt@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1074319590,
    'Raknen Matheus Botton Nunes',
    '03515878025',
    '05596660137',
    'raknenbotton@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1074350343,
    'Kaick Ferreira Freitas',
    '05853014170',
    '66996501042',
    'kaicktraderferreira@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1074408859,
    'Ataidy jose de jesus de souza',
    '07598738106',
    '61991734792',
    'ataidy.jose@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1074550141,
    'Tiago Junior Amaro',
    '39603919861',
    '18991911895',
    'tiagoamaro67@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1074798512,
    'Leander Duarte Teixeira',
    '06525670101',
    '67999602466',
    'leanderteixeira66@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1075168132,
    'Guilherme Thomazotti Barros',
    '45285154820',
    '11973145834',
    'Guilhermetb50@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1075250274,
    'Tiago Ribeiro Fernandes',
    '07451713466',
    '87988089951',
    'tiagoribeiro_27@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1075493133,
    'Esther Silva Marques',
    '12915035601',
    '32991279113',
    'Esthermcampos98@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1075650920,
    'Dyoge Wartu Duarte da Silva',
    '06133315245',
    '94992068936',
    'Dyorgewarto13@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1075885447,
    'MATHEUS DE MIRANDA SANTANA',
    '10184823692',
    '27996399754',
    'matheusmiranda770@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1076384657,
    'Hyann Crispin Stuart e Silva',
    '01911497642',
    '84999415650',
    'hyannstuartamor@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1076598365,
    'Raimundo Nonato oliveira Silva',
    '12233488814',
    '16991192378',
    'bossnana903@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1076955315,
    'Erick Augusto Lucas da Luz',
    '39511282751',
    '27995130223',
    'eerickaugustolucasdaluz@lonax.net',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1076969053,
    'Victor Hugo Ferreira Santana',
    '07109028674',
    '34991530671',
    'Vitinhg23@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1077802710,
    'Bruno Aparecido Peres',
    '42148215809',
    '19971546993',
    'akkaianimes2020@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1077887137,
    'Gabriel chiara barros Vieira',
    '17852204708',
    '21994989035',
    'Leirbag2605@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1077927152,
    'Maik Carlos Soares Silva',
    '70516140108',
    '64999237848',
    'maikcarlos45@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1078070319,
    'Alexandre briao',
    '11275752950',
    '41992727920',
    'Xandebriao@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1078609122,
    'Carla Silva',
    '57308065073',
    '11983525537',
    'brunooliveiramagliarelli@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1078763831,
    'Leandro leal de souza',
    '83702717234',
    '92992663448',
    'Leoleal.lll89@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1078828076,
    'Emanuel da Silva freitas',
    '70977403459',
    '83988007402',
    'emanuelsilva2629@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1079320312,
    'Micael Macedo bahia',
    '11705363954',
    '47991616019',
    '4791616019mika@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1079343702,
    'Lauanda Gabriellen Carvalho Santos',
    '45570538828',
    '11971218427',
    'Lauandacarvalhosantos@gmail.com',
    '2020-08-20',
    17
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1079440010,
    'David pires',
    '12184119962',
    '47997423489',
    'david.pires505@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1079779619,
    'Mikael Roger Santos dos Santos',
    '03230814282',
    '96991892729',
    's-mikael@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1080195164,
    'Cláudio Herculano',
    '70469100494',
    '81998017136',
    'claudioherculano2552@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1080859676,
    'Emerson Fernandes Fagundes',
    '16648823755',
    '21998222418',
    'Fagundes.19000@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1080891548,
    'Luiz Fernando De Oliveira Branco',
    '00780104110',
    '61998807067',
    'Luizoliveira1807@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1080999038,
    'Cássio Vieira giolo',
    '42234887836',
    '19984394149',
    'Cassio_giolo@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1081619254,
    'Eduardo Wilian Pereira',
    '07439412923',
    '41988204611',
    'eduwilian@outlook.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1081971263,
    'Weverton Santos De Jesus',
    '08500496525',
    '75999310568',
    'Weverton.play77@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1082188380,
    'Paulo henrique Marçal',
    '12260989756',
    '21989862770',
    'Phrm.eventos@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1082474198,
    'Gustavo Oliveira Machado',
    '04248117070',
    '51992015664',
    'oliveira.machado.ug@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1083502885,
    'Gabriel odocio',
    '06448551778',
    '22997084892',
    'gg6594556@Outlook.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1083922109,
    'Luan Carlos da rosa',
    '13437129988',
    '04998319417',
    'luancarlosdarosa3@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1083988100,
    'Andryw',
    '04611342255',
    '62998007166',
    'andrywtavares2019@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1084046197,
    'Marcelo Pereira Pinheiro',
    '02615536311',
    '98984672591',
    'Marcellopinheiro1@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1084366441,
    'Verônica Miranda',
    '10410507717',
    '21980101817',
    'Wesleyalmeidarocha@outlook.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1084572138,
    'Alcinei neres arruda de Lima',
    '02218104202',
    '92984360941',
    'neresalcinei@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1084661094,
    'Gabriel Correa',
    '12365430929',
    '48984465068',
    'biel.tapera@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1084675962,
    'Guilherme júnio carneiro durante',
    '09353561930',
    '49991979390',
    'guilhermecarneiro865@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1085168096,
    'Jefferson Henrique de Oliveira silva',
    '70382119436',
    '81995379748',
    'Jefferson.niid@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1085357239,
    'Gomes',
    '94448483886',
    '11945485341',
    'guigo.gomes28@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1085562615,
    'Gabriel Vinicius frança landin',
    '52232045811',
    '18981927793',
    'gabrielfranca322@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1085905601,
    'Amaro claudino',
    '09212163947',
    '47997287507',
    'Amaroclaudino81@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1086192693,
    'Abimael Oliveira da Costa junior',
    '18528637735',
    '21992367861',
    'abimaeloliveira883@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1086313092,
    'Jaeder Farani Esteves',
    '13324401771',
    '48996195179',
    'jaeder.farani@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1086848654,
    'Wallison gomes de andrade',
    '07045526636',
    '33999471985',
    'wallisongomesdeandrade@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1087293241,
    'Jayzon Torres Chaves Junior',
    '61490615318',
    '99991776647',
    'juniorchaves146@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1087577866,
    'José Ricardo Rodrigues da Luz',
    '00701856114',
    '66996646950',
    'Josericardorodrigues1984@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1088121118,
    'David Pablo Ferreira Lucena',
    '61173546308',
    '67998862111',
    'helton.gt12@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1088697462,
    'Elaine Balde dos Santos',
    '19132288867',
    '11951459141',
    'elaine.neves1999@outlook.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1089377072,
    'Eliel almeida calarga',
    '44710880840',
    '14981623005',
    'eacshopping3@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1090338287,
    'Gabriel da Costa Pereira',
    '70811782190',
    '62994060992',
    'gabrielferrari293@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1090353301,
    'Matheus da Silva Lima',
    '42782351869',
    '13981577476',
    'matheuslimaa10@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1090675174,
    'Pedro Gabriel Monteiro da Silva',
    '16914603707',
    '24988472990',
    'pedromonteiro995@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1090782251,
    'Gabriel Bergamini',
    '23926060808',
    '19998059190',
    'Gabibega.gabriel@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1091082637,
    'Reinaldo Dos Santos ferreira',
    '14804325638',
    '37998592244',
    'r-dos-ferreira2012@bol.com.br',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1091504129,
    'Orlando Odilon da Silva',
    '46624001801',
    '19992436079',
    'odilon21@yahoo.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1091725885,
    'Felipe moda',
    '45926826888',
    '11967633954',
    'felipehomeoakley@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1091965442,
    'Paulo Henrique Oliveira de Souza',
    '24201814840',
    '17981343653',
    'paulonext44@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1092072207,
    'Luiz fernando moraes andre',
    '48769872899',
    '11953948153',
    'Luizdodolie@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1092209351,
    'Adriana Travassos de Moura',
    '38857231828',
    '16997631782',
    'bizolati.doriath@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1092551453,
    'Jackson Bruno caires Pinto',
    '06818046533',
    '77998019937',
    'jackson.caires@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1092848835,
    'Pedro Queiroz',
    '43495548823',
    '11953360072',
    'pedriin_1995_14@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1093104615,
    'Joao Victor trezza lessa Garcia',
    '12626009601',
    '35991050451',
    'lessa.trezza@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1093142174,
    'Gustavo Antonio Braga goncalves',
    '37796094876',
    '21997080819',
    'Gbfaturamentomedico@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1093394530,
    'Lucas da Silva Machado',
    '11704601940',
    '46984156087',
    'lucaschocomil1213@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1093394731,
    'Arthur Gonçalves Silva',
    '11930743637',
    '34998851830',
    'arthur21goncalves@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1094142151,
    'Gustavo reolon Silva',
    '03390886052',
    '51985730539',
    'gustavoreolon4@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1094330234,
    'Edson Moreira de Lima',
    '08499511430',
    '13991618200',
    'edsonmorei1008@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1094551987,
    'Lucas de Souza Hyano',
    '48763301822',
    '15988175052',
    'lucashyano@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1094926164,
    'Tulio Victoria vieira',
    '03971363075',
    '53981359458',
    'Tuliovv25092000@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1094978539,
    'Julinho Silva',
    '01908298006',
    '81987654567',
    'julianabrado2@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1095545505,
    'Waldelio José de santana Junior',
    '44002594807',
    '13997424804',
    'Waldelioabc@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1095676245,
    'TIAGO batista da Silva',
    '03625156113',
    '61998709178',
    'tiagotbs92@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1095688409,
    'Andreus',
    '18742453801',
    '11963811203',
    'andreosmartins98@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1095847358,
    'Joelson Silva Ferreira',
    '04464274382',
    '98991039957',
    'Joel.trader18@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1096088103,
    'Venicius da Silva barbosa',
    '54858283291',
    '93991478493',
    'Avlissuicinev@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1096371261,
    'Jhonatan Clemente Sana',
    '12888266725',
    '24981531446',
    'jhonatanclement@hotmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1096698684,
    'Jorge Luiz Quirino Camilo',
    '11991398905',
    '48996728721',
    'jl.quirino38@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1097499652,
    'Wagner willian ferreira dos santos',
    '12808958617',
    '38991265383',
    'Ferreirawagner480@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1097724514,
    'Fellipe Pereira da Silva',
    '42375748816',
    '11982999828',
    'Fellipe.pereira2@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1097863432,
    'Lucas Ribeiro',
    '38620203800',
    '11957877647',
    'lucaslps99@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1098081383,
    'Pedro Izidio Pereira da Paixão',
    '00324067208',
    '91982242216',
    'pdropaixao27@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1098330536,
    'Murillo Colli',
    '42410978800',
    '15981602154',
    'mhcolli.trader@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1098514620,
    'Constantim murachev reutov',
    '06226131110',
    '66997155646',
    'Kontamtonaz@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1099731979,
    'Rafael Nunes Magalhães',
    '13723143695',
    '35999403871',
    'rafaelmagalhaes586@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1099922973,
    'PAULO RICARDO FERREIRA DA COSTA',
    '70075857103',
    '65984431822',
    'Paulojuliana1122@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1099969701,
    'Márcio Santos Ferrer',
    '11838514481',
    '81985647090',
    'Marcioferrer3@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1100016803,
    'Luan dos Santos Barroso',
    '39385687808',
    '11987664296',
    'lsb782963@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1100157217,
    'GISELE  NUNES',
    '75075687172',
    '61999277577',
    'Giselenunesdepaula1212@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1100229125,
    'Murilo Sergio Rossi',
    '22859105840',
    '19989081458',
    'cazuzarossi@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1100440285,
    'Rayllone correia rosado',
    '13538342636',
    '31997118435',
    'rayllonecorreia02@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1100461561,
    'Mateus Brito Lopes',
    '03230356209',
    '95991254926',
    'mateusbrito421@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1101210435,
    'Anderson Balt',
    '09004618961',
    '49991089505',
    'Andersonbalt@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1101355019,
    'Renato dos Santos Lopes',
    '09843090713',
    '21970430531',
    'Renato100108@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1101504686,
    'Illan Matheus Hochscheidt',
    '82212546068',
    '51998926978',
    'Illan_matheus@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1101747383,
    'Victor Pacheco da Silva',
    '01770990119',
    '67993048146',
    'victorpacheco128@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1101869009,
    'Lucas de albuquerque',
    '12660355401',
    '81999699655',
    'Lucasojuara2020@outlook.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1102908828,
    'Evellyn Souto',
    '01395809216',
    '69920000848',
    'evellyn.banzza@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1103973088,
    'Hugo Henrique Leonel de Paiva Lima',
    '10478483414',
    '83998138122',
    'hugoleonel10.hl@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1104179618,
    'Carlino da Silva',
    '07464242807',
    '13997950186',
    'alfredocarlos553@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1105668736,
    'Gabriel Luiz Pedro',
    '45355978800',
    '14998723341',
    'Gabriel.pedro.bigode@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1107327459,
    'Gustavo Albuquerque de Oliveira',
    '13639493737',
    '21991985416',
    'Albuquerque.gustavo1992@Hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1107861864,
    'SAMUEL REUS DO NASCIMENTO',
    '33961442363',
    '88992975587',
    'Samueltrader8@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1107864912,
    'Matheus Henrique Niendicker',
    '10212454960',
    '46999150308',
    'matheus.ndk.eng@outlook.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1107977697,
    'Marco Antônio Rodrigues de Araújo Filho',
    '01575709163',
    '62991732134',
    'Marco10filho@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1108081684,
    'Edson Alves Bitencourt',
    '80345395549',
    '73981544886',
    'drivealisson01@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1108200822,
    'João Lucas Ferreira de Assunção',
    '10341782963',
    '41997352676',
    'jlucasfa.jl@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1108418867,
    'Edizio Brito dos Santos Junior',
    '08318747593',
    '11933152634',
    'edizio5junior@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1108877489,
    'Bruno Henrique Scherer',
    '63717670034',
    '51995959070',
    'brunoscherer37@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1109700085,
    'Rafael Brianez Oliveira',
    '39976451830',
    '19995540150',
    'rafabrianez@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1109727299,
    'juan brendo da conceicao',
    '70245478205',
    '94991634336',
    'juanbrendod@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1110135743,
    'Victor gazzani',
    '44678383840',
    '11975559752',
    'Victorgazzani@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1110368680,
    'Deivid Alves de Souza',
    '51152810820',
    '11932460631',
    'deividsouza19@outlook.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1110448840,
    'Romulo Trentini Ely',
    '02091552569',
    '71984911929',
    'Romuloely@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1110795649,
    'João Batista consorti bichuette',
    '11676022694',
    '51984781988',
    'Uilian_moraes@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1111038901,
    'Hallan José barbosa',
    '43915721840',
    '15988340394',
    'Hallanb10@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1111241023,
    'Vinicius dos Reis Rocha',
    '05993581140',
    '62982208031',
    'Viniciusdrr@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1111591911,
    'Lincoln dos santos ferreira',
    '12144519692',
    '34997773555',
    'lincoln_ase@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1111594413,
    'João Pedro P Oliveira Ferreira',
    '06029696114',
    '66984351385',
    'jogadorjpedro@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1111954875,
    'Orestes Nepomuceno do Nascimento Lofiego',
    '01542039126',
    '67981525803',
    'lofiegorestes@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1112152986,
    'Felipe remboski',
    '03424865001',
    '54991918462',
    'feliperemboski10@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1112217380,
    'Felipe Santana Magalhães Cardoso',
    '07808285501',
    '71997195936',
    'felipesantana703@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1112858591,
    'Ricardo de Sousa Coelho Júnior',
    '12390990614',
    '33988136973',
    'ricardojunior-12@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1113608827,
    'Gabriel Henrique Alves',
    '38006011842',
    '14996037191',
    'gabriellhk2@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1113933609,
    'Murilo Jesus Couto Pereira',
    '11326988638',
    '38998017159',
    'mrilocouto@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1114651480,
    'Davi do monte Eugenio',
    '47240345807',
    '11960599758',
    'Davimonteeugenio@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1114865594,
    'José Marcelo Pinheiro',
    '06354883106',
    '38997274110',
    'likolove1996@icloud.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1115728364,
    'Adiel Sousa de carvalho',
    '13089913631',
    '11933882252',
    'adielsousa97@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1115816043,
    'Felipe sape schaefer',
    '03918945014',
    '54996839173',
    'felipegramado@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1115820235,
    'Loui Cossalter',
    '46280056805',
    '16981111056',
    'louicossalter@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1115826397,
    'Edmundo Gabriel Sota Araújo',
    '63308065355',
    '85991714240',
    'sotaaraujo156@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1115902227,
    'Fernando Othon',
    '08644607677',
    '37998589930',
    'fernandoothon@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1116050384,
    'Valto Gomes Pereira',
    '04738745557',
    '73998560488',
    'Valtinho2007@outlook.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1116239634,
    'Lucas de Paiva Lino',
    '47811162806',
    '11958067878',
    'lucasp.lino06@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1116659322,
    'Antony Jardiel Vieira dos Santos',
    '07519793338',
    '85998001188',
    'Jardiel_do_style2013@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1116866946,
    'Flaviel seguins Borges',
    '06276553352',
    '98988552933',
    'flavielpinturas@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1116920205,
    'Gabriel Henrique Lima Viana',
    '38661342821',
    '16993211612',
    'bibicolima.com@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1116996301,
    'Luis gabriel de Sousa gomes',
    '12824645741',
    '21982205814',
    'Gabrielpit8@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1117073225,
    'Magno Gomes da Silva',
    '11045468762',
    '21971956866',
    'magnoestru@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1117104901,
    'diego',
    '05675632786',
    '21985620493',
    'dimsan123@yahoo.com.br',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1117253504,
    'Luiz Antônio da Silva',
    '13717223666',
    '33999674244',
    'Luiz.antoniospf10@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1117651891,
    'Rodrigo da Costa Mattoso',
    '52037919883',
    '19997324237',
    'Rodrigo_mattoso@outlook.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1118962840,
    'Erivan Cota dos Santos',
    '03224852232',
    '92984941808',
    'erivangod22@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1119130921,
    'Valdinei júnior water',
    '12211852920',
    '45991589995',
    'valdinei1water@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1119341366,
    'Gabriel Maquim Honorio',
    '12533677957',
    '41996477958',
    'gmaquim7@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1119621803,
    'Carlos Henrique moret Frassate',
    '09461924992',
    '41996942479',
    'carlosmfrassate@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1119678970,
    'Ângelo Jordão mote',
    '18328583755',
    '27988679945',
    'angelojmote@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1119856709,
    'Ygor Fagundes Ramaldes Silva',
    '46753685812',
    '11998903384',
    'ygor_ramaldes@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1120251129,
    'Vitor Coelho Drummond Reis',
    '10642761647',
    '35997205016',
    'Vitudrummond@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1120346614,
    'Diogo da Silva Oliveira',
    '45917567859',
    '18996423502',
    'diogosilva.oliveira1803@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1120350843,
    'Juliano Bueno Corrêa',
    '74422419056',
    '55992105394',
    'Buenocorrea@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1120357652,
    'Airton Célio de Souza Lopes',
    '13223210784',
    '53981484499',
    'airtoncslopess@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1120382803,
    'Gustavo henrique xavier pereira',
    '49523080814',
    '11959636145',
    'Gustavo.xavier7@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1120420017,
    'Julio cesar correia de almeida',
    '04354387514',
    '77999674344',
    'Jubadinha@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1120820784,
    'Marrion jesse garcia de morais',
    '01945818107',
    '64981507966',
    'Mjgmerrin@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1121048122,
    'Matheus da Silva chiao fonseca',
    '35035206866',
    '13997119268',
    'Matheusdasilva_16@outlook.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1121421214,
    'Elias de Mello',
    '06256256174',
    '65993076306',
    'mellovilas2@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1123062508,
    'Junior Moreira de Jesus',
    '43864566860',
    '14997660095',
    'moreira.junior18@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1123128076,
    'Alex miguel vieira ploencio',
    '11676746935',
    '47997783261',
    'Alexvieira3383@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1123394517,
    'Tiago Silva leite',
    '40622686801',
    '11952498496',
    'tiagosilva129100@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1123409851,
    'Rodrigo Pereira dos Santos prado',
    '10297567594',
    '77988276671',
    'rodrigo.driw1@outlook.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1123736344,
    'Walmir santos costa',
    '46227910805',
    '11978041945',
    'Walmir660@yahoo.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1123871172,
    'Paulo Victor Soares da cruz',
    '33325989888',
    '11981992543',
    'psoaresdacruz@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1124860147,
    'Ian de Oliveira',
    '43918784886',
    '11996007257',
    'Oliveira.ian@yahoo.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1124936800,
    'Gustavo Carvalho de Oliveira',
    '06686995665',
    '35997206537',
    'Gustavo.co2019@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1125690812,
    'Luís Eduardo Figueiredo Pereira',
    '12917900636',
    '35984297681',
    'dudu.le675@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1126582459,
    'André Luís Soares Guimarães',
    '10546609996',
    '44998646633',
    'andreguimaraes.cia@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1126658291,
    'Lucas Agustinho Leal',
    '47205747856',
    '19997774130',
    'agustinholeal1997@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1126856740,
    'Gilson dherick Oliveira Machado',
    '02578849200',
    '48988175800',
    'gilsondherick@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1126894497,
    'Leonardo v campos',
    '17949390751',
    '22988225053',
    'leonardo.nata2018@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1127098324,
    'BRENO BATISTA MIRANDA',
    '70228902690',
    '35997346645',
    'Brenomiranda202013@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1127113455,
    'Caio Henrique',
    '51910028819',
    '18996743844',
    'Caiomatioli02@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1127152434,
    'Marcos antonio vieira',
    '02001703686',
    '31999876556',
    'Marcosvieiralira@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1127390650,
    'Carlos Eduardo Mayer',
    '07793329970',
    '41998424376',
    'Carlosfelipemayer@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1128086341,
    'Ricardo de Souza Paula Amorim',
    '15651712763',
    '21966096385',
    'ricardospamorim3@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1128553536,
    'Moisés Braga de Sousa costa',
    '00073898252',
    '91982970306',
    'moises.costa22@live.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1128608443,
    'Ricardo perucio soares filho',
    '13239948745',
    '21965784503',
    'Ricardoperucio62@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1128643929,
    'Eduardo Martinelli',
    '02164018010',
    '54996923863',
    'eduardomartinelli430@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1128870162,
    'Oscar Greff Politta',
    '04230517173',
    '66996977797',
    'Oscarpolitta@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1129073223,
    'Victor Kainan Rodrigues Lima da Silva',
    '11859651909',
    '41999804723',
    'Victor.kainan@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1129784582,
    'Edgar da Costa Teixeira',
    '14223689711',
    '21967393399',
    'edgarcosta14@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1130630800,
    'Jacqueline Oliveira',
    '86350562569',
    '47984736116',
    'jakesant85@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1131042196,
    'ADALBERTO Penna Melo',
    '37145620871',
    '12997402880',
    'Samtos19@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1131254171,
    'Valmir Costa de Melo',
    '07579027585',
    '75988250880',
    'Valmir.costa106@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1131471804,
    'Margô Aparecida schimaski',
    '02761371160',
    '65984354685',
    'margosilva.rh@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1131792431,
    'Marcos queiroz',
    '16963195790',
    '22988247914',
    'Kenhomq@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1132053604,
    'Aliph de souza',
    '15973229700',
    '21968419169',
    'aliph.souza@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1132308765,
    'Pedro Octávio Selvate',
    '14317084619',
    '35991766836',
    'pedroselvate72@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1132522834,
    'Lucas de oliveira',
    '16845598711',
    '27997231522',
    'lucasampa16@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1133025085,
    'Leonardo Paes Medina',
    '82338567030',
    '51997529379',
    'lucgames90@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1133114004,
    'Jefferson Augusto leal Lemos',
    '05636408390',
    '88981247349',
    'lealjeff@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1133405619,
    'Maria Clara Berreel Neves',
    '15720791779',
    '21971471315',
    'mclarabneves@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1133850844,
    'Vinícius da Silva Sousa',
    '50023321881',
    '11943030486',
    'vs613589@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1134454922,
    'matheus bertao',
    '42929069805',
    '12997211244',
    'matheusbertao12_@outlook.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1134484853,
    'Gustavo Macedo da Silva',
    '47237225804',
    '13988657502',
    'gustavomacedodasilva@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1134915722,
    'Luma dos Santos Lima',
    '16263778717',
    '21964804270',
    'contatolumalima@yahoo.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1134993505,
    'Douglas Santos souza',
    '16365459203',
    '11973424521',
    'yashirosm@hotmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1135011601,
    'Andrei Kauan Cunha',
    '10701380969',
    '47984717351',
    'andreijuridicobr@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1135739217,
    'Diego da Silva',
    '03035758085',
    '51993225540',
    'arquibanes28@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1136386094,
    'Roseli Zita da costa',
    '08724842621',
    '33999997917',
    'mesckpretin@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1136477630,
    'Samantha Alves Ferreira',
    '02381520228',
    '92993955116',
    'Samanthaalves5@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1136589926,
    'Wellington Godois Da Silva',
    '10434098906',
    '47996019302',
    'Wellington.godoix.x35@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1136727394,
    'Paulo Henrique',
    '42943788082',
    '16988657487',
    'sousapaulin18@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1136877520,
    'Guilherme Alvarez Assumpcao',
    '03312729033',
    '51995137727',
    'Guilhermealvarez.2000@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1137383074,
    'Davi Leão Alves dos Santos',
    '41132828899',
    '11977386550',
    'davileao.alves6550@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1137400537,
    'CARLOS AUGUSTO SANTOS Gonçales',
    '37770804892',
    '16991703380',
    'guel12925@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1137441573,
    'Arthur Henrique César Rodrigues',
    '17126434790',
    '27995813213',
    'Aasfvfe@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1137475683,
    'Jean Wesley Da Trinidade Matos',
    '04022141026',
    '51992248429',
    'Jeanwtm05@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1138201722,
    'Carlos Rocha dos Santos',
    '06197797640',
    '73999294893',
    'Kall6984belly@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1138217815,
    'Denis Nunes da Silva',
    '04250490270',
    '91981125061',
    'denis3d.nunes@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1138818381,
    'Vinicius Luís Márquez liermann',
    '11734206900',
    '47992731291',
    'Vinimarquez950@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1139997617,
    'Maxwel ventura',
    '15334528733',
    '21966584397',
    'maxwelventura64@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1140335220,
    'Fábio Sanaioto',
    '89272315034',
    '54996948879',
    'www.sansiotof@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1140456655,
    'Igor da rosa frasson',
    '09235141982',
    '48991126582',
    'Igorfrassonhot@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1140495871,
    'Lucas Aquino de Souza',
    '46941745843',
    '11969267529',
    'lucas2016.aquinodesouza@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1140791348,
    'cassiele ALDEIA',
    '05837169113',
    '61982238801',
    'kassinhapsa@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1140796637,
    'Ivison Medeiros',
    '62528939434',
    '81996795521',
    'Ivison2003@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1140841192,
    'Jean bryon',
    '32856282199',
    '55984093423',
    'asunayuuck@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1141499745,
    'William Cesar Argenta',
    '02767704047',
    '54991676436',
    'William_argenta@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1141527337,
    'Adriano Luiz Gonçalves Dos Santos Junior',
    '48620415824',
    '17991253526',
    'garcia-santos@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1141973852,
    'Vinícius santos costa',
    '35928537832',
    '18997685287',
    'viniciussc514@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1142019941,
    'Diego Bastião de jesus',
    '08986159503',
    '74999683138',
    'sttsdiego8@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1142200786,
    'Leo Randy Alaluna Fonseca',
    '18611703782',
    '22981523155',
    'leorandyfonseca2@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1142472793,
    'Léo Angelos Araujo Chaves',
    '10901750603',
    '31995606535',
    'leon7l@yahoo.com.br',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1143087190,
    'Robert Matheus da Silva',
    '49256741881',
    '11970430624',
    'Arte.quente@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1143400222,
    'Elves Marinho de Almeida',
    '07249323482',
    '11980845325',
    'elvesmarinho97@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1143720011,
    'Dandara',
    '07659000926',
    '43999860942',
    'dleonardo414@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1144690718,
    'Daniel kobelinski',
    '03771639107',
    '66984269513',
    'daniel_kobelinski@live.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1144955834,
    'William Menezes Souza',
    '87031787068',
    '61996234495',
    'williammennezes@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1145293776,
    'Oswaldo Silva Neto',
    '51401841848',
    '13996066728',
    'Jefsjfh@hotmail.con',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1145389072,
    'Ruan Sizino de Almeida',
    '17101567754',
    '27997101270',
    'ruan2002almeida@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1145936806,
    'Tarcísio Nascimento Filho',
    '11201798906',
    '47988115060',
    'Tarcisionascimento2011@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1146045056,
    'Lucas Gabriel dos Santos Alves',
    '39185520802',
    '19999572242',
    'lukaasgabrieel65@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1146485184,
    'Ranilson Herbert Das Neves Soares',
    '10570088429',
    '83986760412',
    'ranilsonherbert@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1146518308,
    'Keilla lima de queiroz',
    '49160894806',
    '11944732719',
    'Keillalimadequeiroz@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1147135588,
    'Lucas Matheus da Silva pedro',
    '09037302947',
    '43984333489',
    'lucasmatheus7598@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1147445497,
    'Tiago',
    '45338427800',
    '16988579564',
    'carvalho83tiago@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1147583210,
    'Gabriel Carlos Peluso',
    '14385460760',
    '31994523447',
    'gabrielcarlos_15@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1147628574,
    'Lucas setter',
    '09659839944',
    '47991052599',
    'lucas.setter@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1147700068,
    'Wagner Washington Nogueira Júnior',
    '20825796709',
    '27996366856',
    'Userfinal123456@icloud.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1147847964,
    'Gabriela Pinheiro Reis',
    '03693628025',
    '54991035126',
    'gabrielreis7833@outlook.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1148785536,
    'Luan Fiuza do Amaral',
    '03338174004',
    '51980406177',
    'luanfiuzaamaral@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1149441111,
    'Antônio Carlos dos Santos de sousa',
    '04752922355',
    '85997986113',
    'carlostroll100@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1149456266,
    'Luiz Henrique Affonso Da Silva',
    '17342454761',
    '27995025910',
    'rb952770@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1149466921,
    'Brayan benvive',
    '40479835861',
    '11982057035',
    'Benvivebrayan@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1149688239,
    'Rafael redivo',
    '06534243962',
    '48998385911',
    'rafaelredivo@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1149811923,
    'Lucas Enrico Furigo',
    '54152568810',
    '15991418778',
    'Lucas.enrico.m@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1150132045,
    'Everton Rodrigo Stempkowaki Maciel',
    '06300326101',
    '48985004221',
    'Garrincha.cotri@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1150454756,
    'Murilo Vinicius Correa da Rosa',
    '12985337917',
    '47997416602',
    'murilo.darosa.316@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1150569759,
    'André Alexandre Hifran',
    '82552223249',
    '69992993869',
    'andrehifran@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1150930154,
    'Lucas Daniel',
    '51117441857',
    '11972254722',
    'lucs1990gte52@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1151327035,
    'Bruno Rodrigues Sena Pereira',
    '70380180197',
    '63992470167',
    'brunosenar99@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1151384775,
    'Julio Cesar stunn borba',
    '01925375048',
    '51986604123',
    'julio.stunnborba@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1152254042,
    'Gabriel Lopes',
    '11915396603',
    '32991550363',
    'gabrielmlopes01@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1152945321,
    'Alvaro Messias Nascimento Nunes Silva',
    '62335786393',
    '99921533314',
    'alvaro.messias10@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1152968202,
    'Paulo Henrique Toledo',
    '43757603893',
    '11970990071',
    'htpaulo@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1153208310,
    'Gabriel Lucas Bionda da Silva',
    '13116951926',
    '43998363656',
    'Lucineia878as@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1153237331,
    'Ricardo rafael de Miranda Pereira',
    '06637592420',
    '81992766080',
    'rickfrains29@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1153319134,
    'Wevertton de Sousa matos',
    '71110407165',
    '64996117733',
    'wevertton3303@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1153417992,
    'Lucas Gomes de Lima',
    '48934641835',
    '11965878484',
    'Luquinhaslima.2010@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1153423021,
    'Francimaria Vieira de Freitas',
    '84690062587',
    '77998028249',
    'francimariavg@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1153589613,
    'Carlos Henrique Cruzeta',
    '12680525906',
    '41997567846',
    'chenriquecruzeta@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1153735946,
    'Luís Eduardo Viana',
    '08102640308',
    '85996543807',
    'Luisesuardoviana23@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1153821811,
    'Fabiano de morais',
    '04691314970',
    '45999240083',
    'Fabiano_fm_91@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1154396243,
    'Maria Eduarda',
    '05427443177',
    '66999322082',
    'dua.aa@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1155553835,
    'Rhyan da Silva Macedo',
    '11025229967',
    '44991801635',
    'Tifutifunzinho@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1156088024,
    'Gustavo P Ribeiro',
    '05321692041',
    '53984177057',
    'gugupenning9@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1156393686,
    'Leonardo da Silva Campolina',
    '02116655684',
    '31998686587',
    'leonardocampolina75@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1157671301,
    'Joao batista pereira da silva',
    '06689683389',
    '94981517105',
    'Jb92468600@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1158358812,
    'Cleber Silva nascimento',
    '01568672659',
    '31971721829',
    'Clebersilva28nasc@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1158514586,
    'Matheus Pedro da Silva',
    '47449393840',
    '11960989849',
    'matheuspedro.contato@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1159149834,
    'Matheus constancio do nascimento',
    '04185152205',
    '68999425893',
    'matheusconstancio6@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1159389689,
    'Guilherme Bryan da rosa',
    '09404111996',
    '48991434110',
    'Makebaphopro@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1159859821,
    'Gabriel Augusto da Costa LEAO',
    '46141760899',
    '18996555449',
    'gabrieel_2012@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1159923958,
    'Tiago Hernandes Cardoso',
    '03820594175',
    '66999251029',
    'Tiagohernandes75@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1160539195,
    'Jonas da silva',
    '82053989092',
    '71998740812',
    'progba.lacoste@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1160596655,
    'Higor de Souza Navarro',
    '38781923805',
    '18996661229',
    'higornavarro@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1161187120,
    'Jhonatan Vinicios Reisdoerfer',
    '08481021938',
    '46984009029',
    'jh_vinicius@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1161362348,
    'Heitor Ranan do Vale Borges',
    '10631598650',
    '37999644455',
    'Borgesheitor26@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1161930363,
    'Sergio felix da Silva',
    '10302274464',
    '81989082918',
    'Serginhofelix63@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1163050620,
    'Isaac farias Bertolim',
    '07783842178',
    '67998566234',
    'Isaac_windows@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1163304757,
    'João Antonio Ribeiro Sperandio',
    '10228663970',
    '43999742968',
    'joao98sperandio@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1163543326,
    'Kaio Gonçalves da mota',
    '14970758743',
    '21995646637',
    'Kaiokm100@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1163547853,
    'Rafael menenguci de Oliveira',
    '14850793738',
    '24999892047',
    'Soaresjoyce45@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1164232558,
    'Jadson Smith Cardoso Silva',
    '01548876259',
    '91992987587',
    'jadson.smith.silva@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1164433926,
    'João Antônio Pereira Silva',
    '70719126100',
    '62998662864',
    'pereirasilvajoaoantonio94@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1164782136,
    'William santos Silva',
    '05661077599',
    '77991899729',
    'willgameplay2019@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1165300257,
    'Daniel Aguiler Barbosa',
    '03940763110',
    '61995567950',
    'dan_m3@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1165633863,
    'Lucas Pereira',
    '21487575041',
    '61984476809',
    'LucasPereira@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1165664750,
    'Victor Hugo Correa Jose da Silva',
    '06855500102',
    '62981375546',
    'victorglobi4@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1167416391,
    'Leonardo Moreira Maciel',
    '47055469899',
    '11945894821',
    'lion.walker70@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1167512393,
    'fabiano monteiro da silva',
    '71588515168',
    '61991051500',
    'pedro_saps@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1167583009,
    'Robson Vasconcellos',
    '08311035903',
    '47997556181',
    'Praquetudoisso@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1167910696,
    'ygor volgkes',
    '18087152760',
    '27995217701',
    'angelojm362@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1168146254,
    'WILMER Martinez filho',
    '41695831837',
    '17998776654',
    'Wilmer_poker@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1168340369,
    'Ruth Vieira de Lima Silva',
    '15689759708',
    '21976099233',
    'ruthvieiira@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1168371796,
    'Karliane Gonçalves ferreira',
    '61023295385',
    '62995016724',
    'karliane169@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1168406243,
    'Thiago de Oliveira e Silva',
    '06215686433',
    '81997938983',
    'toliver1777@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1169389283,
    'Carlos Augusto lemke',
    '01805913042',
    '53999636414',
    'carlostatiaholzlemke@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1169755499,
    'Vitor Gabriel de Souza Gaia',
    '52934800814',
    '12991177711',
    'vitor.g.gaia@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1169897561,
    'pedro ivo cordeiro martins',
    '05499581428',
    '81997164518',
    'pedroivocma@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1170009172,
    'Jean Carlos de oliveira',
    '10673866459',
    '81998048427',
    'jean.oliveira11@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1170029274,
    'Michel Pereira Afonso',
    '70507336607',
    '34999524364',
    'michelpereiraafonso@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1170753092,
    'Julia Jacques',
    '11173983902',
    '48996374172',
    'juliacriciuma@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1171109598,
    'Andre luis rezende de andrade',
    '37584137881',
    '16992963648',
    'andrethemobile@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1171482566,
    'Daniel de Souza Pontes',
    '18534326797',
    '22997311163',
    'danielpontes1005@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1171827200,
    'joel Dias de Menezes',
    '70500780188',
    '62994107614',
    'joeldiasmenezes@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1171980514,
    'Allan lima da Silva',
    '15241380701',
    '21971606204',
    'Favoritos_do_bonekinho@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1172268486,
    'Matheus kevin Soares da Silva',
    '07581511103',
    '67992173891',
    'yukimipolity15@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1172392299,
    'Douglas Felipe',
    '91571779027',
    '47998786223',
    'ananannanana@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1172990780,
    'José Alan Capistrano Borges',
    '09456932575',
    '71999521012',
    'alancapistrano35@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1174676950,
    'Daniel da Silva  Barbosa',
    '05420537729',
    '21995645513',
    'Matheusoptimus01@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1174749749,
    'Gabriel Bittencourt Pereira',
    '18129063743',
    '24999616264',
    'barbaramarina.zanute@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1174757146,
    'Daniel Barbosa de Freitas',
    '09578979959',
    '46988293115',
    'danibarbosa1912@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1175149090,
    'Bruno Andrey Nascimento de Freitas',
    '49682626803',
    '11940713193',
    'bruninhoandrey97@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1175447340,
    'FLEDYSLHEVERTON BIANQUE DOS SANTOS',
    '11789138566',
    '71996456621',
    'eroshammer7.2k@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1175454679,
    'Paulo Henrique Silva matola',
    '49697333840',
    '11981264620',
    'paulohenriquesilvamatola@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1175511861,
    'Francisco liedson Xavier de Sousa',
    '08944947325',
    '85991258812',
    'sliedson163@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1175690215,
    'Arnaldo Andres Leandro',
    '11857258908',
    '45998616686',
    'arnaldoleandro1@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1176608181,
    'LUCAS LEONAN DA SILVA OLIVEIRA',
    '70048356263',
    '91984471984',
    'Lucas.leonan48@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1176639997,
    'David de medeiros Junior',
    '07862633938',
    '48984221544',
    'David_medeirosjunior@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1176707988,
    'Lucas Peixoto',
    '13134383675',
    '31982304771',
    'lucaspeixs@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1177325590,
    'David pollo roza',
    '42198246856',
    '16992117336',
    'Dpollo37@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1177536483,
    'Arthur Luchetta',
    '02091149080',
    '51999956613',
    'arthurluchetta@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1177549406,
    'Marcos Rygoll',
    '02754562001',
    '51998812234',
    'Marcosrygoll7@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1177711637,
    'Felipe de Souza Correa',
    '10969015011',
    '24998341663',
    'felipebmr@outlook.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1178368061,
    'Luis felipe Oliveira',
    '47181392875',
    '17988348709',
    'Luiisphlipe@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1178575683,
    'Wuender Bueno Martins',
    '05273950139',
    '67999427470',
    'Wenderbueno40@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1179051172,
    'Uriel Evandro da Silva Reis',
    '08509467196',
    '67999652565',
    'ureis1707@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1179304916,
    'Anderson Veronezi Sforni',
    '43716158801',
    '11982336475',
    'anderson_sforni1999@outlook.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1179423283,
    'Gabriel redoglia nogueira',
    '40955300819',
    '71992654579',
    'gabrielmspturismo@outlook.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1179423534,
    'Daniel barros de carvalho',
    '60488651395',
    '98987376009',
    'carvalhofack@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1179781470,
    'Thassio Guilherme rosa Ribeiro',
    '01234798190',
    '67981700237',
    'Thassioguilherme_@Outlook.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1179791690,
    'Marlon dntias santos',
    '15969115738',
    '21973169861',
    'Norattorei2@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1179938399,
    'Matheus Archanjo',
    '06016794740',
    '28999480821',
    'matheusarchanjo21@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1180097761,
    'Gonzaga De Souza Ribeiro Junior',
    '40283769807',
    '17991791499',
    'Souzajuniorribeiro@outlook.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1180727608,
    'ephylles Moura Fernandes de Oliveira',
    '45142212878',
    '11934703925',
    'kcristiinny@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1180729891,
    'Brandon Hector Campos de Araújo',
    '70489348408',
    '87988058395',
    'brandonhectorcampos@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1180867555,
    'HENRIQUE EDUARDO JACOB DE JESUS',
    '05395483160',
    '62991616774',
    'henriqueedu150@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1180978082,
    'Robson Rafael de Oliveira',
    '16262065709',
    '22998743100',
    'vianar624@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1181330855,
    'William costa',
    '03029903052',
    '51995370038',
    'willcostaruppel@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1181639390,
    'Afonso santos de Araújo',
    '42393929851',
    '11941225775',
    'Afonso.plementor@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1181645809,
    'Erik Coqueiro Kochhann',
    '04339918105',
    '45984318226',
    'erikcoqueiro11@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1181728111,
    'Eduardo dos Santos Almeida',
    '37939855808',
    '44998427176',
    'eduardoplenoconsultoria@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1182048511,
    'Orlando Pinna',
    '14882025752',
    '21991141373',
    'smergle9@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1182788188,
    'Alexandre Barroso de Almeida',
    '18303127748',
    '22997162435',
    'lexandrebaal@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1182891418,
    'Raquel Santana da Silva',
    '04244757155',
    '65999124530',
    'raquel.santtanaa@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1183446792,
    'Celso Pires martins filho',
    '13352085692',
    '37999477999',
    'Celsomartins999@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1183711396,
    'Fabio Alexandre Brambilla de Oliveira',
    '36654045840',
    '11945116835',
    'Fabio_vig@outlook.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1183935460,
    'Wilson Ribeiro dos Santos Júnior',
    '70382333195',
    '63984008024',
    'wilsonjunior.atm@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1184088487,
    'Denis Vicente da Silva',
    '35752841801',
    '15998290943',
    'denissilva087@outlook.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1184348227,
    'Otávio Fernandes',
    '16283195776',
    '22992683566',
    'pifernandes314@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1184575246,
    'Jeter Portugal',
    '46289114875',
    '11976420624',
    'jeterportugal9@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1184660742,
    'Matheus Henrique Miranda de Araújo',
    '11923215612',
    '31975073614',
    'Matheus_super_miranda@hotmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1185116955,
    'Igor Santana da Silva ortiz',
    '07822730177',
    '67992580379',
    'Igor.santana.1030@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1185230503,
    'Adriana Scarlett Nazaré de Almeida',
    '15276957606',
    '31975774048',
    'adriana3scarlet@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1185345731,
    'Matheus',
    '22122418877',
    '17988243792',
    'bghost159753159@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1185792971,
    'Caique Gabriel Rodrigues',
    '70445268107',
    '62991830596',
    'Caiquegabrielrodrigues@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1185874582,
    'Renan Araújo',
    '49478332899',
    '11960276164',
    'renanaraujomarins@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1186037045,
    'Saulo lima dos santos',
    '02595866257',
    '68992140430',
    'Saulolima.sl5@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1186248631,
    'Vanilda Luzia',
    '55616410691',
    '31998830175',
    'kiszkykk123@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1186817686,
    'Giovani Henrique Ferreira Zamai',
    '45705132808',
    '19989807459',
    'giovani.zamai2017@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1187375774,
    'Anderson Calore',
    '36108696826',
    '11997201487',
    'caloreanderson@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1187493114,
    'José Antônio bianquini',
    '42476601870',
    '17988286160',
    'joseantoniobianquini@outlook.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1187508649,
    'Robson luiz de Lima',
    '10147211999',
    '48984126635',
    'Robsonluizdelima@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1187639600,
    'Mateus Rocha chacara',
    '13218193664',
    '19992545819',
    'R.chacaramateus@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1187811133,
    'Luccas Laryson Gomes dos Santos',
    '18420602795',
    '27997529992',
    'Luccaslaryson234@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1188410842,
    'Dionaldo Henrique dos santos',
    '07162380476',
    '11987557861',
    'dionaldo2012@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1189429022,
    'Diego Freire dos Santos',
    '02241879533',
    '73981802393',
    'Diegofreirew@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1189560111,
    'Alessandro Reizel Nunes',
    '09823876959',
    '67998776962',
    'alessandrorn798@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1189988366,
    'Layonel Peçanha',
    '42662522852',
    '19987212033',
    'layonel.p.f.2016@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1190140712,
    'Lucas Gonçalves da Silva',
    '55266120827',
    '11977510797',
    'ocursos884@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1190340704,
    'Francisco Clementino de Carvalho Junior',
    '08790145470',
    '83999472798',
    'Carvalhoofjr@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1190672279,
    'Cleyson Cabral da Silva',
    '02442775247',
    '92981670285',
    'Cleysoneto@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1191169484,
    'Yuri Luiz',
    '86213619577',
    '11954634932',
    'yluiz35@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1191238980,
    'João Pedro Nery de Almeida',
    '48136469806',
    '18991424828',
    'joao.pedro.nery@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1191830562,
    'David Felipe Soares',
    '12085796656',
    '31994209362',
    'davidfelsoares@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1192350525,
    'Alexandre da Silva de Carvalho',
    '09479254905',
    '41984069069',
    'alexandreadvcarvalho@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1192835660,
    'Eronildo silva Amancio',
    '60666523380',
    '54996718534',
    'eronildoelenilda09@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1192855494,
    'Victor Oliveira',
    '47328748869',
    '13988674438',
    'Victor.hugo151@outlook.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1193114762,
    'Allef Muniz Santana Rocha',
    '44739692821',
    '11949263103',
    'allefusper@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1193713316,
    'Alisson Bruno Lima da Silva',
    '10474527905',
    '47992285191',
    'balisson448@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1193912042,
    'Rafael da Silva miranda',
    '05004476160',
    '61984836255',
    'Rafaelmiran87@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1194103134,
    'Izael da Cunha neto',
    '18668083708',
    '21973914520',
    'izaelcunhaneto@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1194419014,
    'Weslyn Barreto da Luz',
    '10991419740',
    '21974738343',
    'weslynbarreto@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1195158144,
    'Vinicius Nunes',
    '04255150109',
    '67999015499',
    'nunesvinicius225@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1195536673,
    'Erick Rodrigo Borges Pereira',
    '03979923193',
    '62997002043',
    'erick_rodrigoborges@hotmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1195998817,
    'Rafael Almodóvar de Oliveira',
    '42889201830',
    '11991214999',
    'Rafael.almodovar@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1196092228,
    'Gabriel augusto de melo lopes',
    '02304132693',
    '31973087628',
    'Gabriel-irongv@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1196177937,
    'Reginaldo Luiz Alves',
    '11641963751',
    '24988214749',
    'reginaldoluizalves@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1197471635,
    'Félix Pinheiro dos Santos',
    '39035512871',
    '11963545181',
    'felix130597@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1198432784,
    'Fernando Henrique Alves',
    '41516443934',
    '49988645548',
    'anaximando008@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1198901709,
    'tatiane alencar de souza bonicegna',
    '09925122716',
    '27996432015',
    'joseraasch20@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1198940011,
    'arthur',
    '51294412817',
    '11958789107',
    'arthursilva.64588@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1200043046,
    'Eduardo Medeiros',
    '01666996670',
    '34992066780',
    'medeirosedu98@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1200594836,
    'Neniomar leonardo mesquita de souza',
    '51811538878',
    '11947962245',
    'Leo-zc2011@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1200867921,
    'Marcus Paulo Venâncio',
    '08981285608',
    '31999322402',
    'Marcusvinicius.r.a.p@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1200923690,
    'Filipe weyder de Bem',
    '12284754660',
    '35984782260',
    'filipedebem1@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1201960135,
    'Patrick Zouner',
    '04375545038',
    '51996688698',
    'patrickzouner1@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1202101918,
    'Gleison Eliel Santos Maciel',
    '02128325145',
    '61982015198',
    'macielgeisa08@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1202546877,
    'Diego Domingos',
    '14245339705',
    '27996335755',
    'beltrao@hotmail.com.br',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1202553592,
    'Denis Texeira borgis',
    '09822676654',
    '37998379797',
    'dennis-vendas@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1202638726,
    'Matheus da Silva',
    '07889345976',
    '46999776518',
    'matheusbeberf@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1203175032,
    'Aline dos Anjos de Aguiar',
    '06905437352',
    '98992681816',
    'tudoonlineparavoce20@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1203575082,
    'Diego Dantas da Silva',
    '33851169883',
    '34988686747',
    'dantas2909@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1203855612,
    'Isaac Marciel Valejo Da Mata',
    '08294858137',
    '67984456019',
    'isaacmarcielvm@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1204308205,
    'João',
    '17233271747',
    '22991021859',
    'Joaomarceloteixeirad@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1204756922,
    'Nelson Pereira Nunes junior',
    '01053379277',
    '69992740802',
    'juniorllbel@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1204850377,
    'Rodrigo giacobbo',
    '10761367969',
    '46999123206',
    'giacobborodrigo10@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1205848981,
    'Raul Ferreira da Silva',
    '38400754832',
    '19997848596',
    'Raull_silva@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1206109659,
    'Jonas Magalhães Brito',
    '97519049272',
    '96991429578',
    'jonasmagalhaes85@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1206242338,
    'Douglas Gorges',
    '12898143928',
    '47988267149',
    'Douglasgorges7@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1206324404,
    'Marcos Vinicius Ferreira Da Cruz',
    '12487085479',
    '84986274801',
    'Marcosvinicius2016.js39@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1206935548,
    'Rafael Silva da Cunha Angelim',
    '70270484183',
    '61994645323',
    'Rafaelzzynho@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1207043907,
    'Juan Ignácio Rojo Maldonado',
    '71254365109',
    '95981013582',
    'Jignaciorojo77@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1207858753,
    'Gustavo sanfelice martins',
    '46924510841',
    '19971660047',
    'Gustavosanfelicemartins02@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1207897624,
    'Bruno urbano Lacerda',
    '46193315896',
    '16991934803',
    'brunourbanolacerda_10@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1207981741,
    'Leonam da Silva Costa',
    '01955634254',
    '97996116013',
    'Costaleonam22@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1208015132,
    'Jefferson de oliveira da silva',
    '42488420840',
    '14996567753',
    'Jeeeholiveora@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1208356276,
    'Daniel Pereira Santos',
    '15859309708',
    '27998599255',
    'dan.dp188@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1208444655,
    'Paulo Henrique Mesquita Silva',
    '26589249415',
    '91991472071',
    'henriquefsilva345@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1208488493,
    'Michel da Luz',
    '01483327060',
    '47996404590',
    'micheldaluz@live.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1209122584,
    'Leonardo batista lopes',
    '13344337718',
    '22998216771',
    'Leolblopes@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1209450152,
    'Natan trevisan Garbuio',
    '43701273863',
    '16997822657',
    'Natangarbuio85@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1209525754,
    'Pierre Nascimento Santos',
    '08901200481',
    '81998646884',
    'nascimentopierre1@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1209861303,
    'Marcos Matheus Rodrigues',
    '05986542916',
    '44997284843',
    'marcosrodi13@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1210212358,
    'Tácio Gabriel Leonel Pereira',
    '02760425142',
    '61981055653',
    'ptacio56@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1210256146,
    'Mário Victor de Santana Xavier dos Santos',
    '07184462599',
    '71986629894',
    'Santana_x@outlook.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1210468041,
    'Renan da Silva Batista',
    '66108507551',
    '73981590072',
    'elioferreira05@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1211211003,
    'Wyllian Anderson reinert',
    '10202419932',
    '47991560275',
    'wyllianacaetano@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1211605811,
    'Luana da silva pinho',
    '00182961222',
    '92996050991',
    'luluhhhpinho@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1212119365,
    'Fabio Zei',
    '44790653854',
    '11976501167',
    'faabiozeei@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1212432152,
    'Ellyan dos anjos Silva',
    '04435131200',
    '94984279663',
    'Ellyansilva2017@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1212605645,
    'Nathan Pereira dos Santos',
    '06460095329',
    '88997781632',
    'pereiranathan91@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1213033156,
    'Marcos da Silva Cabral',
    '02751395147',
    '62994367494',
    'Mc695672@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1213205030,
    'Fabrício Moreira da silva',
    '09071552942',
    '47984146450',
    'ffabricio2020@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1213448180,
    'Fernando Freitas',
    '40744001897',
    '11993300242',
    'fernandodefreitas92@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1213491696,
    'Lúcia Maria Silva De Santana Lima',
    '56320507500',
    '13981965250',
    'Luciasantana74@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1214223493,
    'Lucas Couto Cerqueira Cruz',
    '50752720880',
    '13996350891',
    'lucasdo8000@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1214296724,
    'Izaak Rerisson Silva De Santana Lima',
    '48271135805',
    '13981125537',
    'Izaaksantanaaz09@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1214604875,
    'Gustavo Lorran',
    '05608448162',
    '65998081515',
    'Gustavolorrammp@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1214614247,
    'Marlon Henrique Luiz',
    '14481899778',
    '21996042943',
    'marlonhconceicao@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1215195627,
    'Alsivanda Pereira da Silva',
    '00870981560',
    '77991511572',
    'coroneltv157@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1215573695,
    'Gabriella Rosa da Silva',
    '13596036704',
    '21995239695',
    'gabrielajparosa@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1215993506,
    'Rafael Aguiar de França',
    '16810973702',
    '21969575090',
    'rafael.aguiar.franca@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1216246647,
    'Adair roque Queiroz Junior',
    '11704516919',
    '47984616296',
    'queirozadair3@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1216362993,
    'Gabriel dos Santos de Freitas',
    '06422105193',
    '61996141779',
    'gabrieldossantosdefreitas@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1217273908,
    'João Henrique Borges Silva',
    '12108478680',
    '34988284525',
    'Joaohenborsil@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1217292350,
    'Felipe Alexandre',
    '42965396802',
    '19999725743',
    'F.alexandreluiz@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1217404061,
    'Pedro lobo da costa Carvalho',
    '31883336848',
    '11977924320',
    'jhosta64@outlook.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1218094953,
    'Alexandre Schimitt',
    '39690638840',
    '13996262042',
    'alexandre.schimitt@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1218316792,
    'VITOR TEIXEIRA',
    '32282112822',
    '11987857135',
    'vitor.teixeira5@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1218462440,
    'Renan Destri de Amorim Terra',
    '18017233701',
    '21985898920',
    'renandestri1999@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1218697850,
    'Antônio Jandir Morais',
    '76720217968',
    '66996886916',
    'giesamorais88@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1218789733,
    'Maycon',
    '08531932904',
    '48998868899',
    'mayconboaventura1@gmail.co',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1219476878,
    'Luiz Henrique Souza Pereira',
    '09128436911',
    '48996254559',
    'Henrique.souzarp28@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1220204585,
    'Adriano c cardoso',
    '22990523804',
    '12981518261',
    'adrianocarabagi@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1220449313,
    'David Lemos junior',
    '40778996808',
    '12991001031',
    'juninhouchoamaciel@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1220615789,
    'William Lima',
    '06627724588',
    '11952398803',
    'welihgton733@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1221039225,
    'Bruno Jun Hashimoto',
    '41479930873',
    '13997905040',
    'hashimotobrunojun947@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1221549512,
    'HUGO ALMEIDA DA SILVA',
    '16165145744',
    '21966012426',
    'hugopcpjr@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1221585915,
    'Kelly Santiago Lopes',
    '42718903830',
    '11949586160',
    'kelly.23lp@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1221816461,
    'Jandir Telleria Colque',
    '43073127836',
    '11998445963',
    'jandir.colque@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1222521158,
    'Lucas Machado rosa',
    '87160579020',
    '51984743797',
    'machado.lucas2020@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1223804875,
    'Marcos Luís Silva',
    '36866941075',
    '31998317509',
    'ragnashaiya@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1224126909,
    'GIVANILDO de Souza Almeida',
    '41077055870',
    '15996813990',
    'givabatera@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1224252193,
    'Teilor natividade da Silva',
    '04219528148',
    '55999323062',
    'teilorsilva2001@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1224723598,
    'Carlos Enrique costa Júnior',
    '16892865712',
    '24981353601',
    'Carlos.enriquejr@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1224802297,
    'JOSÉ DE RIBAMAR BORRALHO ROSENDO JÚNIOR',
    '60706786300',
    '98985121452',
    'juniorborralho.trader@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1224924827,
    'Israel Ribeiro',
    '46141753841',
    '11956846828',
    'ribeiro7297@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1225140978,
    'Alex Sandro p. Vassalo',
    '43119459810',
    '11948309464',
    'Aleex_leco@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1225502262,
    'Nicolas Mairal Gabarron da Costa',
    '45620669890',
    '11988219308',
    'nicolas@sferica.com.br',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1225506722,
    'Maria do socorro',
    '65414314420',
    '84986024885',
    'Xililipeprj1@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1225549934,
    'João Vitor Aurélio',
    '44376903892',
    '11948061269',
    'Vitoraurelio97@icloud.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1225637909,
    'LUCAS BRAGA CAMPOS paz',
    '11140180665',
    '31992636582',
    'Lucasbragapaz@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1226190777,
    'Gustavo Maciel Alvarenga',
    '42273041802',
    '15991454768',
    'gus.maciel42@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1227038767,
    'Marcos Paulo de Assis Miranda',
    '15789238750',
    '21998485232',
    'Marcosvip.mp@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1227760037,
    'Geová Gomes da Silva',
    '04297335344',
    '86988663563',
    'Geovafiel@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1227862196,
    'Josefa maria dos santos',
    '12502308453',
    '81991342613',
    'joao1487@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1228278947,
    'Vinicius Gabriel Sehnem',
    '03688842014',
    '51997671719',
    'the.vini0306@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1228397637,
    'Gustavo Ludovico Soledade',
    '40867549831',
    '11932026611',
    'soledade.ludovico@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1228555997,
    'Wilton Endril',
    '17341703792',
    '22992676366',
    'wiltonendril@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1228579742,
    'Guilherme Daniel de Oliveira Ferreira',
    '51798480832',
    '11985353998',
    'paiacotreinado@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1228911764,
    'Lucas de Castro Magalhães',
    '50181613883',
    '11943921674',
    'lucascaiolcm@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1228935032,
    'Leonardo Azevedo Lanolete',
    '45346469842',
    '13997914486',
    'leonardolanolete@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1228940002,
    'lucas henrique da silva',
    '80041203933',
    '44997180739',
    'deusofharde@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1229156966,
    'Carlos ryan Santos Souza',
    '06543920564',
    '73981443652',
    'Cr14536229@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1229629997,
    'Deyvison Barbosa Maciel',
    '04857673410',
    '21998475226',
    'deyvison39@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1229887679,
    'Rubens Dantas dos Santos Junior',
    '37306786806',
    '11954202798',
    'Rubensdantas21@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1230197205,
    'Ruan Carlos Alves Neves',
    '04354954290',
    '92992696787',
    'ruan.nv07@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1230494258,
    'David de Oliveira Vieira',
    '70266872476',
    '84998557647',
    'Dd742446@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1230669570,
    'João Henrique Marinho',
    '70004533461',
    '83998293176',
    'henriquee0779@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1230796671,
    'Anselmo dos Santos Melo',
    '06854207525',
    '79996424102',
    'anselmo.dudu100@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1231357177,
    'Marcelo Pereira Júnior',
    '13073706674',
    '34991462572',
    'Poney3646@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1231457672,
    'Luiz Fernando Marques dos Santos',
    '11976841909',
    '45988214614',
    'luizmarquestrade@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1231487154,
    'Eduardo Tavares',
    '42444232810',
    '19983316781',
    'duudu.tavares@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1231602927,
    'Kauê Guilherme',
    '87559111025',
    '11945397658',
    'kauegleal@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1232658595,
    'Mateus Souza de Menezes do nascimento',
    '07722298303',
    '86981854112',
    'mateusdjow07@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1232917023,
    'Lucas Costa De Souza',
    '05792841152',
    '61993160232',
    'lc160460@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1233177922,
    'Henrique da Silva Samuel',
    '06732555146',
    '67996397894',
    'thesullivann@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1233204764,
    'matheus mioto',
    '48092772835',
    '16992337665',
    'matheus.mioto2002@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1233321012,
    'Weverton Ferreira Bernardes',
    '16673081732',
    '27999070812',
    'wevertonferreira100t@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1233448544,
    'Lucas Vinicyus Da Silva Parreira',
    '04598087102',
    '63992620268',
    'Lucasvinicyus80@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1233700535,
    'Gustavo Henrique Braz',
    '81694865053',
    '35999422592',
    'Comerciocentralsul@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1234207771,
    'Marco Aurélio',
    '00947420223',
    '92995154623',
    'marco.abreu.nice@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1235279739,
    'Paulo Ricardo Souza Siqueira',
    '70095492143',
    '94992541407',
    'P.ricardo.2010@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1235285627,
    'Cidiano Soares',
    '42735029840',
    '11977257641',
    'alcidiano.soares@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1235424933,
    'Joao Pedro Nascimento',
    '32428463896',
    '11987902930',
    'Joaonasci02@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1235537242,
    'Jean vitor antunes',
    '11901574970',
    '41995340843',
    'jeanantunes13.ja@gamil.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1235637653,
    'Diego alves cavalcante rodrigues',
    '37957685862',
    '11986409511',
    'Alvescavalcanterodriguesd@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1235980714,
    'Edniel Aquino de Oliveira',
    '01219043265',
    '69999310476',
    'ed-nielaquino@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1236085198,
    'Davi',
    '60048040029',
    '51982886484',
    'davixramires19@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1236102998,
    'Wendel guimaraes da silva',
    '04208571098',
    '51998232686',
    'stumpfwendel@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1236581248,
    'Rodrigo Vinícius hub',
    '03908958067',
    '51998853368',
    'rodrigohub13@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1236696425,
    'Marcos Antonio Lopes de Moura Junior',
    '02643248384',
    '89999280929',
    'marcostradermoura@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1237107389,
    'Jhonatan Jesus Santos',
    '35073388828',
    '11953048263',
    'jhonatan11101@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1237339020,
    'Ithalo Pinheiro Neposeano',
    '07402912388',
    '88992836627',
    'ithaloneposeano@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1237515783,
    'GLEYSON QUINTINO BRAZAO',
    '95999264200',
    '92984284857',
    'brazaopk@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1237748572,
    'Guilherme Santos',
    '66783208834',
    '11963169426',
    'gviniciushue@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1237936712,
    'Marcos Vinicius Quadros',
    '45631354888',
    '17991885485',
    'mvquadros24@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1238180477,
    'Víctor Gomes Vieira',
    '05914374146',
    '62999326929',
    'victorgomess1482@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1238550012,
    'Mateus Rocha Pereira',
    '60717110370',
    '98987162706',
    'mateustraderwin@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1239010391,
    'Gustavo Ramos Batista',
    '03217325028',
    '51993595374',
    'Gustavoramosgtv@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1239064569,
    'Jhonnata Silva Almeida',
    '40511659814',
    '11959889451',
    'Jhonnatasilva10@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1240079223,
    'João Pedro da Silva',
    '71215288433',
    '83988720999',
    'joaop5705@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1240159352,
    'Pedro Henrique Santos da Silva',
    '52361410877',
    '11970851943',
    'Pedrodevram@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1240409963,
    'Bruno Câmara dos santos',
    '06376124348',
    '98985262130',
    'camarabruno724@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1241142652,
    'Yan Neves Deslandes',
    '13029585697',
    '32991673564',
    'yandeslandes761@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1241207594,
    'Victor hugo farias de souza',
    '17653498779',
    '22988065523',
    'Victorskullblack@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1241243036,
    'Douglas Manuel Pereira',
    '03852871000',
    '51991100099',
    'dp3269605@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1241651314,
    'Venicios Saraiva de Moura',
    '05433733122',
    '63984284643',
    'Viniciosmoura1996@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1241675769,
    'Junior da silva Martins',
    '01689490241',
    '96991019711',
    'jc.junior050512@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1242058728,
    'Thiago Menezes de Souza',
    '85461644287',
    '11963478777',
    'Thiago.THMS@outlook.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1242060651,
    'Francinaldo da silva cruz',
    '01558839259',
    '11952026018',
    'francinaldosilvaatm@outlook.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1242256964,
    'Levi Benjamin Gael Fogaça',
    '54904892194',
    '61995860908',
    'dvmuonlinedv@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1242263897,
    'Inacio belmino neto',
    '03760106145',
    '62993314546',
    'inacionetoaracu@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1242644542,
    'Jackson willian da Conceição Pereira',
    '06602263161',
    '67984791088',
    'Jacksonw128@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1242742096,
    'Carlos Henrique Silva Junior',
    '18504587746',
    '24992758694',
    'carloshenriquetranderoutlook@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1242895866,
    'Marcos Guilherme',
    '05747169556',
    '79991737093',
    'marcos.78@icloud.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1242923348,
    'Lucas Theodoro',
    '16423762724',
    '24993312436',
    'Lucastheodoro10@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1243140684,
    'Rafael Pacheco anelli',
    '38552979837',
    '18991655920',
    'anelli.pacheco.anelli@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1243186055,
    'Clelton Freitas',
    '58859683220',
    '92994418466',
    'clelton.acariquara@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1243558539,
    'Veronica coelho lombardo da silva',
    '37055060800',
    '16993260466',
    've_a_mais@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1243624469,
    'Lenita Silva pereira',
    '75802856220',
    '92993849839',
    'Caioviniciuss121212@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1243946933,
    'Anderson Leonardo Pereira',
    '11771181737',
    '24993285542',
    'anderson.leonardoperreira@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1244307409,
    'Luis Gustavo Dalvesco de Lima',
    '04971215069',
    '51991944814',
    'Guguvavo96@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1244875641,
    'Wallace Lúcio da Silva Souza',
    '14665347611',
    '32998230280',
    'lilianiramos04@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1244938553,
    'Jeferson cruz de oliveira',
    '05555896506',
    '75998004665',
    'Jeucruzsz@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1244982412,
    'Rodrigo Basto silva',
    '15267834521',
    '02199516647',
    'Kikito_dak-lifa@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1245038256,
    '/start',
    '69598320120',
    '61991556432',
    'Brendoamorim000@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1245246674,
    'THIAGO FernandesTeixeira',
    '12028174757',
    '21985573313',
    'thiagoteixeirablog@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1245703904,
    'Maicon Gomes de Carvalho',
    '13267229642',
    '37998121560',
    'milenacamargos2312@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1245983275,
    'Anderson Pessanha Lopes',
    '12592015701',
    '21976942967',
    'andersonpessanha2@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1247726849,
    'Pedro Gabriel Marques da Silva',
    '13431522408',
    '82996944218',
    'Gmarquz98@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1247774137,
    'Yago pereira torres',
    '12924456614',
    '31995490626',
    'vitchenzoz@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1247823632,
    'José Carlos de Almeida',
    '10946647402',
    '12991937707',
    'Jc490175@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1248013933,
    'Maria Tereza Grazziotti Dalcamin Haubrichs',
    '05857890705',
    '27999257959',
    'mtgrazziotti@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1249281784,
    'José Antonio guerra',
    '46447666822',
    '11974150435',
    'Joseantonioguerra088@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1249416268,
    'Thawan Lovatto de Almeida',
    '09407463958',
    '46991186532',
    'thawanlovatto@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1249678945,
    'Diego Bruno Bernardes',
    '41415501831',
    '11948774908',
    'dbrunobernardes@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1250170363,
    'Lui fernandes alves',
    '06185556332',
    '88997391282',
    'luifernandes.facul@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1250665855,
    'Davidson Rafael Dias Alves',
    '10536471665',
    '47996063753',
    'davidsonsidi@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1250697354,
    'Haroldo Neto',
    '01873411251',
    '91982284141',
    'haroldotn@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1252562018,
    'Juvenil Soares de queiroz',
    '67049052604',
    '34996785321',
    'Mwrdavid23@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1252625305,
    'Jociclei da Silva santos',
    '51334490031',
    '82988675987',
    'ronaldogato2016@outlook.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1252627723,
    'Keuston Gonçalves',
    '15342765641',
    '33988400238',
    'keustonmart@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1253103445,
    'Ana Luiza da Silva Alves',
    '14012287630',
    '34988246648',
    'alvesanaluiza344@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1253323124,
    'Matteo Usmari',
    '51231593806',
    '11941899725',
    'matteo.usmari090840@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1253678635,
    'Thayza campo porto',
    '14452792740',
    '21991044853',
    'Campothayza@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1253818396,
    'Davi Figueredo de Santana',
    '15031951478',
    '11969337427',
    'davi159.13@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1253984921,
    'João Vitor Silva',
    '11804060607',
    '31992643382',
    'joaovit.or@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1254501359,
    'Wellington Cassimiro augusto filho',
    '10991858743',
    '21983949591',
    'tomcassimiro@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1254655040,
    'João Batista borges',
    '99502771753',
    '27998411226',
    'Pedroborges_lulu@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1254793199,
    'Paulo Priori',
    '43240250888',
    '14997202123',
    'priori.mktd@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1255121525,
    'Michael Bittencourt Junior',
    '11111024901',
    '42998342620',
    'michaelbittencourtjunior@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1255365727,
    'paulo e seabra',
    '07786636986',
    '49984174766',
    'semcomentarios15@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1256240154,
    'João Heitor de Lima Domingues',
    '03714787070',
    '54996307129',
    'Joaoheitor1812@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1256435953,
    'Felipe Eduardo de Oliveira',
    '09608342902',
    '41987798275',
    'eduardo.pratezi10@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1256556037,
    'Bruno',
    '03405823242',
    '92995279999',
    'brunonatanael2019@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1258299857,
    'Eduardo M. Calixto',
    '10653761708',
    '21990515910',
    'lucasmorastere@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1259703748,
    'Pedro Henrique Félix do Nascimento',
    '44767574803',
    '11969205599',
    'Phfelixn9@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1259827866,
    'Wesley Antonio sbordoni',
    '41299926860',
    '16988170730',
    'Wesleysbordoni288@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1260166103,
    'Filipe Heydt',
    '32631442946',
    '49999232919',
    'Filipeheydt631@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1260493733,
    'Vitor Mateus Dutra de Andrade',
    '48477006865',
    '17991706784',
    'vitorandrade.contato@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1260820867,
    'Fellipe Moura',
    '04745633246',
    '69992870745',
    'Fellipe.f.moura@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1261225860,
    'João Rafael Lima Pereira',
    '43089159880',
    '18996875499',
    'joaorafaelpereira808@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1261258467,
    'Jose eloisio Vicente Rodrigues',
    '60915877309',
    '85996663362',
    'joseeloisio2642@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1261754567,
    'Mateus tiago fronza',
    '09923042960',
    '47999999684',
    'Mateustkpk@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1261837206,
    'Luciano Franklin grigolli mendes',
    '48142736810',
    '11996683807',
    'Lucianogrigolli@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1261849483,
    'Arilson coelho',
    '86763652020',
    '51981726288',
    'arilson.sk@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1262201099,
    'Jackson Cassiano de Jesus',
    '09643282910',
    '47991275029',
    'Jacksoncassiano1997@icloud.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1262556328,
    'Weslley Alexandre Barbosa',
    '09016967907',
    '41984929643',
    'weslleypsn@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1263041253,
    'Ana Paula Honorato',
    '44785156899',
    '19999638037',
    'anapaulah.essj@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1263179114,
    'Adelson ribeiro Gonçalves',
    '95096540600',
    '38998891882',
    'adelsonmimukmmj@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1263435080,
    'Sandro Salles',
    '44699659870',
    '14991209780',
    'salles071@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1263547429,
    'Allison jason batista da silva',
    '16932062771',
    '21976048124',
    'Dasilva.allisonjason@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1264002615,
    'Michael de Souza Carneiro',
    '40447806840',
    '16992135490',
    'tradermichael27@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1264125709,
    'Wagner canevari',
    '45671380820',
    '18997532862',
    'Wagner-c3d@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1264567348,
    'Thiago Pizzi Barbosa',
    '51134006888',
    '11970760126',
    'Thiago.pizzi.b@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1265109537,
    'Débora Rodrigues',
    '05751069137',
    '62992650636',
    'deby.rcruz96@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1265531832,
    'Emerson Douglas Soares',
    '01822995469',
    '84987211194',
    'eeemersonecaroldiass@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1265558581,
    'Pablo Henrique de Paula lelis',
    '10992589606',
    '31984864072',
    'pablohenriquelelis@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1265581127,
    'Weyckson cotrim lira',
    '70242047106',
    '62985570777',
    'Weyckson@liracotrim.com.br',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1265765592,
    'Weverton Ferreira de Lima Pereira',
    '11641306416',
    '83998630132',
    'wevertonferreira2011@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1266060387,
    'José Leandro Alves pires',
    '06578279245',
    '91996268858',
    'joseleandroalvespires005@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1266088725,
    'Washington Gabriel da Silva',
    '70917641108',
    '61995753702',
    'washingtonivanelma@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1266461655,
    'Jonathan petersen de Souza',
    '16260265727',
    '28988039618',
    'Petersen.oliveira@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1266638835,
    'Matheus Marques De Oliveira',
    '14470989606',
    '35988873032',
    'matheus.oliverra@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1267440872,
    'Fernando Henrique Luiz',
    '46225885870',
    '14991097594',
    'Fernandovision30@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1267589169,
    'Gabriel Mira Storti',
    '14666568670',
    '34993023003',
    'gabrielstorti11@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1267755409,
    'Roger Gomes Lopes',
    '02608957099',
    '51999982836',
    'roger_mickey@live.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1267908557,
    'Thais Sthefany Torres Silva',
    '12374977447',
    '87991629678',
    'Sthefanythais947@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1267915327,
    'Antônio Victor Rafael Nunes',
    '13313071473',
    '87999305606',
    'Tititorafael@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1268324827,
    'Naomy Matsuda',
    '47576966807',
    '11995652555',
    'Matsudanaomy16@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1268976223,
    'Lucas pessoa',
    '14102422692',
    '32984521707',
    'lucas_felipe3015@hotmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1269017888,
    'Rodrigo Feitosa França',
    '50131467808',
    '14997961863',
    'Rodrigo01200038@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1269392591,
    'Eduarda Hlatchuk de Andrade',
    '13883807907',
    '44999898751',
    'dudatb6821@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1269606976,
    'Paulo Henrique Alves da Silva',
    '11890426490',
    '83991717341',
    'sonpaulohenrique@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1269764967,
    'Samuel freire',
    '00818090189',
    '62995505747',
    'alvarengafcastro@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1271020129,
    'Nicollas Azevedo De Sousa',
    '07408874240',
    '92992950485',
    'nicollasazevedo96@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1271129750,
    'Luiz Carlos machado',
    '05930455996',
    '48996602957',
    'luizcarlosmachado1934@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1271278956,
    'Wallace vieira Figueiredo',
    '14605111743',
    '92994864150',
    'osirmaovieira@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1271385760,
    'Michel N Bernardes',
    '46994407896',
    '16991812675',
    'michelnatan243@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1271798015,
    'Matheus Faria Poscai',
    '44662352878',
    '11982854487',
    'matheussbmx99@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1272104041,
    'Saulo Anderson dos Santos',
    '11051214459',
    '87996149374',
    'sauloanderson.gus2019@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1272359559,
    'Flaviana Dias Alves',
    '10834683750',
    '24981282447',
    'kauanalves.08@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1272747019,
    'Ilamax Brito Santos',
    '45457726843',
    '11963890066',
    'maxrdv155@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1272788460,
    'Luan Carlos Santos de Sousa',
    '02203823283',
    '95999033406',
    'luanc312@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1273138550,
    'Rafael lima dos santos',
    '06816938194',
    '61995859830',
    'Rafaellmlk@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1274405698,
    'Gines aparecido lima Junior',
    '46268423801',
    '17996280644',
    'ginesjunior19@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1274763033,
    'Clayver Wesley Campos rodrigues',
    '46584265870',
    '11981704125',
    'cclayver_157@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1274910531,
    'João Gabriel da Silva',
    '41533243883',
    '11959537143',
    'jgabriel7iso@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1275005566,
    'Luiz Freitas',
    '16153930727',
    '21995562016',
    'luizinhofreitas3684@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1275442169,
    'Júlio César Pessanha Defaveri de Souza',
    '13831060703',
    '22988034766',
    'jcpessanha91@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1276151847,
    'Isaías bonfanti',
    '05276476918',
    '47992071202',
    'isaiasbonfanti66@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1276156544,
    'Telma Lúcia Pergentino da Silva',
    '45341290410',
    '82987583895',
    'srlokodroid@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1276346647,
    'Gustavo Oliveira Freitas',
    '14685143698',
    '35991740855',
    'gustavoitas28@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1276430614,
    'petrus henrique novaes caleffi',
    '17402879674',
    '31984280711',
    'petrusseabra@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1276691977,
    'Francisco Elves Freitas Castro',
    '04700056371',
    '85994363225',
    'elviscastro.ecc@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1277013124,
    'Victor julio',
    '02622125283',
    '69992113919',
    'victorpvh2008@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1277403691,
    'Hugo Lima de Freitas',
    '14214564782',
    '21983450467',
    'hugolima112@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1278581048,
    'Ahh de ahh naburi',
    '07975124621',
    '31988453212',
    'Aleluia@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1278791308,
    'Guilherme Pedro da Silva',
    '46414786861',
    '11984320736',
    'guilhermepedro.2085@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1279001309,
    'Luiz Carlos Trindade Da silva',
    '07651377559',
    '77988779747',
    'Luizct9798@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1279221438,
    'Zaime augusto saretta',
    '07264497682',
    '33987619556',
    'Zaimesaretta@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1279237268,
    'Alan Luz Toledo',
    '94420122234',
    '34999565264',
    'alantoledok11@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1279461869,
    'João Victor Morais Garcia',
    '07854217696',
    '37999132080',
    'M.garciamarinho28@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1279578369,
    'Joao Gabriel fernandes de amorim',
    '02301238644',
    '33987102620',
    'Jgamorim255@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1280325729,
    'Michael Douglas Pereira dos Santos',
    '02342382677',
    '62998085837',
    'michaldagama@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1280696363,
    'Matheus Ariel Maciel Hirt',
    '02892582270',
    '69984647668',
    'matheus.ariel@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1281406216,
    'Welberth Gomes da cruz',
    '12593399635',
    '31971152294',
    'welberthgomes4444@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1281408077,
    'Charles Eduardo Costa leal',
    '03595592204',
    '66996502685',
    'charlesblack66666@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1281830133,
    'William rodrigues',
    '01898645086',
    '54999973528',
    'williamartur23456@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1282035332,
    'Juliano Rodrigues leite',
    '02023109060',
    '51984120147',
    'rodriguesjuliano71@yahoo.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1282829643,
    'Anntony Carlos Martins Macedo',
    '04787741179',
    '65993288981',
    'anntonyacm@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1283452749,
    'Antônio André dos Santos pinho',
    '06766215380',
    '86995262412',
    'andretr077@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1283637902,
    'João Pedro Patto dos Santos',
    '06457903894',
    '12981060077',
    'jppatto02@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1284159527,
    'Thalysson Sousa',
    '02923766180',
    '77981526235',
    'thalyssson36666@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1285142891,
    'Micael Alves Dos Santos',
    '12724666712',
    '28999499957',
    'micaelalvesdossantos1902@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1285326427,
    'Daniel Ken Iti Matsumura',
    '43576396896',
    '15991556579',
    'Matsumuradaniel@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1285388168,
    'Leandro Wellerson',
    '14842584602',
    '32988403505',
    'malandrohue@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1285400309,
    'Renan Cardoso de assis',
    '07151873506',
    '71993590413',
    'Ferbechop@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1285507552,
    'Rodrigo Lopes',
    '46196638831',
    '12981401569',
    'Rodrigo.rugby2410@outlook.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1285525871,
    'Alex José Magalhães Silva',
    '08699589417',
    '81992791515',
    'engealexmagalhaes@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1285724913,
    'Bernardo Dias Pereira',
    '14346049770',
    '22998976638',
    'bernardpereirapereira@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1286063083,
    'Plínio Martins Tavares Junior',
    '05991735131',
    '61984129408',
    'pliniolks08@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1286131573,
    'Rômulo Marinho lima',
    '01101605251',
    '92991154280',
    'Limaromullo07@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1286767985,
    'Fernando Mello',
    '02254907069',
    '51995885794',
    'Fernando_15997@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1286777608,
    'LUCAS FERNANDES RODRIGUES',
    '03004606275',
    '91984882245',
    'lucasfunk113@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1287026954,
    'Autobelee Silva medeiros',
    '10034582622',
    '31973660154',
    'autobelee90@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1287034006,
    'Ericles Novais dos Santos',
    '02981310216',
    '96999652101',
    'ericlesnovais6@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1287067695,
    'Everton ventura da silva',
    '46668831850',
    '11964136605',
    'Everton.silva02@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1287092264,
    'Leandro Mocelim',
    '10364936959',
    '42991645081',
    'leandromocelim1998m@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1287197938,
    'Mayoma Costa Coutinho',
    '60880585366',
    '99984878188',
    'maylacosta803@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1287235007,
    'Diogo Rocha Bacelar',
    '00397543247',
    '95991481457',
    'diogo_bacelar22@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1287373892,
    'Raphael Miller Silva',
    '04389842188',
    '62984556339',
    'phmillertrader@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1287552768,
    'Bruno Cerqueira',
    '11554419662',
    '35998272100',
    'nao@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1287562314,
    'esteban rios velez',
    '24181508870',
    '92991105333',
    'riosvelezesteban@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1287712257,
    'Emerson Santos de Araújo',
    '71096675455',
    '81987559479',
    'emersontdb2017@outlook.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1287881835,
    'Adriel Bispo do Carmo Santiago da silva',
    '86650737526',
    '75992451537',
    'Adriellssantos69@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1288479260,
    'João Victor fonseca felicio',
    '15330548780',
    '22997474856',
    'Victtorfelicio@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1288583669,
    'ADEMAR AMARO Tavares',
    '22697084827',
    '11981944031',
    'ademaramarotavares29570@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1288614935,
    'Carlos Eduardo De Aguiar',
    '51300660813',
    '17996639879',
    'stwart.carlos2015@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1288908357,
    'Guilherme Augusto Ramos',
    '83491367743',
    '24992188655',
    'coleoneret@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1288938969,
    'Lucas Henrique da Silva lemos',
    '02723817130',
    '62994251355',
    'Lucassoparapagamentos@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1289478132,
    'Lucas Santos da Silva',
    '03124825152',
    '61992959789',
    'Lucastrande2020@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1289499387,
    'Gabriel Damazo Dos Santos',
    '46252737810',
    '11952870572',
    'biel.damazo@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1290012521,
    'Joab Araujo Dornelas',
    '44996205890',
    '11950555485',
    'joabaraujo82@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1290405633,
    'Juan Pereira',
    '96499745200',
    '94984241491',
    'Juan.pereira.2096@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1291218780,
    'Gustavo siqueira Tebet',
    '01061785122',
    '67999651200',
    'gstebet@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1291611914,
    'Kassio Jhafan da Silva Evangelista',
    '04032739277',
    '69993850719',
    'jhafan_pvh@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1292140973,
    'Douglas Ariel',
    '03495289267',
    '92984029952',
    'dsimoes760@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1293847186,
    'David Ricardo Prezzi',
    '08620383914',
    '47992878282',
    'Davidricardoprezzi@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1293862704,
    'Renato Santana Marvão de Souza',
    '17562102767',
    '21991234124',
    'renatosmstrading@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1293976170,
    'Maicon Espindola',
    '07736272948',
    '47996362458',
    'espindolamaicon@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1294961323,
    'Victor Hugo da Silva Ribeiro cunha',
    '05790677185',
    '63992966576',
    'Vitin.h9.to@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1296046327,
    'Leandro Antonio Breno Viana',
    '58466337903',
    '96991712671',
    'lleandroantoniobrenoviana@pmi.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1296318427,
    'Vitor Fernando Crispim Arfelli',
    '23816245897',
    '16999660103',
    'arfelliv@outlook.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1296494585,
    'Léo da Costa fumagalli',
    '04854502088',
    '55991317356',
    'leofumagalli31@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1297121967,
    'William Lima Pinto',
    '03981078071',
    '54991508570',
    'limawilliam055@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1297314290,
    'João Victor',
    '07722325394',
    '85985575641',
    'victorflorencio1998@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1298261419,
    'Fadel Alexandre Cassimiro da Silva',
    '47422306807',
    '15996827373',
    'fadellocao@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1298568988,
    'Carlos Eduardo Silveira sanfelice',
    '00682253006',
    '11934088409',
    'jonathan_ramos2018@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1298653062,
    'Andre Souza',
    '29203122940',
    '49994459942',
    'ccobaia2019@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1299309590,
    'Julio Cesar Alves Rodrigues',
    '36888390802',
    '75999143526',
    'julioventania87@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1299900173,
    'Nathan zavam da Silva',
    '49488628863',
    '17996058097',
    'nethzavam@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1300823994,
    'Pedro Henrique Silva Neves',
    '09017819677',
    '35991911802',
    'pedromanezinho@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1301241230,
    'gabrielbolicocorrea',
    '04570156088',
    '51985372987',
    'gabrielbolicocorrea@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1301311010,
    'Taison Freitas Miranda',
    '86041882585',
    '75998243912',
    'Taisonsantista10@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1301849950,
    'Marlon carvalho',
    '44816399895',
    '19998798263',
    'nikegamer69@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1302294016,
    'LUIZ alfredo de oliveira',
    '40310580803',
    '12991628755',
    'luiz.boby@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1302550274,
    'Leonardo Correia Pinto',
    '00419236260',
    '92984721340',
    'leo_dinardo@hotmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1302554705,
    'Victor Raphael Guimarães Dantas',
    '06386002350',
    '85988036303',
    'Victorraphaelbrtt@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1303735528,
    'Isabela Cristina sutil ventura',
    '09249386923',
    '47997757219',
    'Isabelacristina_sutil@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1303951268,
    'Jose alexandre castro',
    '26754980095',
    '61983024176',
    'chocolatwen.habbo@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1304777986,
    'Thierry de souza',
    '46554341803',
    '11940777838',
    'Thierry.thr16@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1304853267,
    'Darlan Cruz Andrade',
    '10461314940',
    '47996531556',
    'Fisk.dd@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1305670642,
    'Daniel Alves Tatagiba',
    '09247712670',
    '37988067067',
    'danielttgba@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1305705539,
    'Kermon Luciano Fernandes',
    '68837500106',
    '65984042163',
    'aline.kermon@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1306148134,
    'Matheus Rocha Vieira de Freitas',
    '15387994720',
    '21968496811',
    'pretonygga@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1306625132,
    'Paulo André Pereira Souza',
    '40731346807',
    '17996614628',
    'Paullo_perso@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1307140113,
    'Antony lemes Moraes',
    '05877543113',
    '62981212342',
    'antonygoiania02@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1307352296,
    'Victor Hugo Araújo Cristaldo',
    '13277754685',
    '34991423600',
    'vitinhocristaldo@live.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1307393984,
    'André Tamanini Reis',
    '16826291711',
    '27992855058',
    'andre.tamanini@hotmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1307404141,
    'João Pedro Rust de Oliveira Freitas',
    '16026113606',
    '33987652101',
    'joaopedrorust@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1307750010,
    'Jefferson da Costa Ferreira',
    '50344243800',
    '12991468856',
    'Jc061846@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1308060190,
    'Marcos Vinicius Martins da Silva',
    '10377995690',
    '22999769536',
    'Marcosingle@live.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1308909634,
    'Rubens Martins De Oliveira Silva',
    '02175156141',
    '66992297688',
    'Rubensmartins1995@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1309452307,
    'Rodrigo Faviero',
    '02385128195',
    '61982716030',
    'Rodrigoramidiasdigitais@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1310560656,
    'Eliabner Ferreira Caldeira',
    '51873776802',
    '18997604897',
    'Eli.abner1000@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1310998168,
    'André Luis Simões Torres',
    '47448325809',
    '11981023455',
    'Andre.lstorres@hotmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1311395117,
    'Christian Garcia',
    '10839126905',
    '48996489080',
    'christianavai@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1311440340,
    'Henrique Ruy Szarnik',
    '10512395918',
    '47988281400',
    'henrique1006@outlook.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1311594480,
    'Pablo Toldo Mendes',
    '01719760020',
    '48996724238',
    'pablo.toldo3@outlook.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1311623722,
    'Davi Martins Carvalho',
    '14497775623',
    '61994081063',
    'canuka59@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1311758054,
    'Cleiton Linden',
    '00852255098',
    '55999179032',
    'cleitonlinden@outlook.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1312410421,
    'Guilherme Guerreiro da Silva',
    '71466656158',
    '61999587521',
    'gui.guerreirosilva2018@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1313460970,
    'Ramiro',
    '21839213825',
    '11985755994',
    'ramirojuan_@hotmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1313564461,
    'Rafael Sontag Kaplum',
    '04626794971',
    '43999381000',
    'rafaelkaplum@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1314182619,
    'Franciele Thais de Sá',
    '11948444640',
    '32999191773',
    'francielethaisdesa0311@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1314640573,
    'Ana Beatriz Mota de oliveira',
    '51872652883',
    '12981448922',
    'anabeatriz.kelover@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1314933605,
    'Edith Ferreira',
    '45788324149',
    '61992103791',
    'edithjra@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1316024977,
    'Luiz Eduardo Silva Alencar',
    '45251364806',
    '11942392653',
    'luizalencartrader@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1316624014,
    'Uelisson Souza do Rozario',
    '08338089583',
    '75983276379',
    'uelisson_2013@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1316886817,
    'Patrick Gonçalves vieira',
    '03324179211',
    '92988548554',
    'vieira15@hotmail.com.br',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1317126532,
    'Rafael',
    '02891355164',
    '65992110153',
    'raffa.cba05@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1317171117,
    'Antonio Elivelton Sousa Garcia',
    '93688806204',
    '93991867586',
    'Sousa.elivelton@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1317341134,
    'João Vitor kozechen',
    '11851521992',
    '42998387896',
    'Joaokozechen@icloud.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1317473941,
    'RAINEY MELO',
    '01624693229',
    '92982167623',
    'rainey108.melo@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1317573287,
    'Natã Augusto Luiz da Silva',
    '13442951933',
    '44997732883',
    'natanpexe2@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1317686873,
    'Gustavo dos santos de almeida',
    '35914878802',
    '11931431704',
    'yfryzza@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1318088954,
    'António Charles da Cruz silva',
    '62958605329',
    '99992140307',
    'Antoniocharles253456@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1318439097,
    'Jean carlos pinto de lima',
    '06136693470',
    '67996506926',
    'joncomet26@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1320580095,
    'Yan Lucas Soares',
    '18678232765',
    '27996562673',
    'yanlucas23@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1320763419,
    'Michel andre  martins',
    '08938452999',
    '46999268473',
    'Michelandremmartins098@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1321060090,
    'Wyllyam Gabriel',
    '10797059962',
    '45984342342',
    'wyllyam.gabriel1@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1322085271,
    'Harley jhonson',
    '04622157179',
    '65981064500',
    'Harleydiaas3@icloud.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1322908890,
    'Jhonatan Mota meireles',
    '04060149144',
    '61991650983',
    'Jhonatanmm83@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1323294947,
    'Maria eduarda Costa do Nascimento',
    '07155339326',
    '85985950279',
    'Mariaeduarda8743@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1323634791,
    'José Maximiano Neto',
    '50503310808',
    '19994100957',
    'Maximianocf@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1323888030,
    'Gustavo dos Santos Roque',
    '40626953839',
    '16991120169',
    'gustavoroque04@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1324011286,
    'Guilherme Augusto Silva Carneiro',
    '09789867689',
    '11940551449',
    'guihermess97@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1326563902,
    'Antonio Henrique Degane Teodoro',
    '50172627842',
    '14981654752',
    'henriquedegane23@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1326792968,
    'danilo silva',
    '50146881877',
    '11958631819',
    'santista0904@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1327557307,
    'felipe de almeida da silva',
    '10931516927',
    '47997073990',
    'trabalhotradertop@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1328864506,
    'Douglas Gonçalves',
    '13727762063',
    '17990875556',
    'gabrielbolero00@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1329131586,
    'Hedrey Pablo santinho da Silva bezerra',
    '47605627882',
    '11953368241',
    'Hedreypereira@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1329270700,
    'Carlos Eduardo Lima de Sousa',
    '63064637398',
    '85989104982',
    'c.eduardo.lima1245@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1330113995,
    'RO sant',
    '14822017710',
    '21999999999',
    'R@r.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1330116167,
    'Henrique Antônio de Assis piris',
    '11504524985',
    '41997638046',
    'assispirish@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1330351089,
    'Leonardo Rabone Celli',
    '07909759983',
    '41992906020',
    'leo.rabone501@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1330496022,
    'Ácza havilá da silva maia',
    '05990951213',
    '95991369192',
    'Aczahavila@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1330543008,
    'Nathália Sousa Viana',
    '17434110732',
    '21970366841',
    'sousavianansv@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1332390234,
    'jhonathan costa de souza',
    '02464425222',
    '67984076851',
    'jhonathan_jcs@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1333556014,
    'Gabriel Crepaldi Macedo',
    '13552713638',
    '37984058051',
    'crepgg12@gmail.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1334204937,
    'Jhones rodrigues dos santos',
    '07907970970',
    '41999117327',
    'Sjhones233@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1335100616,
    'Gabriel Leonardo Cardoso Tolardo',
    '01007545976',
    '43991259122',
    'gabriel_tolardo99@hotmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1335474264,
    'Vitor Lopes de Lima',
    '02056815060',
    '55992014165',
    'vitorlima1972@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1335564446,
    'fernando pereira leal minucelli',
    '43493995857',
    '19988215485',
    'fernandoant109@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1335767276,
    'Gabriel hutter',
    '10768207940',
    '47999106896',
    'Gabrielhutter@icloud.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1335806344,
    'Darlan Silva santos',
    '05423185556',
    '77988656797',
    'darlanss.online@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1335945413,
    'Nicolas Olivier de Sousa Coutinho',
    '70167105132',
    '19994986631',
    'nicolas.2015.jesus@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1337095017,
    'Luan Muller Luiz',
    '06614627902',
    '41998777881',
    'luan.analise@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1338192693,
    'kaue capitan casassola',
    '48559446885',
    '11985445064',
    'kaue.capitan@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1338910220,
    'Breno da costa beltramini',
    '15495483790',
    '21968839560',
    'Brenodacostabeltramini@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1339042556,
    'TEMES MARCOS DA SILVA JUNIOR',
    '85951916542',
    '73981324453',
    'estoucansadodoyoubug@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1339382969,
    'Willian Rodrigues Machado',
    '03167069066',
    '53984148600',
    'Willianrmcompras@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1339916662,
    'Matheus Martins Motta',
    '52922976823',
    '12997896582',
    'mariamarlenemartins18@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1341598685,
    'Jonathan Rodriguez',
    '91051528950',
    '41992599353',
    'jjntrodriguez@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1341641384,
    'Pedro Henrique de Oliveira druzian',
    '04637197198',
    '62999953620',
    'Pedrodruzian9805@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1341705887,
    'Leonardo Zonzini Lattanzio',
    '08073536633',
    '43998456562',
    'L.lattanzio17@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1341780345,
    'Deia Fernanda vorpagel waszkiewicz',
    '03336669090',
    '55997053532',
    'deiawaszkiewicz16@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1342086843,
    'Thiago Delgado',
    '12424818770',
    '21983624124',
    'thiagotdf762@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1342452466,
    'Khristofer Andres de Oliveira',
    '41242272801',
    '13991754487',
    'khristofero@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1343009196,
    'Guilherme Barcellos',
    '03006933036',
    '51995650495',
    'e.silveira10@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1343767570,
    'Leonardo de Alcântara nascimento',
    '42166472869',
    '18996758784',
    'Leonardo_alcantara2018@hotmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1344134195,
    'Gabriel Junior Ferreira',
    '10175703965',
    '46988173324',
    'gabriel.jf252@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1344405912,
    'Welison Henrique Costa',
    '02141455146',
    '65993132113',
    'Welisonhackiscoviack@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1345329845,
    'Rômulo Morais Rezende',
    '13287845683',
    '37998200063',
    'romulomorais52@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1346484171,
    'João Paulo amuy Araújo',
    '13945907683',
    '67996641866',
    'amuyinss@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1346861384,
    'Thiago  Fabrício  Alves  dos Santos',
    '03637353130',
    '66996530737',
    'Thiaguinhosantos192@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1347058099,
    'Rafael Bicudo da Rocha',
    '03140256183',
    '64996164422',
    'rafaelrr215@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1348113085,
    'Gabriel aparecido Ramalho Ventura',
    '44957984808',
    '11989146689',
    'Gabrielventura091097@icloud.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1348870329,
    'Felipi lima da Silva',
    '42688065807',
    '11956921352',
    'felipi.100.lima@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1348970766,
    'Leonardo Bernal',
    '08399494992',
    '11951691411',
    'Nxsgodofor@outlook.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1350362364,
    'Daniel de oliveira vital',
    '07524418337',
    '88999785695',
    'snwza1@gmail.com',
    '2020-08-20',
    17
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1350738136,
    'Dennis willian almeida mariano dos santos',
    '04851003986',
    '43984777997',
    'Denniswams@Outlook.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1350985777,
    'Kleber Henrique s',
    '58684164490',
    '31975820432',
    'Johnnyjogosclas@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1351415965,
    'Renan Coutinho',
    '10928488780',
    '21998858291',
    'renancoutinho_123@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1351691922,
    'Ederson Bruno do nascimento marques',
    '04630877045',
    '51997198694',
    'edersonbruno2009@hotmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1351769066,
    'William Borges',
    '00460119001',
    '51981101141',
    'Papaburguer17@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1352256332,
    'José Eduardo Assalin Almeida Silva',
    '13365802673',
    '35991699045',
    'eduardomexmsn15@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1352587342,
    'Tiago Campos dos Santos',
    '36739717869',
    '15988316000',
    'tiago.ttransportes@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1352653779,
    'Daniel leme dos Santos',
    '44974776819',
    '11990113464',
    'danielsmithlv9@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1352730039,
    'José Lino Silva Macedo',
    '14729786688',
    '31984104050',
    'joselinomacedo18@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1353094690,
    'Diego Ribeiro de Almeida',
    '40277554802',
    '19999908370',
    'Diego.almeida_rh@hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1353159421,
    'Esiquiel botera',
    '09355062923',
    '47996084792',
    'esiquiel93@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1353336520,
    'Gustavo Ciciliano Fazzano Pousa',
    '51290873801',
    '11989699620',
    'gustavoinvestimentosbinarios@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1356224003,
    'Vitor Hugo santos neto',
    '70334468108',
    '21992904029',
    'Victor_neto@live.com.pt',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1356705001,
    'Victor Matheus Pereira da Silva',
    '07415148509',
    '75992905565',
    'vitormatheus358@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1358618098,
    'Wellington Diniz Mariano',
    '43650088894',
    '11965635314',
    'Wellingtondiniz2016@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1358641634,
    'Luis Guilherme Pitzer Magalhães Barbosa',
    '14426499763',
    '21988896159',
    'luispitzer@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1359084893,
    'Rickson Patrick lima de Oliveira',
    '51360513884',
    '19995689263',
    'Rickson.patrick13@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1359311528,
    'Sanniil Lucas Pontile Matias da Silva',
    '03056039223',
    '93991393573',
    'lucaspontile@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1359499204,
    'Silvio Gomes',
    '07328466502',
    '75991311779',
    'Silvioakva12@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1359893966,
    'Michel Tenório Dall Alba',
    '01194693245',
    '94991740173',
    'michel.dallalba@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1360256874,
    'Fernanda de Souza',
    '07531233630',
    '35997162377',
    'guiguiportoporto@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1360368621,
    'Fagner Macedo de jesus',
    '08001055590',
    '71996304782',
    'Fabricioyudy@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1360913800,
    'Marco Gabriel Borges Todescatto',
    '11526944995',
    '41996100250',
    'Marcotodescattoop@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1361769422,
    'Vinicios Xavier de Jesus',
    '70000436100',
    '62993655046',
    'vinicios18xavier@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1362082244,
    'Jonatas Rafael Bauer',
    '07627943990',
    '47999552475',
    'Jonatasbauer1212@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1362174966,
    'Malone Reis da Silva',
    '02909964060',
    '51992037815',
    'Malonyreis@bol.com.br',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1362296313,
    'Everson Josoe Correia',
    '07900862986',
    '41988355319',
    'eversoncorreia20@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1363794754,
    'Guilherme arantes',
    '04426352223',
    '69992579743',
    'Guilherme29121999@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1364192182,
    'Gabriel a. Leite de o.',
    '06379345124',
    '94992264788',
    'Gabrieloliveiraddtank@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1364954225,
    'Jefferson Tayson Silva',
    '87969615031',
    '13988653836',
    'arthursantossoliveira@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1365834064,
    'Paulo Ricardo Andrade',
    '37922313870',
    '14999041666',
    'Paulinho_spg@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1365978822,
    'Érica aparecida Morais leal',
    '04757689063',
    '55992253366',
    'moraiserica179@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1366460928,
    'Daniel Morais',
    '16173270773',
    '45999444049',
    'danielmoraisxp@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1366992793,
    'Jonathan Santos da Silva',
    '18314160776',
    '24992188275',
    'jonsantosvr@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1367592741,
    'Lucas Francisco do nascimento de sousa',
    '07750107150',
    '61992577455',
    'lucas993547045@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1367678097,
    'Guilherme Judas Silviano',
    '61262698022',
    '11963020439',
    'brunnooption@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1367786969,
    'Ruan Carlos Rodrigues da Silva',
    '01416329250',
    '91980968623',
    'ruan.carlos.rs59@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1367922206,
    'Robson Regis Lenhart',
    '07961470948',
    '46991330588',
    'Robsonregislenhart007@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1368069491,
    'Dyogo Henrique de Andrade',
    '09165393937',
    '41995169052',
    'Contatostudio.dh@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1368313370,
    'Gabriel de Jesus',
    '06845993173',
    '67998244751',
    'gabrielsantosbdq@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1368834483,
    'Patrick Adan CARVALHO Nogueira',
    '07197603137',
    '66992078412',
    'patrickdead66@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1369446221,
    'Deivison Rocha Delgado',
    '05895070108',
    '67981936231',
    'rdelgadodeivison@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1371806073,
    'Gabriel Martins Alves',
    '49777124805',
    '19993265198',
    'Gabrielpalmerense2011@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1373054740,
    'Vinicius rodrigues albuquerque',
    '13693696462',
    '82999994598',
    'Zolordbr@outlook.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1373086924,
    'Paulo Victor de Souza Campos',
    '05130717503',
    '77981344978',
    'psvictorcampos@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1373473407,
    'Maicon santos',
    '19677549189',
    '67993408088',
    'Maiconpereirasanttos@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1374258685,
    'Thiago Marcelo de Oliveira',
    '54177831883',
    '13988731994',
    'Jfbjhviny678@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1375107309,
    'Samuel Eber Medrado Paiva',
    '07906992571',
    '79999011227',
    'samuel_paiva10@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1375302952,
    'Rafael Campos Miranda Vilhena',
    '16065098701',
    '21991359625',
    'rafaelrcm0@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1375331318,
    'Márcia Silva Alves',
    '07315807888',
    '11988779544',
    'marcia.alves@chromapar.com.br',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1376161716,
    'Lucas maciel alionço',
    '09782668974',
    '41998969925',
    'lucasmaciel97@outlook.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1376434467,
    'Bruno Cesar Rocha Oliveira',
    '03663704130',
    '61993321128',
    'brunooliveira.contador@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1376770640,
    'João Victor Jesus dos Santos',
    '07570964500',
    '73998137026',
    'jonnyelcucaracha@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1378474828,
    'Fabiano Tavares do Amaral',
    '04236632080',
    '51995824429',
    'fabianoamaral31@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1378778396,
    'Jamisdean Sales dos santos',
    '02313051250',
    '92995196782',
    'Jamisdean10@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1379075552,
    'Tiago nadalet',
    '37964853830',
    '14997228512',
    'Tiago_nadalet@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1379695898,
    'ADALBERTO PEREIRA CHAVES',
    '79835295468',
    '73991962230',
    'Adalbertop@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1379890467,
    'Vinicius da silva dutra',
    '11650973705',
    '21993447106',
    'Viniciusdutra1308@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1380099010,
    'Cristiane ferreira s de moura',
    '10076586812',
    '47997091083',
    'agx.empreendimentos@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1380290118,
    'Ronald Xavier Silva',
    '16877957709',
    '21986754291',
    'xavierronald164@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1380487762,
    'João Vitor Pimentel Furst',
    '47578588842',
    '12988521792',
    'jvfurst1605@gmail.com',
    '2020-08-28',
    25
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1380511713,
    'THIAGO da Silva Pereira',
    '94542473287',
    '91984298702',
    'tpereiratrader@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1381112511,
    'Lucas Vitor Nascimento Barbosa',
    '16129132611',
    '31997043556',
    'Lucas_Vitor155@hotmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1381266505,
    'Fernando Augusto Ruiz Bertoli',
    '46305400830',
    '43996046407',
    'fernandobertoli88@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1381472095,
    'Lauan Henrique Soares Rodrigues',
    '35745221852',
    '11953989642',
    'lauan.henrique.rodrigues@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1382164777,
    'Otávio Lanzeti Rosa',
    '38768043880',
    '14997500231',
    'otaviolanzeti@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1382352133,
    'Luís Paulo Izidoro',
    '34148871856',
    '14996817801',
    'luisvania10@gmail.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1383248372,
    'Daniel Rodrigues da Silva',
    '08485709950',
    '41999216002',
    'dr99810@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1383258876,
    'Alexandre Junior Nunes Bispo',
    '70805729160',
    '62985796608',
    'alexandrepick12000@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1383475756,
    'Dyorges Maciel Mello',
    '04397478058',
    '54996864704',
    'Dyorges_maciel@hotmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1383504476,
    'Guilherme Barcelos',
    '86413331500',
    '71987842737',
    'guilhermeb43@outlook.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1384281042,
    'Aron Rouberth Souza e Silva',
    '15149053619',
    '12991757544',
    'aronrouberth800@gmail.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1384391284,
    'Hillary da motta Silva',
    '06226424729',
    '22997016334',
    'Hillary.motta18@Hotmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1384553344,
    'Esller Gomes',
    '34889537856',
    '17981770695',
    'esllergomes@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1385217551,
    'Vitor Hugo Nascimento',
    '12757612913',
    '44998047900',
    'vitortrader1774@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1385383050,
    'Cleiton Alves Feitosa',
    '07671368458',
    '31996581801',
    'Leonardosilva065@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1385481746,
    'JANIEL Souza de Oliveira',
    '03932936299',
    '94991066199',
    'js8603791@gmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1385968527,
    'Jessica Lainy Lopes',
    '14089659680',
    '37999658319',
    'Jessicaofc45@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1386537795,
    'Maicon Cardoso',
    '07978222918',
    '47988085937',
    'Maiconmanu91@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1387027109,
    'Michael Douglas Santos da Silva rosa',
    '75338939134',
    '62999651520',
    'michaeldssr@hotmail.com',
    '2020-09-02',
    30
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1388248996,
    'Andreza Viviane Silva Siqueira',
    '21973748851',
    '12988753304',
    'gs800408@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1388566530,
    'Jonas Donizete isidorio',
    '51407716832',
    '19981687578',
    'jonasdonizete007@gmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1388679537,
    'Marcos Ribeiro',
    '73134813904',
    '19994321751',
    'mrs_vinicius97@hotmail.com',
    '2020-08-25',
    22
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1389461737,
    'Gabriel de jesus stobienia',
    '86673653000',
    '51995281638',
    'Jesusgabriel0702@gmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1390320158,
    'Ailton Alves da Rocha',
    '41854473883',
    '19997695595',
    'ailtonrocha95@outlook.com',
    '2020-08-19',
    16
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1391559284,
    'Jaiézio da silva dos santos',
    '06398427122',
    '89999907074',
    'Silvajaiezio@gmail.com',
    '2020-08-31',
    28
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1391637091,
    'Fabricio Dos Santos Oliveira Paiva',
    '13229483480',
    '83991579597',
    'fabricioboymengo@gmail.com',
    '2020-08-18',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1391714909,
    'Jeferson casanova',
    '01086800028',
    '48991354330',
    'jefersoncasanova25@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1392516437,
    'Bruno Coutinho Cardoso dos Santos',
    '86047131581',
    '51997871149',
    'Brunocoutinhox@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1392864352,
    'Giovana Adrieli Ribeiro',
    '05480207105',
    '65999799006',
    'adrieliribeiro832@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1393139239,
    'Evair Lourenço Rodrigues',
    '04573190112',
    '67999171376',
    'evairlol10@gmail.com',
    '2020-09-01',
    29
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1393539668,
    'THIAGO PESSOA MIRANDA',
    '11128935716',
    '27998328878',
    'thiago23072015@gmail.com',
    '2020-08-27',
    24
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1393871045,
    'Wagner Murilo dos santos carvalho',
    '14502555908',
    '47999374597',
    'wagnermurilo2010@gmail.com',
    '2020-08-26',
    23
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1396771220,
    'Agnaldo de Oliveira Santos Júnior',
    '75403234187',
    '62991105629',
    'Agnaldojr.go@outlook.com',
    '2020-08-18',
    15
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1396901673,
    'Alisson da Silva barbosa',
    '45326497816',
    '11951273088',
    'Silvaalisson322@yahoo.com',
    '2020-08-22',
    19
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1397389669,
    'Felipe',
    '14810419754',
    '21993726639',
    'Feliperossman4@gmail.com',
    '2020-08-21',
    18
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1398069740,
    'Elizabete do Carmo Lemes Colombelli',
    '64214745949',
    '49999556428',
    'Beti_colombeli@hotmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1398211139,
    'Jeferson Rodrigues Da Rosa',
    '03328890092',
    '54991661885',
    'Jefersonrodriguest9@gmail.com',
    '2020-08-17',
    14
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1398600676,
    'Igor dhallison santos pires',
    '53061003843',
    '19989255952',
    'Igordhallison2001@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1399048038,
    'João Pedro Quintanilha Britto Dias',
    '16674606766',
    '21997275911',
    'apaquintanilha01@hotmail.com',
    '2020-08-24',
    21
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1399387710,
    'Bruno Gabriel Henrique Da Silva',
    '12497422427',
    '87999166656',
    'Bh301477@gmail.com',
    '2020-08-23',
    20
  );
INSERT INTO
  `UsuarioGratuito` (
    `id`,
    `nome_completo`,
    `cpf`,
    `telefone`,
    `email`,
    `data_de_assinatura`,
    `dias_de_uso`
  )
VALUES
  (
    1399906730,
    'Dayane zanoni de souza',
    '43331357880',
    '15996782497',
    'Dayane_zanoni@outlook.com',
    '2020-08-21',
    18
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
