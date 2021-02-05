import React, { useState, useEffect } from "react";
import Axios from "axios";
import {Link} from 'react-router-dom';
import Cookies from 'universal-cookie';

import Form from "../components/Form";

import logo from "../images/logo.png";


const GroupRegister=()=>{

  const [loading,setLoading] = useState (true);
  const [list, setList]=useState([]);

  const camposInputs=[{codigo_grupo:'Código grupo'}];
  const jor={jornada:['mañana','tarde']};
  const inputType=['text'];
  const validation=[{required: true}];
  const errMessage=['Ingrese código del grupo'];

  useEffect(async() => {
//     if (Cookies.get('corre_electronico')) {
//         window.location.href = "../profile"
//     }
    const getData = async () => {
      const {data}= await Axios.get(`http://localhost:8080/teachers`);            
      setList(data);
    }
    if(loading){
      getData();
      setLoading(false);
    }
  },[]);

  return (
    <div className="row align-items-center">
      <div className="col-12">
        <img className="Llogo shadow rounded " src={logo} />
      </div>
      <div className="col-12">
        <Form
          page="4"
          camps={camposInputs}
          inTypes={inputType}
          vals={validation}
          errMes={errMessage}
          j={jor}
          tList={list}
          endpoint="/grupos"
          method="post"
          btnText="Register"
        />
      </div>
    </div>
  );
}
export default GroupRegister;