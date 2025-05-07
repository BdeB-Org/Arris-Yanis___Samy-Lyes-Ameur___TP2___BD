-- Généré par Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   à :        2025-05-06 01:20:14 EDT
--   site :      Oracle Database 12cR2
--   type :      Oracle Database 12cR2



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE article (
    id_article       NUMBER(10) NOT NULL,
    titre            VARCHAR2(200) NOT NULL,
    intro            VARCHAR2(500) NOT NULL,
    contenu          CLOB NOT NULL,
    image_url        VARCHAR2(255) NOT NULL,
    date_pub         DATE NOT NULL,
    categorie_id_cat NUMBER(10) NOT NULL
);

ALTER TABLE article ADD CONSTRAINT article_pk PRIMARY KEY ( id_article );

CREATE TABLE categorie (
    id_cat      NUMBER(10) NOT NULL,
    nom         VARCHAR2(50) NOT NULL,
    description VARCHAR2(255)
);

ALTER TABLE categorie ADD CONSTRAINT categorie_pk PRIMARY KEY ( id_cat );

CREATE TABLE commentaire (
    id_com              NUMBER(10) NOT NULL,
    texte               CLOB NOT NULL,
    date_com            DATE NOT NULL,
    article_id_article  NUMBER(10) NOT NULL,
    utilisateur_id_user NUMBER(10) NOT NULL
);

ALTER TABLE commentaire ADD CONSTRAINT commentaire_pk PRIMARY KEY ( id_com );

CREATE TABLE utilisateur (
    id_user       NUMBER(10) NOT NULL,
    nom           VARCHAR2(50) NOT NULL,
    prenom        VARCHAR2(50) NOT NULL,
    email         VARCHAR2(100) NOT NULL,
    mot_de_passe  VARCHAR2(100) NOT NULL,
    date_creation DATE NOT NULL
);

ALTER TABLE utilisateur ADD CONSTRAINT utilisateur_pk PRIMARY KEY ( id_user );

ALTER TABLE article
    ADD CONSTRAINT article_categorie_fk FOREIGN KEY ( categorie_id_cat )
        REFERENCES categorie ( id_cat );

ALTER TABLE commentaire
    ADD CONSTRAINT commentaire_article_fk FOREIGN KEY ( article_id_article )
        REFERENCES article ( id_article );

ALTER TABLE commentaire
    ADD CONSTRAINT commentaire_utilisateur_fk FOREIGN KEY ( utilisateur_id_user )
        REFERENCES utilisateur ( id_user );

CREATE SEQUENCE article_id_article_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER article_id_article_trg BEFORE
    INSERT ON article
    FOR EACH ROW
    WHEN ( new.id_article IS NULL )
BEGIN
    :new.id_article := article_id_article_seq.nextval;
END;
/

CREATE SEQUENCE commentaire_id_com_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER commentaire_id_com_trg BEFORE
    INSERT ON commentaire
    FOR EACH ROW
    WHEN ( new.id_com IS NULL )
BEGIN
    :new.id_com := commentaire_id_com_seq.nextval;
END;
/

CREATE SEQUENCE utilisateur_id_user_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER utilisateur_id_user_trg BEFORE
    INSERT ON utilisateur
    FOR EACH ROW
    WHEN ( new.id_user IS NULL )
BEGIN
    :new.id_user := utilisateur_id_user_seq.nextval;
END;
/



-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           3
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          3
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
