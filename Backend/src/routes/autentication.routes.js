const express = require('express');
const router = express.Router();
const pool = require('../database');
const format = require('pg-format');
const helpers = require('../lib/helpers');

router.post('/signin', async (req, res) => {
    const { rol, tipo_documento, documento_usuario, nombre_usuario, apellido_usuario, genero, fecha_nacimiento, ciudad_residencia,
        direccion_residencia, telefono_residencia, correo_electronico, telefono_celular, foto_usuario, copia_documento } = req.body;

    const pass_usuario = await helpers.encryptPassword(documento_usuario);
    const codigo_usuario = await helpers.createCodigoUsuario();

    const newUser = [
        codigo_usuario, tipo_documento, documento_usuario, nombre_usuario, apellido_usuario, genero, fecha_nacimiento,
        direccion_residencia, ciudad_residencia, telefono_residencia, correo_electronico, telefono_celular,
        foto_usuario, copia_documento, pass_usuario
    ];

    if (rol == 'ESTUDIANTE') {
        try {
            const rows = await pool.query(format(`INSERT INTO estudiantes ( codigo_usuario, tipo_documento, documento_usuario, nombre_usuario, apellido_usuario, genero, fecha_nacimiento,
                direccion_residencia, ciudad_residencia, telefono_residencia, correo_electronico, telefono_celular,
                foto_usuario, copia_documento, pass_usuario) VALUES %L`, [newUser]));
            helpers.sendMail(nombre_usuario + " " + apellido_usuario, correo_electronico, documento_usuario);
            res.status(201).json("Usuario registrado");
        } catch (error) {
            console.log(error);
            res.json("Error");
        }

    } else if (rol == 'DOCENTE') {
        try {

            const rows = await pool.query(format(`INSERT INTO docentes ( codigo_usuario, tipo_documento, documento_usuario, nombre_usuario, apellido_usuario, genero, fecha_nacimiento,
                direccion_residencia, ciudad_residencia, telefono_residencia, correo_electronico, telefono_celular,
                foto_usuario, copia_documento, pass_usuario) VALUES %L`, [newUser]));
            res.status(201).json("Usuario registrado");
        } catch (error) {
            console.log(error);
            res.json("Error");
        }

    } else if (rol == 'ADMINISTRATIVO') {
        try {
            const rows = await pool.query(format(`INSERT INTO administrativos ( codigo_usuario, tipo_documento, documento_usuario, nombre_usuario, apellido_usuario, genero, fecha_nacimiento,
                direccion_residencia, ciudad_residencia, telefono_residencia, correo_electronico, telefono_celular,
                foto_usuario, copia_documento, pass_usuario) VALUES %L`, [newUser]));
            res.status(201).json("Usuario registrado");
        } catch (error) {
            console.log(error);
            res.json("Error");
        }

    }

});

router.post('/login', async (req, res) => {
    const { rol, correo_electronico, contrasena_usuario } = req.body;

    if (rol == 'estudiante') {

        const { rows } = await pool.query(`SELECT * FROM estudiantes WHERE correo_electronico = '${correo_electronico}'`);
        if (rows.length > 0) {
            const savedpass = rows[0].pass_usuario;
            const validPass = await helpers.matchPassword(contrasena_usuario, savedpass);
            rows.push({ validPass: validPass })
            res.json(rows);
        }

    } else if (rol == 'docente') {

        const { rows } = await pool.query(`SELECT * FROM docentes WHERE correo_electronico = '${correo_electronico}'`);
        if (rows.length > 0) {
            const savedpass = rows[0].pass_usuario;
            const validPass = await helpers.matchPassword(contrasena_usuario, savedpass);
            rows.push({ validPass: validPass })
            res.json(rows);
        }

    } else if (rol == "administrativo") {

        const { rows } = await pool.query(`SELECT * FROM administrativos WHERE correo_electronico = '${correo_electronico}'`);
        if (rows.length > 0) {
            const savedpass = rows[0].pass_usuario;
            const validPass = await helpers.matchPassword(contrasena_usuario, savedpass);
            rows.push({ validPass: validPass })
            res.json(rows);
        }

    }


});


module.exports = router;