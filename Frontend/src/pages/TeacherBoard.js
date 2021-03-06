import React, {useState, useEffect} from "react";
import Cookies from 'universal-cookie';
const cookies = new Cookies();

import NavMenu from "../components/NavMenu";
import Dashboard from "../components/Dashboard";


const TeacherBoard=({ children })=>{
  const [collapsed, setCollapsed] = useState(false);
  const [toggled, setToggled] = useState(false);
  const urlText=['Inicio','Mis grupos','Seguimientos','Cambiar clave'];
  const url=['teacher-board/','teacher-board/groups/','teacher-board/grades/','teacher-board/change-password/']

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
    <div className="row h-100 m-0 justify-content-center">
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
      <div id='form' className="col-10 col-sm-11 col-md-7 col-lg-8 p-0">{children}</div>
    </div>
  );
}
export default TeacherBoard;