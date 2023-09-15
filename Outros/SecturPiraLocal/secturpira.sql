/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     24/05/2023 10:34:27                          */
/*==============================================================*/


drop table if exists acessibilidade;

drop table if exists acesso;

drop table if exists artesanato;

drop table if exists artesanatolocal;

drop table if exists categoria;

drop table if exists formapagto;

drop table if exists formasrecreacao;

drop table if exists formassinalizacao;

drop table if exists funcionamento;

drop table if exists gastronomia;

drop table if exists horario;

drop table if exists idioma;

drop table if exists idiomaslocal;

drop table if exists local;

drop table if exists meioacessibilidade;

drop table if exists meioacesso;

drop table if exists natureza;

drop table if exists pagamento;

drop table if exists periodo;

drop table if exists recreacao;

drop table if exists sinalizacao;

drop table if exists subcategoria;

drop table if exists usuario;

/*==============================================================*/
/* Table: acessibilidade                                        */
/*==============================================================*/
create table acessibilidade
(
   localid              int,
   acessibilidadeid     int
);

/*==============================================================*/
/* Table: acesso                                                */
/*==============================================================*/
create table acesso
(
   localid              int,
   meioacessoid         int
);

/*==============================================================*/
/* Table: artesanato                                            */
/*==============================================================*/
create table artesanato
(
   artesanatoid         int not null auto_increment,
   artesanatonome       varchar(50),
   artesanatodescricao  varchar(150),
   primary key (artesanatoid)
);

/*==============================================================*/
/* Table: artesanatolocal                                       */
/*==============================================================*/
create table artesanatolocal
(
   artesanatoid         int,
   localid              int
);

/*==============================================================*/
/* Table: categoria                                             */
/*==============================================================*/
create table categoria
(
   categoriaid          int not null auto_increment,
   categoriaseq         int,
   categoriamenu        int,
   categorianome        varchar(30),
   categoriadescricao   varchar(150),
   primary key (categoriaid)
);

/*==============================================================*/
/* Table: formapagto                                            */
/*==============================================================*/
create table formapagto
(
   formapagtoid         int not null auto_increment,
   formapagtonome       varchar(30),
   primary key (formapagtoid)
);

/*==============================================================*/
/* Table: formasrecreacao                                       */
/*==============================================================*/
create table formasrecreacao
(
   recreacaoid          int not null auto_increment,
   recreacaonome        varchar(30),
   primary key (recreacaoid)
);

/*==============================================================*/
/* Table: formassinalizacao                                     */
/*==============================================================*/
create table formassinalizacao
(
   sinalizacaoid        int not null auto_increment,
   sinalizacaonome      varchar(30),
   primary key (sinalizacaoid)
);

/*==============================================================*/
/* Table: funcionamento                                         */
/*==============================================================*/
create table funcionamento
(
   localid              int,
   horarioid            int
);

/*==============================================================*/
/* Table: gastronomia                                           */
/*==============================================================*/
create table gastronomia
(
   gastronomiaid        int not null auto_increment,
   gastronomianome      varchar(50),
   gastronomiadescricao varchar(150),
   primary key (gastronomiaid)
);

/*==============================================================*/
/* Table: horario                                               */
/*==============================================================*/
create table horario
(
   horarioid            int not null auto_increment,
   horariodiasemana     int,
   primary key (horarioid)
);

/*==============================================================*/
/* Table: idioma                                                */
/*==============================================================*/
create table idioma
(
   idiomaid             int not null auto_increment,
   idiomanome           varchar(30),
   primary key (idiomaid)
);

/*==============================================================*/
/* Table: idiomaslocal                                          */
/*==============================================================*/
create table idiomaslocal
(
   idiomaid             int,
   localid              int
);

/*==============================================================*/
/* Table: local                                                 */
/*==============================================================*/
create table local
(
   localid              int not null auto_increment,
   usuarioid            int,
   categoriaid          int,
   naturezaid           int,
   localstatus          varchar(1),
   localnome            varchar(50),
   localdescricao       varchar(500),
   localenderecodescricao varchar(300),
   localrua             varchar(50),
   localnumero          varchar(10),
   localbairro          varchar(50),
   localcidade          varchar(50),
   localestado          varchar(2),
   localcep             varchar(11),
   localcomplemento     varchar(150),
   localtelefone        varchar(15),
   locallatitude        varchar(30),
   locallongitude       varchar(30),
   localposicaogoogle   varchar(50),
   localfoto1           varchar(100),
   localfoto2           varchar(100),
   localfoto3           varchar(100),
   localfoto4           varchar(100),
   localfoto5           varchar(100),
   localwebsite         varchar(50),
   localemail           varchar(50),
   localcelular         varchar(15),
   localcelularwhatsapp varchar(1),
   localfacebook        varchar(50),
   localinstagram       varchar(50),
   primary key (localid)
);

/*==============================================================*/
/* Table: meioacessibilidade                                    */
/*==============================================================*/
create table meioacessibilidade
(
   acessibilidadeid     int not null auto_increment,
   acessibilidadenome   varchar(50),
   primary key (acessibilidadeid)
);

/*==============================================================*/
/* Table: meioacesso                                            */
/*==============================================================*/
create table meioacesso
(
   meioacessoid         int not null auto_increment,
   meioacessonome       varchar(30),
   primary key (meioacessoid)
);

/*==============================================================*/
/* Table: natureza                                              */
/*==============================================================*/
create table natureza
(
   naturezaid           int not null auto_increment,
   naturezanome         varchar(50),
   primary key (naturezaid)
);

/*==============================================================*/
/* Table: pagamento                                             */
/*==============================================================*/
create table pagamento
(
   localid              int,
   formapagtoid         int
);

/*==============================================================*/
/* Table: periodo                                               */
/*==============================================================*/
create table periodo
(
   periodoid            int not null auto_increment,
   horarioid            int,
   periodoinicio        date,
   periodofinal         date,
   primary key (periodoid)
);

/*==============================================================*/
/* Table: recreacao                                             */
/*==============================================================*/
create table recreacao
(
   localid              int,
   recreacaoid          int
);

/*==============================================================*/
/* Table: sinalizacao                                           */
/*==============================================================*/
create table sinalizacao
(
   localid              int,
   sinalizacaoid        int
);

/*==============================================================*/
/* Table: subcategoria                                          */
/*==============================================================*/
create table subcategoria
(
   subcategoriaid       int not null auto_increment,
   categoriaid          int,
   subcategorianome     varchar(30),
   subcategoriadescricao varchar(150),
   primary key (subcategoriaid)
);

/*==============================================================*/
/* Table: usuario                                               */
/*==============================================================*/
create table usuario
(
   usuarioid            int not null auto_increment,
   usuarionome          varchar(30),
   usuarioemail         varchar(70),
   usuariosenha         varchar(200),
   usuariocnpj          varchar(20),
   usuariotipo          varchar(1),
   primary key (usuarioid)
);

alter table acessibilidade add constraint fk_reference_13 foreign key (localid)
      references local (localid) on delete restrict on update restrict;

alter table acessibilidade add constraint fk_reference_14 foreign key (acessibilidadeid)
      references meioacessibilidade (acessibilidadeid) on delete restrict on update restrict;

alter table acesso add constraint fk_reference_19 foreign key (localid)
      references local (localid) on delete restrict on update restrict;

alter table acesso add constraint fk_reference_20 foreign key (meioacessoid)
      references meioacesso (meioacessoid) on delete restrict on update restrict;

alter table artesanatolocal add constraint fk_reference_21 foreign key (artesanatoid)
      references artesanato (artesanatoid) on delete restrict on update restrict;

alter table artesanatolocal add constraint fk_reference_22 foreign key (localid)
      references local (localid) on delete restrict on update restrict;

alter table funcionamento add constraint fk_reference_5 foreign key (localid)
      references local (localid) on delete restrict on update restrict;

alter table funcionamento add constraint fk_reference_6 foreign key (horarioid)
      references horario (horarioid) on delete restrict on update restrict;

alter table idiomaslocal add constraint fk_reference_17 foreign key (idiomaid)
      references idioma (idiomaid) on delete restrict on update restrict;

alter table idiomaslocal add constraint fk_reference_18 foreign key (localid)
      references local (localid) on delete restrict on update restrict;

alter table local add constraint fk_reference_3 foreign key (usuarioid)
      references usuario (usuarioid) on delete restrict on update restrict;

alter table local add constraint fk_reference_7 foreign key (categoriaid)
      references categoria (categoriaid) on delete restrict on update restrict;

alter table local add constraint fk_reference_8 foreign key (naturezaid)
      references natureza (naturezaid) on delete restrict on update restrict;

alter table pagamento add constraint fk_reference_15 foreign key (localid)
      references local (localid) on delete restrict on update restrict;

alter table pagamento add constraint fk_reference_16 foreign key (formapagtoid)
      references formapagto (formapagtoid) on delete restrict on update restrict;

alter table periodo add constraint fk_reference_1 foreign key (horarioid)
      references horario (horarioid) on delete restrict on update restrict;

alter table recreacao add constraint fk_reference_11 foreign key (localid)
      references local (localid) on delete restrict on update restrict;

alter table recreacao add constraint fk_reference_12 foreign key (recreacaoid)
      references formasrecreacao (recreacaoid) on delete restrict on update restrict;

alter table sinalizacao add constraint fk_reference_10 foreign key (sinalizacaoid)
      references formassinalizacao (sinalizacaoid) on delete restrict on update restrict;

alter table sinalizacao add constraint fk_reference_9 foreign key (localid)
      references local (localid) on delete restrict on update restrict;

alter table subcategoria add constraint fk_reference_2 foreign key (categoriaid)
      references categoria (categoriaid) on delete restrict on update restrict;

