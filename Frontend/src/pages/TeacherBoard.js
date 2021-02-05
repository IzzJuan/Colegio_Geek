import React, {useState, useEffect} from "react";
import Cookies from 'universal-cookie';
const cookies = new Cookies();

import NavMenu from "../components/NavMenu";
import Dashboard from "../components/Dashboard";


const TeacherBoard=()=>{
  const [collapsed, setCollapsed] = useState(false);
  const [toggled, setToggled] = useState(false);
  const urlText=['Inicio','Mis grupos','Mis Materias','Seguimientos','Cambiar clave'];
  const url=['teacher-board/','teacher-board/grades','teacher-board/signatures','teacher-board/history','teacher-board/password']

  // useEffect(() => {
  //   if (!cookies.get('correo_electronico')) {
  //     window.location.href = "/"
  //     console.log('Necesita iniciar sesion para usar esta función')
  //  }
  // });

  const handleToggleSidebar = (value) => {
    setToggled(value);
  };

  return (
    <div className={`row ${toggled ? 'toggled' : ''}`} id='board'>
      <NavMenu
        collapsed={collapsed}
        toggled={toggled}
        handleToggleSidebar={handleToggleSidebar}
        links={url}
        tLinks={urlText}
      />
      <Dashboard
        handleToggleSidebar={handleToggleSidebar}
      />
    </div>
  );
}
export default TeacherBoard;