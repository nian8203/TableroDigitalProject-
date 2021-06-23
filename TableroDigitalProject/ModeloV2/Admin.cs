using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ModeloV2
{
    public class Admin
    {

        /*========================================  INICIO DE SESION Y BUSQUEDA ========================================*/

        public static UsuarioDb validarSesion(string correo, string pass)
        {
            DatosDataContext dc = new DatosDataContext();
            UsuarioDb us = null;

            var query = from u in dc.UsuarioDb
                        where u.correo == correo && u.pass == pass
                        select u;

            if (query.Count() > 0)
            {
                us = query.First();
            }
            return us;

        }

        public static UsuarioDb buscarUsuarioPorid(string id)
        {
            DatosDataContext dc = new DatosDataContext();
            UsuarioDb us = null;

            var query = from u in dc.UsuarioDb
                        where u.id == id
                        select u;

            if (query.Count() > 0)
            {
                us = query.First();
            }
            return us;
        }

        public static Alumno buscarAlumnoPorId(string id)
        {
            DatosDataContext dc = new DatosDataContext();
            Alumno al = null;

            var query = from a in dc.Alumno
                        where a.id == id
                        select a;

            if (query.Count() > 0)
            {
                al = query.First();
            }
            return al;
        }

        public static AlumnoCurso buscarAlumnoEnCurso(string id, int idcurso)
        {
            DatosDataContext dc = new DatosDataContext();
            AlumnoCurso alc = null;
            var query = from ac in dc.AlumnoCurso
                        where ac.idAlumno == id && ac.idCurso == idcurso
                        select ac;

            if (query.Count() > 0)
            {
                alc = query.First();
            }
            return alc;

        }

        public static Asignatura buscarAsignaturaPorId(int id)
        {
            DatosDataContext dc = new DatosDataContext();
            var query = dc.Asignatura.Where(a => a.id == id).Select(a => a);
            Asignatura asig = null;

            if (query.Count() > 0)
            {
                asig = query.First();
            }
            return asig;
        }

        public static CursoAsignatura buscarAsigDeDocente(string idDocente)
        {
            DatosDataContext dc = new DatosDataContext();
            CursoAsignatura cas = dc.CursoAsignatura.Where(ca => ca.idDocente == idDocente).Select(ca => ca).First();
            return cas;
        }

        /*======================================  END INICIO DE SESION  ======================================*/





        /*========================================  METODOS DE VALIDACIONES  =======================================*/

        public static bool validarCorreoUsuarioExiste(string correo, string idUsuario)
        {
            DatosDataContext dc = new DatosDataContext();
            bool correoEncontrado = false;

            var query = from u in dc.UsuarioDb
                        where u.correo == correo && u.id == idUsuario
                        select u;

            if (query.Count() > 0)
            {
                correoEncontrado = true;
            }
            return correoEncontrado;
        }

        public static bool validarAsignaturaEnCurso(int idAsignatura, int idCurso)
        {
            DatosDataContext dc = new DatosDataContext();
            bool asignaturaEncontrada = false;

            var query = from ca in dc.CursoAsignatura
                        where ca.idAsignatura == idAsignatura && ca.idCurso == idCurso
                        select ca;

            if (query.Count() > 0)
            {
                asignaturaEncontrada = true;
            }
            return asignaturaEncontrada;
        }

        public static bool validarExistenciaAsignatura(string nombre)
        {
            DatosDataContext dc = new DatosDataContext();
            bool asigEncontrada = false;

            var query = dc.Asignatura.Where(a => a.materia == nombre).Select(a => a);

            if (query.Count() > 0)
            {
                asigEncontrada = true;
            }
            return asigEncontrada;
        }

        public static bool validarAignaturaEstaVinculadaDocente(int id)
        {
            DatosDataContext dc = new DatosDataContext();
            bool res = false;

            var query = dc.CursoAsignatura.Where(ca => ca.idAsignatura == id).Select(ac => ac);

            if (query.Count() > 0)
            {
                res = true;
            }
            return res;
        }

        public static bool validarExistenciaCurso(string curso)
        {
            DatosDataContext dc = new DatosDataContext();
            var query = dc.Curso.Where(c => c.curso1 == curso).Select(c => c);
            bool res = false;

            if (query.Count() > 0)
            {
                res = true;
            }
            return res;
        }

        public static bool validarCursoAsignatura(int idCurso)
        {
            //MessageBox.Show($"val cur vin = {idCurso}");
            DatosDataContext dc = new DatosDataContext();
            var query = dc.CursoAsignatura.Where(ca => ca.idCurso == idCurso).Select(ca => ca);
            bool res = false;

            if (query.Count() > 0)
            {
                res = true;
            }
            return res;
        }

        public static bool validarAlumnoCurso(int idCurso)
        {
            //MessageBox.Show($"Admin validarAlumnoCurso = {idCurso}");
            DatosDataContext dc = new DatosDataContext();
            var query = dc.AlumnoCurso.Where(ac => ac.idCurso == idCurso).Select(ac => ac);
            bool res = false;

            if (query.Count()>0)
            {
                res = true;
            }
            return res;
        }

        public static bool validarAsignaturaExisteEnCurso(int idCurso, int idAsignatura)
        {
            DatosDataContext dc = new DatosDataContext();
            var query = dc.CursoAsignatura.Where(ca => ca.idCurso == idCurso && ca.idAsignatura == idAsignatura).Select(ca => ca);
            bool res = false;

            if (query.Count()>0)
            {
                res = true;
            }
            return res;
        }




        /*======================================  END METODOS DE VALIDACIONES  =====================================*/





        /*========================================  METODOS DE LISTAR  =======================================*/

        public static object listarAlumnos()
        {
            DatosDataContext dc = new DatosDataContext();
            var query = dc.Alumno.Where(a => a.idEstado == 1).Select(u => u);
            return query;
        }

        public static object listarDocentes()
        {
            DatosDataContext dc = new DatosDataContext();
            var query = dc.UsuarioDb.Where(u => u.idRol == 2 && u.idEstado == 1).Select(u => u);
            return query;
        }

        public static object listarAcudientes()
        {
            DatosDataContext dc = new DatosDataContext();
            var query = dc.UsuarioDb.Where(u => u.idRol == 1 && u.idEstado == 1).Select(u => u);
            return query;
        }

        public static object listarDocentesPorNombre(string dato)
        {
            DatosDataContext dc = new DatosDataContext();
            //MessageBox.Show("Test "+nombre);
            var query = from u in dc.UsuarioDb
                        where u.idRol == 2 && u.nombre.StartsWith(dato) || u.idRol == 2 && u.id.StartsWith(dato)
                        orderby u.nombre
                        select new
                        {
                            u.id,
                            u.nombre,
                            u.apellido,
                            u.telefono,
                            u.correo
                        };
            return query;
        }

        public static object listarDocentesAgregaraCurso(int curso)
        {
            DatosDataContext dc = new DatosDataContext();

            var query = from ca in dc.CursoAsignatura
                        join u in dc.UsuarioDb
                        on ca.idDocente equals u.id
                        join a in dc.Asignatura
                        on ca.idAsignatura equals a.id
                        orderby u.apellido
                        where ca.idCurso == null || ca.idCurso != curso
                        select new
                        {
                            idUsuario = u.id,
                            idMateria = a.id,
                            materia = a.materia,
                            docente = u.apellido+" "+u.nombre,
                            correo = u.correo
                        };
            return query;
        }

        public static object listarAlumnosPorNombre(string dato)
        {
            DatosDataContext dc = new DatosDataContext();
            Alumno al = null;
            //MessageBox.Show("Test "+nombre);
            var query = from a in dc.Alumno
                        where a.nombre.StartsWith(dato) || a.id.StartsWith(dato)
                        orderby a.nombre
                        select new
                        {
                            a.id,
                            a.nombre,
                            a.apellido,
                            a.telefono,
                            a.correo
                        };
            return query;
        }

        public static object listarAcudientePorNombre(string dato)
        {
            DatosDataContext dc = new DatosDataContext();

            var query = from u in dc.UsuarioDb
                        where u.idRol == 1 && u.nombre.StartsWith(dato) || u.id.StartsWith(dato)
                        orderby u.nombre
                        select new
                        {
                            u.id,
                            u.nombre,
                            u.apellido,
                            u.telefono,
                            u.correo
                        };
            return query;
        }

        public static object listarAlumnosPorId(string id)
        {
            DatosDataContext dc = new DatosDataContext();
            Alumno al = null;
            //MessageBox.Show("Test "+nombre);
            var query = from a in dc.Alumno
                        where a.id.StartsWith(id)
                        orderby a.nombre
                        select new
                        {
                            a.id,
                            a.nombre,
                            a.apellido,
                            a.telefono,
                            a.correo
                        };
            return query;
        }

        public static object listarAlumnosPorCurso(int idCurso)
        {
            //MessageBox.Show($"id curso admin {idCurso}");
            DatosDataContext dc = new DatosDataContext();
            var query = from ac in dc.AlumnoCurso
                        join a in dc.Alumno
                        on ac.idAlumno equals a.id
                        where ac.idCurso == idCurso
                        orderby a.nombre
                        select new
                        {
                            nombre = a.apellido + " "+a.nombre,
                            telefono = a.telefono,
                            correo = a.correo
                        };
            return query;
        }

        public static object listarTipoDocumento()
        {
            DatosDataContext dc = new DatosDataContext();
            var query = dc.TipoDocumento.Select(td => td);
            return query;
        }

        public static object listarEstado()
        {
            DatosDataContext dc = new DatosDataContext();
            var query = dc.Estado.Select(e => e);
            return query;
        }

        public static object listarCurso()
        {
            DatosDataContext dc = new DatosDataContext();
            var query = dc.Curso.Select(c => c);
            return query;
        }

        public static object listarAsignatura()
        {
            DatosDataContext dc = new DatosDataContext();
            var query = dc.Asignatura.Select(a => a).OrderBy(a => a.id);
            return query;
        }

        public static object listarAsignaturasPorCurso(int idCurso)
        {
            DatosDataContext dc = new DatosDataContext();
            var query = from ca in dc.CursoAsignatura
                        join a in dc.Asignatura
                        on ca.idAsignatura equals a.id
                        join u in dc.UsuarioDb
                        on ca.idDocente equals u.id
                        where ca.idCurso == idCurso
                        select new
                        {
                           materia=a.materia,
                           docente=u.apellido+" "+u.nombre,
                           correo=u.correo
                        };
            return query;
        }

        public static object listarAsignaturasNoExistentesenCurso(int idCurso)
        {
            DatosDataContext dc = new DatosDataContext();
            var query = (from ca in dc.CursoAsignatura
                        join a in dc.Asignatura
                        on ca.idAsignatura equals a.id
                        join u in dc.UsuarioDb
                        on ca.idDocente equals u.id
                        where ca.idCurso != idCurso
                        select new
                        {
                            idUsuario = u.id,
                            idMateria = a.id,
                            materia = a.materia,
                            docente = u.apellido + " " + u.nombre,
                            correo = u.correo
                        }).Distinct().ToList();
            return query;
        }

        public static List<string> listarCursosPorDocente(string idDocente)
        {
            DatosDataContext dc = new DatosDataContext();

            var query = (from ca in dc.CursoAsignatura
                         join c in dc.Curso
                         on ca.idCurso equals c.id
                         where ca.idDocente == idDocente
                         select c.curso1).ToList();

            //foreach (var item in query)
            //{
            //    MessageBox.Show($"cursos {item}");
            //}
            return query;

        }

        


        /*======================================  END METODOS DE LISTAR  =====================================*/






        /*========================================  METODOS DE REGISTRO  =======================================*/

        public static int registrarAcudiente(string id, string nombre, string apellido, string telefono, string direccion,
            string correo, string pass, int idEstado, int idRol, int idTipoDocumento)
        {
            DatosDataContext dc = new DatosDataContext();
            UsuarioDb udb = Admin.buscarUsuarioPorid(id);
            UsuarioDb newUdb = new UsuarioDb();
            int opcion = 0;


            if (udb == null)
            {
                newUdb.id = id;
                newUdb.nombre = nombre;
                newUdb.apellido = apellido;
                newUdb.telefono = telefono;
                newUdb.direccion = direccion;
                newUdb.correo = correo;
                newUdb.pass = Encriptacion.GetSHA256(pass);
                newUdb.idEstado = idEstado;
                newUdb.idRol = idRol;
                newUdb.idTipoDocumento = idTipoDocumento;

                try
                {
                    dc.UsuarioDb.InsertOnSubmit(newUdb);
                    dc.SubmitChanges();
                    opcion = 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show("Error de registro " + e);
                    opcion = 2;
                }
            }
            else
            {
                opcion = 3;
            }
            return opcion;
        }


        public static int registrarAlumno(string id, string nombre, string apellido, string telefono, string direccion,
            string correo, string idAcudiente, int tipoDocumento, int estado)
        {
            DatosDataContext dc = new DatosDataContext();
            Alumno al = Admin.buscarAlumnoPorId(id);
            Alumno newAl = new Alumno();
            int opcion = 0;

            if (al == null)
            {
                newAl.id = id;
                newAl.nombre = nombre;
                newAl.apellido = apellido;
                newAl.telefono = telefono;
                newAl.direccion = direccion;
                newAl.correo = correo;
                newAl.idAcudiente = idAcudiente;
                newAl.idTipoDocumento = tipoDocumento;
                newAl.idEstado = estado;

                try
                {
                    dc.Alumno.InsertOnSubmit(newAl);
                    dc.SubmitChanges();
                    opcion = 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show("Error de registro " + e);
                    opcion = 2;
                }
            }
            else
            {
                opcion = 3;
            }
            return opcion;
        }


        public static int registrarAsignaturaDocenteCurso(int idAsignatura, string idDocente)
        {
            DatosDataContext dc = new DatosDataContext();
            CursoAsignatura cas = new CursoAsignatura();
            int opcion = 0;

            cas.idAsignatura = idAsignatura;
            cas.idDocente = idDocente;
            //MessageBox.Show($"id asignatura = {idAsignatura} \nid docente = {idDocente}");

            try
            {
                dc.CursoAsignatura.InsertOnSubmit(cas);
                dc.SubmitChanges();
                opcion = 1;
            }
            catch (Exception e)
            {
                MessageBox.Show("Error de registro " + e);
                opcion = 2;
            }
            return opcion;

        }


        public static int registrarAlumnoEnCurso(string idAlumno, int idCurso)
        {
            DatosDataContext dc = new DatosDataContext();
            AlumnoCurso alc = new AlumnoCurso();
            AlumnoCurso alumnoEncontrado = Admin.buscarAlumnoEnCurso(idAlumno, idCurso);
            int opcion = 0;
            //MessageBox.Show("Id alumno = "+idAlumno+"\nid curso = "+idCurso);

            if (alumnoEncontrado == null)
            {
                //MessageBox.Show("entro registro alumno curso");
                alc.idCurso = idCurso;
                alc.idAlumno = idAlumno;

                try
                {
                    dc.AlumnoCurso.InsertOnSubmit(alc);
                    dc.SubmitChanges();
                    opcion = 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show("Error de registro " + e);
                    opcion = 2;
                }
            }
            else
            {
                opcion = 3;
            }

            return opcion;
        }


        public static int registrarAsignatura(string nombre)
        {
            DatosDataContext dc = new DatosDataContext();
            Asignatura a = new Asignatura();
            bool asigEncontrada = Admin.validarExistenciaAsignatura(nombre);
            int opcion = 0;

            if (!asigEncontrada)
            {
                a.materia = nombre;

                try
                {
                    dc.Asignatura.InsertOnSubmit(a);
                    dc.SubmitChanges();
                    opcion = 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show("Error de registro " + e);
                    opcion = 2;
                }
            }
            else
            {
                opcion = 3;
            }
            return opcion;
        }


        public static int registrarCurso(string curso)
        {
            DatosDataContext dc = new DatosDataContext();
            bool res = Admin.validarExistenciaCurso(curso);
            Curso cu = new Curso();
            int opcion = 0;

            if (!res)
            {
                cu.curso1 = curso;

                try
                {
                    dc.Curso.InsertOnSubmit(cu);
                    dc.SubmitChanges();
                    opcion = 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show("Error de registro " + e);
                    opcion = 2;
                }
            }
            else
            {
                opcion = 3;
            }
            return opcion;
        }


        public static int registrarAsignaturaEnCurso(int idCurso, int idAsignatura, string idDocente)
        {
            DatosDataContext dc = new DatosDataContext();
            CursoAsignatura cura = new CursoAsignatura();
            int opcion = 0;

            cura.idCurso = idCurso;
            cura.idAsignatura = idAsignatura;
            cura.idDocente = idDocente;

            try
            {
                dc.CursoAsignatura.InsertOnSubmit(cura);
                dc.SubmitChanges();
                opcion = 1;
            }
            catch (Exception e)
            {
                MessageBox.Show("Error de registro " + e);
                opcion = 2;
            }
            return opcion;
        }


        public static int registrarEvidencia(string descripcion, int idAsignatura)
        {
            DatosDataContext dc = new DatosDataContext();
            Evidencia ev = new Evidencia();
            int opcion = 0;
            DateTime fecha = DateTime.Now;
             
            ev.descripcion = descripcion;
            ev.fecha = fecha;
            ev.idAsignatura = idAsignatura;

            try
            {
                dc.Evidencia.InsertOnSubmit(ev);
                dc.SubmitChanges();
                opcion = 1;
            }
            catch (Exception e)
            {
                MessageBox.Show("Error de registro " + e);
                opcion = 2;
            }
            return opcion;
        }


        /*======================================  END METODOS DE REGISTRO  =======================================*/





        /*=========================================  METODOS DE EDITAR  ==========================================*/

        public static int cambiarEstadoAlumno(string id)
        {
            DatosDataContext dc = new DatosDataContext();
            Alumno al = dc.Alumno.Where(a => a.id == id).Select(a => a).First();
            int opcion = 0;
            int estado = 2;

            al.idEstado = estado;

            try
            {
                dc.SubmitChanges();
                opcion = 1;
            }
            catch (Exception e)
            {
                MessageBox.Show("Error al eliminar " + e);
                opcion = 2;
            }
            return opcion;

        }

        public static int cambiarEstadoUsuario(string id)
        {
            DatosDataContext dc = new DatosDataContext();
            UsuarioDb udb = dc.UsuarioDb.Where(u => u.id == id).Select(u => u).First();
            int opcion = 0;

            udb.idEstado = 2;

            try
            {
                dc.SubmitChanges();
                opcion = 1;
            }
            catch (Exception e)
            {
                MessageBox.Show("Error al eliminar " + e);
                opcion = 2;
            }
            return opcion;
        }

        public static int editarAlumno(string id, string nombre, string apellido, string telefono, string direccion, string correo, int tipoDocumento, int estado)
        {
            DatosDataContext dc = new DatosDataContext();
            Alumno al = dc.Alumno.Where(a => a.id == id).Select(a => a).First();
            int opcion = 0;

            al.id = id;
            al.nombre = nombre;
            al.apellido = apellido;
            al.telefono = telefono;
            al.direccion = direccion;
            al.correo = correo;
            al.idEstado = estado;
            al.idTipoDocumento = tipoDocumento;

            try
            {
                dc.SubmitChanges();
                opcion = 1;
            }
            catch (Exception e)
            {
                MessageBox.Show("Error: " + e);
                opcion = 2;
            }
            return opcion;
        }

        public static int editarUsuario(string id, string nombre, string apellido, string telefono, string direccion, string correo, int tipoDocumento)
        {
            //MessageBox.Show($"id = {id}\nnombre = {nombre}");
            DatosDataContext dc = new DatosDataContext();
            UsuarioDb udb = dc.UsuarioDb.Where(u => u.id == id).Select(u => u).First();
            int opcion = 0;

            udb.id = id;
            udb.nombre = nombre;
            udb.apellido = apellido;
            udb.telefono = telefono;
            udb.direccion = direccion;
            udb.correo = correo;
            udb.idTipoDocumento = tipoDocumento;

            try
            {
                dc.SubmitChanges();
                opcion = 1;
            }
            catch (Exception e)
            {
                MessageBox.Show("Error: " + e);
                opcion = 2;
            }
            return opcion;
        }

        public static int editarAsignatura(int id, string nombre)
        {
            DatosDataContext dc = new DatosDataContext();
            bool asigExiste = Admin.validarExistenciaAsignatura(nombre);
            Asignatura asig = dc.Asignatura.Where(a => a.id == id).Select(a => a).First();
            int opcion = 0;

            if (!asigExiste)
            {
                asig.materia = nombre;

                try
                {
                    dc.SubmitChanges();
                    opcion = 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show("Error: " + e);
                    opcion = 2;
                }
            }
            else
            {
                opcion = 3;
            }

            return opcion;

        }

        public static int editarCurso(string curso, string cursoN)
        {
            DatosDataContext dc = new DatosDataContext();
            Curso cu = dc.Curso.Where(c => c.curso1 == curso).Select(c => c).First();
            bool res = Admin.validarExistenciaCurso(cursoN);
            int opcion = 0;

            if (!res)
            {
                cu.curso1 = cursoN;
                try
                {
                    dc.SubmitChanges();
                    opcion = 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show("Error: " + e);
                    opcion = 2;
                }
            }
            else
            {
                opcion = 3;
            }
            return opcion;
        }

        public static int editarCursoAsignatura(string docente, int asignatura, int idCurso)
        {
            DatosDataContext dc = new DatosDataContext();
            CursoAsignatura casig = dc.CursoAsignatura.Where(ca => ca.idDocente == docente && ca.idAsignatura == asignatura).Select(ca=>ca).First();
            int opcion = 0;
            bool res = Admin.validarAsignaturaExisteEnCurso(idCurso, asignatura);

            if (!res)
            {
                casig.idCurso = idCurso;

                try
                {
                    dc.SubmitChanges();
                    opcion = 1;
                }
                catch (Exception e)
                {
                    
                }
            }
            else
            {
                opcion = 3;
            }

            return opcion;
        }


        /*=======================================  END METODOS DE EDITAR  ========================================*/






        /*========================================  METODOS DE ELIMINAR  =========================================*/


        public static bool eliminarAlumno(string id)
        {
            DatosDataContext dc = new DatosDataContext();
            bool res = true;

            Alumno al = dc.Alumno.Where(a => a.id == id).Select(a => a).First();

            try
            {
                if (al != null)
                {
                    dc.Alumno.DeleteOnSubmit(al);
                    dc.SubmitChanges();
                }
            }
            catch (Exception e)
            {
                MessageBox.Show("Error al eliminar " + e);
                res = false;
            }
            return res;
        }

        public static bool eliminarUsuario(string id)
        {
            DatosDataContext dc = new DatosDataContext();
            bool res = true;
            UsuarioDb udb = Admin.buscarUsuarioPorid(id);

            try
            {
                if (udb != null)
                {
                    dc.UsuarioDb.DeleteOnSubmit(udb);
                    dc.SubmitChanges();
                }
            }
            catch (Exception e)
            {
                MessageBox.Show("Error al eliminar " + e);
                res = false;
            }
            return res;
        }

        public static int eliminarAsignatura(int id)
        {
            DatosDataContext dc = new DatosDataContext();
            bool asigVinculada = Admin.validarAignaturaEstaVinculadaDocente(id);
            Asignatura asg = dc.Asignatura.Where(a => a.id == id).Select(a => a).First();
            int opcion = 0;

            if (!asigVinculada)
            {
                try
                {
                    if (asg != null)
                    {
                        dc.Asignatura.DeleteOnSubmit(asg);
                        dc.SubmitChanges();
                        opcion = 1;
                    }
                }
                catch (Exception e)
                {
                    opcion = 2;
                }
            }
            else
            {
                opcion = 3;
            }
            return opcion;
        }

        public static int eliminarCursoAsignatura(int idCurso)
        {
            //MessageBox.Show($"id curso el cu asi admin {idCurso}");
            DatosDataContext dc = new DatosDataContext();
            int opcion = 0;

            bool res = Admin.validarCursoAsignatura(idCurso);

            if (res)
            {
                //MessageBox.Show($"encontro asignatura en curso = {idCurso}");
                var query = from ca in dc.CursoAsignatura
                            where ca.idCurso == idCurso
                            select ca;
                foreach (var item in query)
                {
                    dc.CursoAsignatura.DeleteOnSubmit(item);
                }

                try
                {
                    dc.SubmitChanges();
                    opcion = 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show($"error {e}");
                    opcion = 2;
                }
            }
               
            return opcion;
        }

        public static int eliminarAlumnoCurso(int idCurso)
        {
            DatosDataContext dc = new DatosDataContext();
            int opcion = 0;
            var query = dc.AlumnoCurso.Where(ac => ac.idCurso == idCurso).Select(ac => ac);
            bool res = Admin.validarAlumnoCurso(idCurso);

            if (res)
            {
                foreach (var item in query)
                {
                    dc.AlumnoCurso.DeleteOnSubmit(item);
                }

                try
                {
                    dc.SubmitChanges();
                    opcion = 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show($"error {e}");
                    opcion = 2;
                }
            }           
            return opcion;            
        }

        public static bool eliminarCurso(int idCurso)
        {
            DatosDataContext dc = new DatosDataContext();
            Curso cu = dc.Curso.Where(c => c.id == idCurso).Select(c => c).First();
            bool res = true;

            try
            {
                dc.Curso.DeleteOnSubmit(cu);
                dc.SubmitChanges();
            }
            catch (Exception e)
            {
                MessageBox.Show("Error al eliminar " + e);
                res = false;
            }
            return res;
        }




        /*========================================  END METODOS DE ELIMINAR  =========================================*/





        /*========================================  CREAR EVIDENCIAS  =========================================*/

        public static List<string> idAlumnos(int idCurso)
        {
            //MessageBox.Show($"idAlumnos id curso admin = {idCurso}");
            DatosDataContext dc = new DatosDataContext();
            var query = (dc.AlumnoCurso.Where(ac => ac.idCurso == idCurso).Select(ac => ac.idAlumno)).ToList();

            //foreach (var item in query)
            //{
            //    MessageBox.Show($"id = {item}");
            //}
            return query;
        }

        public static int registrarEvidenciaAlumnos(int idEvidencia, List<string> alumnos)
        {
            DatosDataContext dc = new DatosDataContext();            
            int opcion = 0;

            foreach (var item in alumnos)
            {
                AlumnoEvidencia aev = new AlumnoEvidencia();
                aev.idEvidencia = idEvidencia;
                aev.idAlumno = item;

                try
                {
                    dc.AlumnoEvidencia.InsertOnSubmit(aev);
                    dc.SubmitChanges();
                    opcion = 1;
                }
                catch (Exception e)
                {
                    MessageBox.Show($"Error {e}");
                    opcion = 2;
                }
            }
            return opcion;
        }

        public static int ultimoRegistro()
        {
            DatosDataContext dc = new DatosDataContext();
            //Evidencia ev = dc.Evidencia.OrderByDescending(e => e.id).FirstOrDefault();
            int ultimoRegistro = dc.Evidencia.OrderByDescending(e => e.id).FirstOrDefault().id;
            return ultimoRegistro;
        }

        public static int obtenerIdCurso(string curso)
        {
            //MessageBox.Show("Test");
            int idCurso = 0;
            try
            {
                //MessageBox.Show("obtenerIdCurso = "+curso);
                DatosDataContext dc = new DatosDataContext();
                idCurso = dc.Curso.Where(c => c.curso1 == curso).Select(c => c).First().id;
                //MessageBox.Show($"id curso obtenerIdCurso = {idCurso}");
                
            }
            catch (Exception)
            {

            }
            return idCurso;
        }

        public static object listarEvidenciasPorDocente(string idDocente )
        {
            DatosDataContext dc = new DatosDataContext();
            var query = ((from e in dc.Evidencia
                        join a in dc.Asignatura
                        on e.idAsignatura equals a.id
                        join ca in dc.CursoAsignatura
                        on a.id equals ca.idAsignatura
                        join u in dc.UsuarioDb
                        on ca.idDocente equals u.id                        
                        select new
                        {
                            id = e.id, descripcion = e.descripcion, fecha = e.fecha
                        }).Distinct()).OrderByDescending(e=>e.id);
            return query;
        }

        public static object evidenciasPorDocenteyCurso(int idCurso, string idDocente, int idAsignatura)
        {
            //MessageBox.Show($"evidenciasPorDocenteyCurso\nid curso = {idCurso}\nid docente = {idDocente}\nid asignatura = {idAsignatura}");
            DatosDataContext dc = new DatosDataContext();
            var query = ((from a in dc.Alumno
                         join ac in dc.AlumnoCurso on a.id equals ac.idAlumno
                         join c in dc.Curso on ac.idCurso equals c.id
                         join ae in dc.AlumnoEvidencia on a.id equals ae.idAlumno
                         join e in dc.Evidencia on ae.idEvidencia equals e.id
                         join asi in dc.Asignatura on e.idAsignatura equals asi.id
                         join ca in dc.CursoAsignatura on c.id equals ca.idCurso
                         where c.id == idCurso && ca.idDocente == idDocente && asi.id == idAsignatura
                         select new
                         {
                             id = ae.idEvidencia,
                             descripcion = e.descripcion,
                             fecha = e.fecha
                         }).Distinct()).OrderByDescending(e=>e.id);
            return query;
        }


        public static object evidenciasPorAlumnoCurso(string curso, string idDocente, int idAsignatura)
        {
            //MessageBox.Show($"evidenciasPorDocenteyCurso\nid curso = {idCurso}\nid docente = {idDocente}\nid asignatura = {idAsignatura}");
            DatosDataContext dc = new DatosDataContext();
            var query = ((from a in dc.Alumno
                          join ac in dc.AlumnoCurso on a.id equals ac.idAlumno
                          join c in dc.Curso on ac.idCurso equals c.id
                          join ae in dc.AlumnoEvidencia on a.id equals ae.idAlumno
                          join e in dc.Evidencia on ae.idEvidencia equals e.id
                          join asi in dc.Asignatura on e.idAsignatura equals asi.id
                          join ca in dc.CursoAsignatura on c.id equals ca.idCurso
                          where c.curso1 == curso && ca.idDocente == idDocente && asi.id == idAsignatura
                          select new
                          {
                              id = ae.idEvidencia,
                              descripcion = e.descripcion,
                              fecha = e.fecha
                          }).Distinct()).OrderByDescending(e => e.id);
            return query;
        }

        /*========================================  END CREAR EVIDENCIAS  =========================================*/


        public static object listarEvidenciasPorCurso(int idCurso, string idDocente)
        {
            DatosDataContext dc = new DatosDataContext();
            var query = (from e in dc.Evidencia
                        join ae in dc.AlumnoEvidencia on e.id equals ae.idEvidencia
                        join a in dc.Alumno on ae.idAlumno equals a.id
                        join ac in dc.AlumnoCurso on a.id equals ac.idAlumno
                        join c in dc.Curso on ac.idCurso equals c.id
                        join ca in dc.CursoAsignatura on c.id equals ca.idCurso
                        where ca.idCurso == idCurso && ca.idDocente == idDocente
                        select new
                        {
                            idEvidencia = e.id,
                            descripcion = e.descripcion,
                        }).Distinct();
            return query;
            
        }


        public static object listarAlumnosPorEvidencia(int idEvidencia)
        {
            //MessageBox.Show($"admin listarAlumnosPorEvidencia = {idEvidencia}");
            DatosDataContext dc = new DatosDataContext();
            var query = from ae in dc.AlumnoEvidencia
                        join a in dc.Alumno
                        on ae.idAlumno equals a.id
                        where ae.idEvidencia == idEvidencia
                        orderby(a.apellido)
                        select new
                        {
                            identificacion = a.id,
                            nota = ae.nota,
                            nombre = a.apellido+" "+a.nombre,
                        };
            return query;                      
                        
        }


        public static int actualizarNotas(string idAlumno, decimal nota, int idEvidencia)
        {
            //MessageBox.Show($"actualizarNotas\nid alumno = {idAlumno}\nnota = {nota}\nid evidencia = {idEvidencia}");
            DatosDataContext dc = new DatosDataContext();
            AlumnoEvidencia aev = dc.AlumnoEvidencia.Where(ae => ae.idAlumno == idAlumno && ae.idEvidencia == idEvidencia).Select(ae => ae).First();
            int opcion = 0;

            aev.nota = nota;

            try
            {
                dc.SubmitChanges();
                opcion = 1;
            }
            catch (Exception e)
            {
                MessageBox.Show("Error: " + e);
                opcion = 2;
            }
            return opcion;
        }




        /*===========================================================  AREA DOCENTE  ===========================================================================*/


        public static List<string> idAlumnoPorAcudiente(string idAcudiente)
        {
            DatosDataContext dc = new DatosDataContext();
            var query = (from a in dc.Alumno
                        join u in dc.UsuarioDb
                        on a.idAcudiente equals u.id
                        where u.id == idAcudiente
                        select a.id).ToList();

            //foreach (var item in query)
            //{
            //    MessageBox.Show($"id alumno = {item}");
            //}

            return query;
        }

        public static Alumno informacionAlumno(string idAlumno)
        {
            DatosDataContext dc = new DatosDataContext();
            Alumno al = dc.Alumno.Where(a => a.id == idAlumno).Select(a => a).First();
            return al;
        }

        public static string curso(string idAlumno)
        {
            //MessageBox.Show("id alumno admin = "+idAlumno);
            DatosDataContext dc = new DatosDataContext();
            string dato="";
            var query = from ac in dc.AlumnoCurso
                        join c in dc.Curso
                        on ac.idCurso equals c.id
                        where ac.idAlumno == idAlumno
                        select c.curso1;

            if (query.Count()>0)
            {
                dato = query.First();
            }
            //MessageBox.Show($"curso dato admin = {dato}");
            return dato;                        
        }

        public static UsuarioDb informacionAcudiente(string idAcudiente)
        {
            DatosDataContext dc = new DatosDataContext();
            UsuarioDb us = dc.UsuarioDb.Where(u => u.id == idAcudiente).Select(u => u).First();
            return us;
        }
       
        public static List<int> idEvidencias(string idAlumno)
        {
            DatosDataContext dc = new DatosDataContext();
            var query = ((from ae in dc.AlumnoEvidencia
                         join e in dc.Evidencia
                         on ae.idEvidencia equals e.id
                         where ae.idAlumno == idAlumno
                         select e.idAsignatura).Distinct()).ToList();
            return query;
        }

        public static object listarEvidenciasPorAlumno(string idAlumno)
        {
            DatosDataContext dc = new DatosDataContext();
            var query = from ae in dc.AlumnoEvidencia
                        join e in dc.Evidencia
                        on ae.idEvidencia equals e.id
                        join a in dc.Asignatura
                        on e.idAsignatura equals a.id
                        where ae.idAlumno == idAlumno && ae.nota != 0
                        select new
                        {
                            asignatura = a.materia,
                            evidencia = e.descripcion,
                            nota = ae.nota
                        };
            return query;
        }

        public static bool actualizarPassAdmin(string idAcudiente, string passNuevo)
        {
            DatosDataContext dc = new DatosDataContext();
            UsuarioDb us = dc.UsuarioDb.Where(u => u.id == idAcudiente).Select(u => u).First();
            bool res = false;

            us.pass = passNuevo;

            try
            {
                dc.SubmitChanges();
                res = true;
            }
            catch (Exception e)
            {
                MessageBox.Show("Error: " + e);
            }
            return res;

        }

        /*==============================================  END AREA DOCENTE ===================================================*/



        /*=================================================  CONTADORES ======================================================*/

        public static int contarAlumnos()
        {
            DatosDataContext dc = new DatosDataContext();
            int qAlumnos = dc.Alumno.Select(a => a).Count();
            return qAlumnos;
        }

        public static int conteoDocentes()
        {
            DatosDataContext dc = new DatosDataContext();
            int qDocentes = dc.UsuarioDb.Where(u => u.idRol.Equals(2)).Select(u => u).Count();
            return qDocentes;
        }

        public static int conteoPendientes()
        {
            DatosDataContext dc = new DatosDataContext();
            int qPendientes = dc.Alumno.Where(a => a.Estado.Equals(3)).Select(a => a).Count();
            return qPendientes;
        }

        public static double promedioAlto()
        {
            DatosDataContext dc = new DatosDataContext();
            int promedioBajo = dc.AlumnoEvidencia.Where(ae => ae.nota > 0 && ae.nota < 3).Select(ae => ae).Count();
            int promedioAlto = dc.AlumnoEvidencia.Where(ae => ae.nota>3).Select(ae => ae).Count();
                       
            double promedio1 = 100/(promedioBajo + promedioAlto);
            double promedio2 = promedio1 * promedioAlto;
            //MessageBox.Show($"PA = {promedioAlto}\nPB = {promedioBajo}\nprom1 = {promedio1}\nprom2 = {promedio2}");
            return promedio2;

        }
        

        /*===============================================  END CONTADORES ====================================================*/


    }
}
