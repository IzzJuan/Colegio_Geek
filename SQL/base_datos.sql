/*
 Navicat Premium Data Transfer

 Source Server         : AWSRDS
 Source Server Type    : PostgreSQL
 Source Server Version : 120004
 Source Host           : postgreinstance.c3jkemwvwcuj.us-east-2.rds.amazonaws.com:5432
 Source Catalog        : academia_geek
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120004
 File Encoding         : 65001

 Date: 04/02/2021 11:15:28
*/

CREATE DATABASE academia_geek;
USE academia_geek;
-- ----------------------------
-- Type structure for correo_validado
-- ----------------------------
DROP TYPE IF EXISTS "public"."correo_validado";
CREATE TYPE "public"."correo_validado" AS ENUM (
  'SI',
  'NO'
);
ALTER TYPE "public"."correo_validado" OWNER TO "postgres";

-- ----------------------------
-- Type structure for estado
-- ----------------------------
DROP TYPE IF EXISTS "public"."estado";
CREATE TYPE "public"."estado" AS ENUM (
  '1',
  '2',
  '3'
);
ALTER TYPE "public"."estado" OWNER TO "postgres";

-- ----------------------------
-- Type structure for genero
-- ----------------------------
DROP TYPE IF EXISTS "public"."genero";
CREATE TYPE "public"."genero" AS ENUM (
  'MASCULINO',
  'FEMENINO',
  'OTRO'
);
ALTER TYPE "public"."genero" OWNER TO "postgres";

-- ----------------------------
-- Type structure for jornada
-- ----------------------------
DROP TYPE IF EXISTS "public"."jornada";
CREATE TYPE "public"."jornada" AS ENUM (
  'mañana',
  'tarde'
);
ALTER TYPE "public"."jornada" OWNER TO "postgres";

-- ----------------------------
-- Type structure for rol
-- ----------------------------
DROP TYPE IF EXISTS "public"."rol";
CREATE TYPE "public"."rol" AS ENUM (
  'ESTUDIANTE',
  'DOCENTE',
  'ADMINISTRATIVO'
);
ALTER TYPE "public"."rol" OWNER TO "postgres";

-- ----------------------------
-- Type structure for tipo_documento
-- ----------------------------
DROP TYPE IF EXISTS "public"."tipo_documento";
CREATE TYPE "public"."tipo_documento" AS ENUM (
  'TI',
  'NUIM',
  'CC'
);
ALTER TYPE "public"."tipo_documento" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for administrativos_id_administrativo_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."administrativos_id_administrativo_seq";
CREATE SEQUENCE "public"."administrativos_id_administrativo_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for docentes_id_docente_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."docentes_id_docente_seq";
CREATE SEQUENCE "public"."docentes_id_docente_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for estudiantes_grupos_id_estudiantes_grupos_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."estudiantes_grupos_id_estudiantes_grupos_seq";
CREATE SEQUENCE "public"."estudiantes_grupos_id_estudiantes_grupos_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for estudiantes_id_estudiante_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."estudiantes_id_estudiante_seq";
CREATE SEQUENCE "public"."estudiantes_id_estudiante_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for grupos_id_grupo_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."grupos_id_grupo_seq";
CREATE SEQUENCE "public"."grupos_id_grupo_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for historial_id_historial_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."historial_id_historial_seq";
CREATE SEQUENCE "public"."historial_id_historial_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for materias_id_materia_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."materias_id_materia_seq";
CREATE SEQUENCE "public"."materias_id_materia_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for notas_id_nota_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."notas_id_nota_seq";
CREATE SEQUENCE "public"."notas_id_nota_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for planes_evaluacion_id_plan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."planes_evaluacion_id_plan_seq";
CREATE SEQUENCE "public"."planes_evaluacion_id_plan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for administrativos
-- ----------------------------
DROP TABLE IF EXISTS "public"."administrativos";
CREATE TABLE "public"."administrativos" (
  "id_administrativo" int4 NOT NULL DEFAULT nextval('administrativos_id_administrativo_seq'::regclass),
  "codigo_usuario" varchar(10) COLLATE "pg_catalog"."default",
  "tipo_documento" "public"."tipo_documento",
  "documento_usuario" varchar(15) COLLATE "pg_catalog"."default",
  "nombre_usuario" varchar(30) COLLATE "pg_catalog"."default",
  "apellido_usuario" varchar(30) COLLATE "pg_catalog"."default",
  "genero" "public"."genero",
  "fecha_nacimiento" date,
  "direccion_residencia" varchar(20) COLLATE "pg_catalog"."default",
  "ciudad_residencia" varchar(20) COLLATE "pg_catalog"."default",
  "telefono_residencia" varchar(20) COLLATE "pg_catalog"."default",
  "correo_electronico" varchar(30) COLLATE "pg_catalog"."default",
  "telefono_celular" varchar(20) COLLATE "pg_catalog"."default",
  "foto_usuario" varchar(500) COLLATE "pg_catalog"."default",
  "copia_documento" varchar(500) COLLATE "pg_catalog"."default",
  "pass_usuario" varchar(300) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of administrativos
-- ----------------------------

-- ----------------------------
-- Table structure for docentes
-- ----------------------------
DROP TABLE IF EXISTS "public"."docentes";
CREATE TABLE "public"."docentes" (
  "id_docente" int4 NOT NULL DEFAULT nextval('docentes_id_docente_seq'::regclass),
  "codigo_usuario" varchar(10) COLLATE "pg_catalog"."default",
  "tipo_documento" "public"."tipo_documento",
  "documento_usuario" varchar(15) COLLATE "pg_catalog"."default",
  "nombre_usuario" varchar(30) COLLATE "pg_catalog"."default",
  "apellido_usuario" varchar(30) COLLATE "pg_catalog"."default",
  "genero" "public"."genero",
  "fecha_nacimiento" date,
  "direccion_residencia" varchar(20) COLLATE "pg_catalog"."default",
  "ciudad_residencia" varchar(20) COLLATE "pg_catalog"."default",
  "telefono_residencia" varchar(20) COLLATE "pg_catalog"."default",
  "correo_electronico" varchar(30) COLLATE "pg_catalog"."default",
  "telefono_celular" varchar(20) COLLATE "pg_catalog"."default",
  "foto_usuario" varchar(500) COLLATE "pg_catalog"."default",
  "copia_documento" varchar(500) COLLATE "pg_catalog"."default",
  "pass_usuario" varchar(300) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of docentes
-- ----------------------------
INSERT INTO "public"."docentes" VALUES (1, '123', 'CC', '12345', 'javier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for estudiantes
-- ----------------------------
DROP TABLE IF EXISTS "public"."estudiantes";
CREATE TABLE "public"."estudiantes" (
  "id_estudiante" int4 NOT NULL DEFAULT nextval('estudiantes_id_estudiante_seq'::regclass),
  "codigo_usuario" varchar(10) COLLATE "pg_catalog"."default",
  "tipo_documento" "public"."tipo_documento",
  "documento_usuario" varchar(15) COLLATE "pg_catalog"."default",
  "nombre_usuario" varchar(30) COLLATE "pg_catalog"."default",
  "apellido_usuario" varchar(30) COLLATE "pg_catalog"."default",
  "genero" "public"."genero",
  "fecha_nacimiento" date,
  "direccion_residencia" varchar(20) COLLATE "pg_catalog"."default",
  "ciudad_residencia" varchar(20) COLLATE "pg_catalog"."default",
  "telefono_residencia" varchar(20) COLLATE "pg_catalog"."default",
  "correo_electronico" varchar(30) COLLATE "pg_catalog"."default",
  "telefono_celular" varchar(20) COLLATE "pg_catalog"."default",
  "foto_estudiante" varchar(500) COLLATE "pg_catalog"."default",
  "copia_documento" varchar(500) COLLATE "pg_catalog"."default",
  "pass_usuario" varchar(300) COLLATE "pg_catalog"."default",
  "id_grupo" int8 NOT NULL
)
;

-- ----------------------------
-- Records of estudiantes
-- ----------------------------
INSERT INTO "public"."estudiantes" VALUES (1, NULL, NULL, NULL, 'juan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for estudiantes_grupos
-- ----------------------------
DROP TABLE IF EXISTS "public"."estudiantes_grupos";
CREATE TABLE "public"."estudiantes_grupos" (
  "id_estudiantes_grupos" int4 NOT NULL DEFAULT nextval('estudiantes_grupos_id_estudiantes_grupos_seq'::regclass),
  "id_estudiante" int8,
  "id_grupos" int8
)
;

-- ----------------------------
-- Records of estudiantes_grupos
-- ----------------------------
INSERT INTO "public"."estudiantes_grupos" VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for grupos
-- ----------------------------
DROP TABLE IF EXISTS "public"."grupos";
CREATE TABLE "public"."grupos" (
  "id_grupo" int4 NOT NULL DEFAULT nextval('grupos_id_grupo_seq'::regclass),
  "codigo_grupo" varchar(10) COLLATE "pg_catalog"."default",
  "jornada" "public"."jornada",
  "id_profesor" int8 NOT NULL
)
;

-- ----------------------------
-- Records of grupos
-- ----------------------------
INSERT INTO "public"."grupos" VALUES (1, '111', 'mañana', 1);
INSERT INTO "public"."grupos" VALUES (2, '20201', 'mañana', 1);
INSERT INTO "public"."grupos" VALUES (3, '20201', 'mañana', 1);

-- ----------------------------
-- Table structure for historial
-- ----------------------------
DROP TABLE IF EXISTS "public"."historial";
CREATE TABLE "public"."historial" (
  "id_historial" int4 NOT NULL DEFAULT nextval('historial_id_historial_seq'::regclass),
  "codigo_estudiante" varchar(10) COLLATE "pg_catalog"."default",
  "ano" varchar(5) COLLATE "pg_catalog"."default",
  "grado" varchar(3) COLLATE "pg_catalog"."default",
  "estado" "public"."estado",
  "nota_promedio" varchar(5) COLLATE "pg_catalog"."default",
  "id_estudiante" int8 NOT NULL
)
;

-- ----------------------------
-- Records of historial
-- ----------------------------
INSERT INTO "public"."historial" VALUES (1, '2020123', '2013', '8', '1', '2', 1);
INSERT INTO "public"."historial" VALUES (3, NULL, '2013', '8', '1', '2', 1);

-- ----------------------------
-- Table structure for materias
-- ----------------------------
DROP TABLE IF EXISTS "public"."materias";
CREATE TABLE "public"."materias" (
  "id_materia" int4 NOT NULL DEFAULT nextval('materias_id_materia_seq'::regclass),
  "codigo_materia" varchar(10) COLLATE "pg_catalog"."default",
  "nombre_materia" varchar(20) COLLATE "pg_catalog"."default",
  "sexto" int2,
  "septimo" int2,
  "octavo" int2,
  "noveno" int2,
  "decimo" int2,
  "once" int2,
  "id_grupo" int8 NOT NULL
)
;

-- ----------------------------
-- Records of materias
-- ----------------------------
INSERT INTO "public"."materias" VALUES (1, '2020', 'matematicas', 0, 0, 0, 0, NULL, 1, 1);
INSERT INTO "public"."materias" VALUES (2, '2020', 'matematicas', 0, 0, 0, 0, NULL, 1, 1);

-- ----------------------------
-- Table structure for notas
-- ----------------------------
DROP TABLE IF EXISTS "public"."notas";
CREATE TABLE "public"."notas" (
  "id_nota" int4 NOT NULL DEFAULT nextval('notas_id_nota_seq'::regclass),
  "valor" varchar(5) COLLATE "pg_catalog"."default",
  "id_plan_evaluacion" int8 NOT NULL,
  "id_estudiante" int8 NOT NULL
)
;

-- ----------------------------
-- Records of notas
-- ----------------------------
INSERT INTO "public"."notas" VALUES (2, '2', 1, 1);
INSERT INTO "public"."notas" VALUES (3, '2', 1, 1);

-- ----------------------------
-- Table structure for planes_evaluacion
-- ----------------------------
DROP TABLE IF EXISTS "public"."planes_evaluacion";
CREATE TABLE "public"."planes_evaluacion" (
  "id_plan" int4 NOT NULL DEFAULT nextval('planes_evaluacion_id_plan_seq'::regclass),
  "cantidad_notas" int8,
  "descripcion_plan" varchar(200) COLLATE "pg_catalog"."default",
  "id_materia" int8 NOT NULL,
  "id_grupo" int8 NOT NULL
)
;

-- ----------------------------
-- Records of planes_evaluacion
-- ----------------------------
INSERT INTO "public"."planes_evaluacion" VALUES (1, 2, 'plan 1', 1, 1);
INSERT INTO "public"."planes_evaluacion" VALUES (2, 2, 'plan 1', 1, 1);
INSERT INTO "public"."planes_evaluacion" VALUES (3, 2, 'plan 1', 1, 1);
INSERT INTO "public"."planes_evaluacion" VALUES (4, 2, 'plan 1', 1, 1);

-- ----------------------------
-- Table structure for ultimo_usuario
-- ----------------------------
DROP TABLE IF EXISTS "public"."ultimo_usuario";
CREATE TABLE "public"."ultimo_usuario" (
  "year" varchar(20) COLLATE "pg_catalog"."default",
  "identificador" int4
)
;

-- ----------------------------
-- Records of ultimo_usuario
-- ----------------------------
INSERT INTO "public"."ultimo_usuario" VALUES ('2021', 157);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."administrativos_id_administrativo_seq"
OWNED BY "public"."administrativos"."id_administrativo";
SELECT setval('"public"."administrativos_id_administrativo_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."docentes_id_docente_seq"
OWNED BY "public"."docentes"."id_docente";
SELECT setval('"public"."docentes_id_docente_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."estudiantes_grupos_id_estudiantes_grupos_seq"
OWNED BY "public"."estudiantes_grupos"."id_estudiantes_grupos";
SELECT setval('"public"."estudiantes_grupos_id_estudiantes_grupos_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."estudiantes_id_estudiante_seq"
OWNED BY "public"."estudiantes"."id_estudiante";
SELECT setval('"public"."estudiantes_id_estudiante_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."grupos_id_grupo_seq"
OWNED BY "public"."grupos"."id_grupo";
SELECT setval('"public"."grupos_id_grupo_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."historial_id_historial_seq"
OWNED BY "public"."historial"."id_historial";
SELECT setval('"public"."historial_id_historial_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."materias_id_materia_seq"
OWNED BY "public"."materias"."id_materia";
SELECT setval('"public"."materias_id_materia_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."notas_id_nota_seq"
OWNED BY "public"."notas"."id_nota";
SELECT setval('"public"."notas_id_nota_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."planes_evaluacion_id_plan_seq"
OWNED BY "public"."planes_evaluacion"."id_plan";
SELECT setval('"public"."planes_evaluacion_id_plan_seq"', 5, true);

-- ----------------------------
-- Primary Key structure for table administrativos
-- ----------------------------
ALTER TABLE "public"."administrativos" ADD CONSTRAINT "administrativos_pkey" PRIMARY KEY ("id_administrativo");

-- ----------------------------
-- Primary Key structure for table docentes
-- ----------------------------
ALTER TABLE "public"."docentes" ADD CONSTRAINT "docentes_pkey" PRIMARY KEY ("id_docente");

-- ----------------------------
-- Primary Key structure for table estudiantes
-- ----------------------------
ALTER TABLE "public"."estudiantes" ADD CONSTRAINT "estudiantes_pkey" PRIMARY KEY ("id_estudiante");

-- ----------------------------
-- Primary Key structure for table grupos
-- ----------------------------
ALTER TABLE "public"."grupos" ADD CONSTRAINT "grupos_pkey" PRIMARY KEY ("id_grupo");

-- ----------------------------
-- Primary Key structure for table historial
-- ----------------------------
ALTER TABLE "public"."historial" ADD CONSTRAINT "historial_pkey" PRIMARY KEY ("id_historial");

-- ----------------------------
-- Primary Key structure for table materias
-- ----------------------------
ALTER TABLE "public"."materias" ADD CONSTRAINT "materias_pkey" PRIMARY KEY ("id_materia");

-- ----------------------------
-- Primary Key structure for table notas
-- ----------------------------
ALTER TABLE "public"."notas" ADD CONSTRAINT "notas_pkey" PRIMARY KEY ("id_nota");

-- ----------------------------
-- Primary Key structure for table planes_evaluacion
-- ----------------------------
ALTER TABLE "public"."planes_evaluacion" ADD CONSTRAINT "planes_evaluacion_pkey" PRIMARY KEY ("id_plan");

-- ----------------------------
-- Foreign Keys structure for table estudiantes
-- ----------------------------
ALTER TABLE "public"."estudiantes" ADD CONSTRAINT "fk_grupo" FOREIGN KEY ("id_grupo") REFERENCES "public"."grupos" ("id_grupo") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table estudiantes_grupos
-- ----------------------------
ALTER TABLE "public"."estudiantes_grupos" ADD CONSTRAINT "fk_estudiantes_g" FOREIGN KEY ("id_estudiante") REFERENCES "public"."estudiantes" ("id_estudiante") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."estudiantes_grupos" ADD CONSTRAINT "fk_grupos_e" FOREIGN KEY ("id_grupos") REFERENCES "public"."grupos" ("id_grupo") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table grupos
-- ----------------------------
ALTER TABLE "public"."grupos" ADD CONSTRAINT "fk_profesores" FOREIGN KEY ("id_profesor") REFERENCES "public"."docentes" ("id_docente") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table historial
-- ----------------------------
ALTER TABLE "public"."historial" ADD CONSTRAINT "fk_codigo" FOREIGN KEY ("id_estudiante") REFERENCES "public"."estudiantes" ("id_estudiante") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table materias
-- ----------------------------
ALTER TABLE "public"."materias" ADD CONSTRAINT "fk_grupos_materias" FOREIGN KEY ("id_grupo") REFERENCES "public"."grupos" ("id_grupo") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table notas
-- ----------------------------
ALTER TABLE "public"."notas" ADD CONSTRAINT "fk_notas_estudiantes" FOREIGN KEY ("id_estudiante") REFERENCES "public"."estudiantes" ("id_estudiante") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."notas" ADD CONSTRAINT "fk_notas_planes" FOREIGN KEY ("id_plan_evaluacion") REFERENCES "public"."planes_evaluacion" ("id_plan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table planes_evaluacion
-- ----------------------------
ALTER TABLE "public"."planes_evaluacion" ADD CONSTRAINT "fk_planes_grupos" FOREIGN KEY ("id_grupo") REFERENCES "public"."grupos" ("id_grupo") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."planes_evaluacion" ADD CONSTRAINT "fk_planes_materias" FOREIGN KEY ("id_materia") REFERENCES "public"."materias" ("id_materia") ON DELETE NO ACTION ON UPDATE NO ACTION;
