SET NAMES 'utf8';
DROP DATABASE IF EXISTS sepomex;
CREATE DATABASE IF NOT EXISTS sepomex DEFAULT CHARACTER SET 'utf8';
USE sepomex;

CREATE TABLE estados(
    id_ets              TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre              VARCHAR(45) NOT NULL UNIQUE,

    PRIMARY KEY(id_ets)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE municipios(
    id_mns              SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre              VARCHAR(45) NOT NULL UNIQUE,
    id_ets              TINYINT UNSIGNED NOT NULL,

    PRIMARY KEY(id_mns),
    FOREIGN KEY(id_ets) REFERENCES estados(id_ets)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE ciudades(
    id_cus              SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre              VARCHAR(45) NOT NULL UNIQUE,

    PRIMARY KEY(id_cus)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE tipos(
    id_tps              TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre              VARCHAR(45) NOT NULL UNIQUE,

    PRIMARY KEY(id_tps)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE asentamientos(
    cp                  VARCHAR(45) NOT NULL,
    nombre              VARCHAR(145) NOT NULL,
    id_tps              TINYINT UNSIGNED NOT NULL,
    id_mns              SMALLINT UNSIGNED NOT NULL,
    id_cus              SMALLINT UNSIGNED,

    PRIMARY KEY(cp, nombre),
    FOREIGN KEY(id_tps) REFERENCES tipos(id_tps),
    FOREIGN KEY(id_mns) REFERENCES municipios(id_mns),
    FOREIGN KEY(id_cus) REFERENCES ciudades(id_cus)
)DEFAULT CHARACTER SET utf8;