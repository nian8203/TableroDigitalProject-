using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ModeloV2;

namespace TableroDigitalV2.pages.admin
{
    public partial class curso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            validarSession();
            if (!Page.IsPostBack)
            {
                listarCursosGv();
                cargarFecha();
                cargarNombre();
                lbEditarCurso.Visible = false;
                seleccionId.Visible = false;
                cursoId.Visible = true;
                asignaturasId.Visible = false;
                alumnosId.Visible = false;
                agregarDocentesId.Visible = false;
            }
            
        }

        private void validarSession()
        {
            if (Session["usuarioEncontrado"] == null)
            {
                Response.Redirect("../../../principal.aspx");
            }
        }

        private void cargarNombre()
        {
            string usuarioEnSesion = Session["usuarioEncontrado"].ToString();
            UsuarioDb u = Admin.buscarUsuarioPorid(usuarioEnSesion);
            string nombre = u.nombre;
            //MessageBox.Show("Nombre user = " + nombre + "user session = " + usuarioEnSesion);
            lblNombre.Text = nombre;
        }

        private void cargarFecha()
        {
            lblFechaAlumno.Text = DateTime.Now.ToString("yyyy");
            lblFechaAsignatura.Text = DateTime.Now.ToString("yyyy");
            lblFechaCurso.Text = DateTime.Now.ToString("yyyy");
        }

        protected void lbEditarCurso_Click(object sender, EventArgs e)
        {            
            editarCursoAsp();
            listarCursosGv();
            txtCurso.Text = string.Empty;
            txtCurso.Focus();
            lbEditarCurso.Visible = false;
            lbCrearCurso.Visible = true;
        }
        protected void lbCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            HttpContext.Current.Response.Redirect("../../../principal.aspx", true);
            Response.Redirect("../../../principal.aspx");
        }

        protected void lbCrearCurso_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                registrarCurso();
                txtCurso.Text = string.Empty;
                txtCurso.Focus();
                listarCursosGv();
            }
        }

        protected void lbAgrearDocenteaCurso_Click(object sender, EventArgs e)
        {
            int idCurso = int.Parse(hfIdCurso.Value);
            //MessageBox.Show($"id curso btn agregar docente = {idCurso}");
            agregarDocentesId.Visible = true;
            listarDocentesGv();
        }

        protected void gvListarCursos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int indice = Convert.ToInt32(e.CommandArgument);
            GridViewRow fila = gvListarCursos.Rows[indice];
            //int idCurso = int.Parse(fila.Cells[0].Text);
            string curso = fila.Cells[1].Text;
            hfDocumento.Value = curso.ToString();
            //hfIdCurso.Value = idCurso.ToString();

            if (e.CommandName == "editar")
            {
                lbEditarCurso.Visible = true;
                lbCrearCurso.Visible = false;
                //MessageBox.Show($"id = {curso}");
                txtCurso.Text = curso;
            }
            else if (e.CommandName == "eliminar")
            {
                //gvListarCursos.SelectedDataKey(fila);
                //MessageBox.Show($"id curso = {idCurso}");
                int index = int.Parse(e.CommandArgument.ToString());
                int idGv = int.Parse(gvListarCursos.DataKeys[index].Value.ToString());
                hfIdCurso.Value = idGv.ToString();
                //MessageBox.Show($"Id curso CommandName = {idGv}");
                int opcion = Admin.eliminarCursoAsignatura(idGv);
                int opcAc = Admin.eliminarAlumnoCurso(idGv);
                bool eliminarCurso = Admin.eliminarCurso(idGv)
                    ;
                if (opcion==1 || opcAc==1)
                {
                    if (eliminarCurso)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "eliminar()", true);
                        //Response.Write("<script>alert(" + "'Curso eliminado con éxito'" + ")</script>");
                        listarCursosGv();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                        //Response.Write("<script>alert(" + "'Error al eliminar el registro'" + ")</script>");
                    }

                }
                else if (opcion==2 || opcAc ==2)
                {
                    MessageBox.Show("error al eliminar");
                }
                else
                {
                    if (eliminarCurso)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "eliminar()", true);
                        //Response.Write("<script>alert(" + "'Curso eliminado con éxito'" + ")</script>");
                        listarCursosGv();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                        //Response.Write("<script>alert(" + "'Error al eliminar el registro'" + ")</script>");
                    }
                }

            }            
            else if (e.CommandName=="alumnos")
            {
                lblCursoAlumno.Text = curso;
                cursoId.Visible = false;
                asignaturasId.Visible = false;
                alumnosId.Visible = true;
                int index = int.Parse(e.CommandArgument.ToString());
                int idGv = int.Parse(gvListarCursos.DataKeys[index].Value.ToString());
                //MessageBox.Show($"Test {idGv}");
                gvListarAlumnos.DataSource = null;
                gvListarAlumnos.DataBind();
                gvListarAlumnos.DataSource = Admin.listarAlumnosPorCurso(idGv);
                gvListarAlumnos.DataBind();
            }
            else if (e.CommandName== "asignaturas")
            {
                lblCursoAsignatura.Text = curso;
                asignaturasId.Visible = true;
                cursoId.Visible = false;
                alumnosId.Visible = false;
                int index = int.Parse(e.CommandArgument.ToString());
                int idGv = int.Parse(gvListarCursos.DataKeys[index].Values[0].ToString());
                string materia = hfMateria.Value;
                hfIdCurso.Value = idGv.ToString();

                //MessageBox.Show($"id cursos row command  {idGv}\nmateria = {materia}");
                listarAsignaturasPorCursoGv();
               
            }
        }

        protected void gvListarDocentes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName=="agregar")
                {
                    //int indice = Convert.ToInt32(e.CommandArgument);
                    //GridViewRow fila = gvListarDocentes.Rows[indice];
                    //string asig = fila.Cells[0].Text;
                    //string docente = fila.Cells[1].Text;
                    //int idCurso = int.Parse(hfDocumento.Value);
                    int index = int.Parse(e.CommandArgument.ToString());
                    string docente = gvListarDocentes.DataKeys[index].Values[0].ToString();
                    int asig = int.Parse(gvListarDocentes.DataKeys[index].Values[1].ToString());
                    hfMateria.Value = asig.ToString();
                    hfIdDocente.Value = docente;
                    int idCurso = int.Parse(hfIdCurso.Value);

                    //MessageBox.Show($"seleccion = {asig}");
                    listarDocentesGv();
                    listarAsignaturasPorCursoGv();
                    registrarAsinaturaEnCurso();
                    
                   
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("error"+ex);
            }
        }


        /*=========================================  METODOS DE LISTAR  ======================================*/

        private void listarCursosGv()
        {
            gvListarCursos.DataSource = null;
            gvListarCursos.DataBind();
            gvListarCursos.DataSource = Admin.listarCurso();
            gvListarCursos.DataBind();
        }


        private void listarDocentesGv()
        {
            int idCurso = int.Parse(hfIdCurso.Value);
            //MessageBox.Show($"listarDocentesGv = {idCurso}");
            gvListarDocentes.DataSource = null;
            gvListarDocentes.DataBind();
            //gvListarDocentes.DataSource = Admin.listarDocentesAgregaraCurso(idCurso); 
            gvListarDocentes.DataSource = Admin.listarAsignaturasNoExistentesenCurso(idCurso);
            gvListarDocentes.DataBind();
        }

        private void listarAsignaturasPorCursoGv()
        {
            int idCurso = int.Parse(hfIdCurso.Value);
            gvListarAsignturas.DataSource = null;
            gvListarAsignturas.DataBind();
            gvListarAsignturas.DataSource = Admin.listarAsignaturasPorCurso(idCurso);
            gvListarAsignturas.DataBind();
        }

       
       

        /*======================================  END METODOS DE LISTAR  =====================================*/




        /*========================================  METODOS DE REGISTRO  =======================================*/

        private void registrarCurso()
        {
            string curso = txtCurso.Text.Trim().ToUpper();
            int opcion = Admin.registrarCurso(curso);

            if (opcion == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "agregar()", true);
                //Response.Write("<script>alert(" + "'Curso registrado con éxito'" + ")</script>");
            }
            else if (opcion == 2)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                // Response.Write("<script>alert(" + "'Error al registrar curso'" + ")</script>");
            }
            else if (opcion == 3)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "existe()", true);
                //Response.Write("<script>alert(" + "'El curso ya se encuentra registrado'" + ")</script>");
            }
        }

        private void registrarAsinaturaEnCurso()
        {
            int idAsignatura = int.Parse(hfMateria.Value);
            int idCurso = int.Parse(hfIdCurso.Value);
            string idDocente = hfIdDocente.Value;
            string salon = hfDocumento.Value;
            //MessageBox.Show($"id asig metodo reg asig aspx = {idAsignatura}\nid curso = {idCurso}\nid docente = {idDocente}");

            bool asigEncontrada = Admin.validarAsignaturaExisteEnCurso(idCurso, idAsignatura);

            if (!asigEncontrada)
            {
                //Response.Write("<script>alert(" + "'La asignatura no esta vinculada al curso'" + ")</script>");
                int opcion = Admin.registrarAsignaturaEnCurso(idCurso, idAsignatura, idDocente);

                if (opcion==1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "agregar()", true);
                    //Response.Write("<script>alert(" + "'La asignatura se ha vinculado exitosamente al curso'" + ")</script>");
                    listarAsignaturasPorCursoGv();
                    listarDocentesGv();                    
                }
                else if (opcion==2)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                    //Response.Write("<script>alert(" + "'Error al registrar el usuario'" + ")</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "existe()", true);
                //Response.Write("<script>alert(" + "'La asignatura ya se encuentra vinculada al curso'" + ")</script>");
            }
        }

        /*======================================  END METODOS DE REGISTRO  =====================================*/




        /*========================================  METODOS DE EDITAR  ======================================*/

        private void editarCursoAsp()
        {
            string curso = hfDocumento.Value;
            string cursoN = txtCurso.Text.Trim().ToUpper();
            int opcion = Admin.editarCurso(curso, cursoN);

            if (opcion == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "actualizar()", true);
                //Response.Write("<script>alert(" + "'Registro actualizado con éxito'" + ")</script>");
            }
            else if (opcion == 2)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                //Response.Write("<script>alert(" + "'Error al registrar curso'" + ")</script>");
            }
            else if (opcion == 3)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "existe()", true);
                //Response.Write("<script>alert(" + "'El curso ya se encuentra registrado'" + ")</script>");
            }
        }

        protected void gvListarCursos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //    e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Right;

           
        }

       




        /*======================================  END METODOS DE EDITAR  =====================================*/




        /*========================================  METODOS DE ELIMINAR  =====================================*/



        /*========================================  METODOS DE ELIMINAR  =====================================*/


    }
}