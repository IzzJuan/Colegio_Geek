import React, { useState, useEffect } from "react";
import Axios from "axios";
import { Link } from 'react-router-dom';
import Cookies from 'universal-cookie';

import Table from "../components/Table";
import logo from "../images/logo.png";
const cookies = new Cookies();
const GradesList = () => {
    const [loading, setLoading] = useState(false);
    const [studentList, setStudentList] = useState([]);
    const [listColumns, setListColumns] = useState([]);

    const urlBack = 'http://35.237.174.137:8080'
    let cols = [];

    useEffect(() => {
        setLoading(true);
        const getData = async () => {
            try {
                const { data } = await Axios.get(`${urlBack}/students-notas/${cookies.get('id_usuario')}`);
                setStudentList(data);
                return (data[0]);
            } catch (error) {
                console.log(error)
                console.log(cookies.get('id_usuario'));
            }
        }

        const getKeys = async () => {
            try {
                const res = await getData();
                Object.keys(res).map((keyName, index) => {
                    cols[index] = {
                        Header: keyName,
                        accessor: keyName
                    }
                });
                setListColumns(cols);
            } catch (error) {
                console.log(error)
            } finally {
                setLoading(false);
            }
        }
        getKeys();
    }, []);


    return (
        <div className="row align-items-center">
            <div className="col-12">
                <img className="Llogo shadow rounded my-5" src={logo} />
            </div>
            <div className="col-12">
                {!loading && <Table
                    listRows={studentList}
                    listColumns={listColumns}
                // page="4"
                // endpoint="/grupos"
                // method="post"
                // btnText="Register"
                />}
            </div>
        </div>
    );
}

export default GradesList;