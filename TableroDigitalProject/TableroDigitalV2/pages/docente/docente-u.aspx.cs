using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ModeloV2;
using TextBox = System.Web.UI.WebControls.TextBox;

namespace TableroDigitalV2.pages.docente
{
    public partial class docente1 : System.Web.UI.Page
    {
        //int idCurso = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            validarSession();
            if (!Page.IsPostBack)
            {
                //hfIdDocente.Value = "7896899665";
                //int idCurso = int.Parse(hfIdCurso.Value);
                hfIdCurso.Value = string.Empty;
                cargarNombre();
                cargarFecha();
                //editarId.Visible = false;
                registrarId.Visible = false;
                evidenciaId.Visible = false;
                card1.Visible = false;
                card2.Visible = false;
                card3.Visible = false;
                card4.Visible = false;
                card5.Visible = false;
                card6.Visible = false;
                cargarListadoCursos();
                //listarEvidenciasPorDocente(idCurso);
            }


        }


        private void validarSession()
        {
            if (Session["usuarioEncontrado"] == null)
            {
                Response.Redirect("../../principal.aspx");
            }
        }

        private void cargarNombre()
        {
            string usuarioEnSesion = Session["usuarioEncontrado"].ToString();
            UsuarioDb u = Admin.buscarUsuarioPorid(usuarioEnSesion);
            string nombre = u.nombre;
            lblNombre.Text = nombre;
            hfIdDocente.Value = u.id;
            //MessageBox.Show($"id docente cargar nombre = {u.id}");
        }

        private void cargarFecha()
        {
            //lblEditFecha.Text = DateTime.Now.ToString("yyyy");
            lblListFecha.Text = DateTime.Now.ToString("yyyy");
            lblRegistrofecha.Text = DateTime.Now.ToString("yyyy");
        }

        protected void lbCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            HttpContext.Current.Response.Redirect("../../principal.aspx", true);
            Response.Redirect("../../principal.aspx");
        }

        protected void lbActualizarDatos_Click(object sender, EventArgs e)
        {

        }

        protected void gvListarAlumnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }




        private void cargarListadoCursos()
        {
            //string id = "7896899665";
            string idDocente = hfIdDocente.Value;
            //MessageBox.Show("cargarListadoCursos = "+idDocente);
            List<string> cursos = Admin.listarCursosPorDocente(idDocente);
            //foreach (var item in cursos)
            //{
            //    MessageBox.Show($"cursos = {item}");
            //}


            if ((cursos.Count()) == 1)
            {
                card1.Visible = true;
                lblCurso1.Text = cursos[0];
            }
            else if ((cursos.Count()) == 2)
            {
                card1.Visible = true;
                card2.Visible = true;
                lblCurso1.Text = cursos[0];
                lblCurso2.Text = cursos[1];
            }
            else if ((cursos.Count()) == 3)
            {
                card1.Visible = true;
                card2.Visible = true;
                card3.Visible = true;
                lblCurso1.Text = cursos[0];
                lblCurso2.Text = cursos[1];
                lblCurso3.Text = cursos[2];
            }
        }


        /*=========================== BOTONES CREAR EVIDENCIA ===========================================*/
        protected void crearEviencia1_Click(object sender, EventArgs e)
        {
            string curso = lblCurso1.Text.Trim();
            lblCursoCrearEvidencia.Text = curso;
            hfNombreCurso.Value = curso;
            mostrarEvidencia();
            listarEvidenciasPorDocente(curso);
           
           
        }

        protected void crearEviencia2_Click(object sender, EventArgs e)
        {
            string curso = lblCurso2.Text.Trim();
            lblCursoCrearEvidencia.Text = curso;
            hfNombreCurso.Value = curso;
            mostrarEvidencia();
            listarEvidenciasPorDocente(curso);
            
        }

        protected void crearEviencia3_Click(object sender, EventArgs e)
        {
            string curso = lblCurso3.Text.Trim();
            lblCursoCrearEvidencia.Text = curso;
            hfNombreCurso.Value = curso;
            mostrarEvidencia();
            listarEvidenciasPorDocente(curso);
        }

        protected void crearEviencia4_Click(object sender, EventArgs e)
        {
            string curso = lblCurso4.Text.Trim();
            lblCursoCrearEvidencia.Text = curso;
            hfNombreCurso.Value = curso;
            mostrarEvidencia();
            listarEvidenciasPorDocente(curso);
        }

        protected void crearEviencia5_Click(object sender, EventArgs e)
        {
            string curso = lblCurso5.Text.Trim();
            lblCursoCrearEvidencia.Text = curso;
            lblCursoCrearEvidencia.Text = curso;
            hfNombreCurso.Value = curso;
            mostrarEvidencia();
            listarEvidenciasPorDocente(curso);
        }

        protected void crearEviencia6_Click(object sender, EventArgs e)
        {
            
        }

        protected void lbCrearEvidencia_Click(object sender, EventArgs e)
        {
            
            string curso = hfNombreCurso.Value;
            crearEvidencia();
            listarEvidenciasPorDocente(curso);
        }

        /*=========================== END BOTONES CREAR EVIDENCIA ===========================================*/




        /*=========================== FUNCIONES CREAR EVIDENCIA ===========================================*/
        private void mostrarEvidencia()
        {
            evidenciaId.Visible = true;
            registrarId.Visible = false;
            //editarId.Visible = false;
            listarId.Visible = false;
        }


        private void crearEvidencia()
        {
            /*================datos crear evidencia============================*/
            string idDocente = hfIdDocente.Value;
            CursoAsignatura ca = Admin.buscarAsigDeDocente(idDocente);
            int idAsignatura = ca.idAsignatura;
            string descripcion = txtDescripcion.Text.Trim().ToLower();

            int opcionCrearEvidencia = Admin.registrarEvidencia(descripcion, idAsignatura);


            string curso = hfNombreCurso.Value;
            int idCurso = Admin.obtenerIdCurso(curso);
            int idEvidencia = Admin.ultimoRegistro();
            List<string> idAlumno = Admin.idAlumnos(idCurso);            

            int opcionAsigEvidenciaEstudiantes = Admin.registrarEvidenciaAlumnos(idEvidencia, idAlumno);

            //string curso = hfNombreCurso.Value;


            if (opcionAsigEvidenciaEstudiantes == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "notiAlert()", true);
                //Response.Write("<script>alert(" + "'Evidencia creada con exito'" + ")</script>");
                //listarEvidenciasPorDocente(idCurso, idDocente, idAsignatura);    /*-------------------------------cambios 20/06/2021 1150----------------------------*/
                listarEvidenciasPorDocente(curso);    /*-------------------------------cambios 20/06/2021 1150----------------------------*/
                txtDescripcion.Text = string.Empty;
                txtDescripcion.Focus();
            }
            else if (opcionAsigEvidenciaEstudiantes == 2)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                //Response.Write("<script>alert(" + "'Error al crear la evidencia'" + ")</script>");
                txtDescripcion.Text = String.Empty;
                txtDescripcion.Focus();
            }
        }


        private void listarEvidenciasPorDocente(string curso)
        {
            string idDocente = hfIdDocente.Value; /*-------------------------------cambios 20/06/2021 1150----------------------------*/
            CursoAsignatura ca = Admin.buscarAsigDeDocente(idDocente); /*-------------------------------cambios 20/06/2021 1150----------------------------*/
            int idAsignatura = ca.idAsignatura; /*-------------------------------cambios 20/06/2021 1150----------------------------*/


            gvListarEvidencias.DataSource = null;
            gvListarEvidencias.DataBind();
            gvListarEvidencias.DataSource = Admin.evidenciasPorAlumnoCurso(curso, idDocente, idAsignatura); /// listado de evidencias -----------------------------
            //gvListarEvidencias.DataSource = Admin.listarEvidenciasPorDocente(idDocente); /// listado de evidencias -----------------------------
            //gvListarEvidencias.DataSource = Admin.listarEvidenciasPorCurso(idCurso, idDocente); /// listado de evidencias -----------------------------
            gvListarEvidencias.DataBind();
        }

        protected void gvListarEvidencias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                int idCurso = int.Parse(hfIdCurso.Value);
                string curso = hfNombreCurso.Value;
                gvListarEvidencias.PageIndex = e.NewPageIndex;
                gvListarEvidencias.DataBind();
                listarEvidenciasPorDocente(curso);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex);
            }
        }

        /*======================================================== FUNCIONES CREAR EVIDENCIA =======================================================================*/



        /*================================ BOTONES CREAR EVIDENCIA ===========================================*/
        protected void regNotas1_Click(object sender, EventArgs e)
        {
            listarId.Visible = false;
            registrarId.Visible = true;
            string curso = lblCurso1.Text.Trim().ToLower();
            hfIdCurso.Value = Admin.obtenerIdCurso(curso).ToString();
            int idCurso = int.Parse(hfIdCurso.Value);
            listarEvidenciasId.Visible = true;
            listarAlumnosPorCursoId.Visible = false;
            listarEvidenciasPorCursoGv(idCurso);
            //MessageBox.Show($"regNotas1_Click\nid curso = {idCurso}");
            lblCursoCard.Text = curso;
        }

        protected void regNotas2_Click(object sender, EventArgs e)
        {
            listarId.Visible = false;
            registrarId.Visible = true;
            string curso = lblCurso2.Text.Trim().ToLower();
            hfIdCurso.Value = Admin.obtenerIdCurso(curso).ToString();
            int idCurso = int.Parse(hfIdCurso.Value);
            listarEvidenciasId.Visible = true;
            listarAlumnosPorCursoId.Visible = false;
            listarEvidenciasPorCursoGv(idCurso);

            //MessageBox.Show($"regNotas1_Click\nid curso = {idCurso}");
            lblCursoCard.Text = curso;
        }

        protected void regNotas3_Click(object sender, EventArgs e)
        {
            listarId.Visible = false;
            registrarId.Visible = true;
            string curso = lblCurso3.Text.Trim().ToLower();
            hfIdCurso.Value = Admin.obtenerIdCurso(curso).ToString();
            int idCurso = int.Parse(hfIdCurso.Value);
            listarEvidenciasId.Visible = true;
            listarAlumnosPorCursoId.Visible = false;
            listarEvidenciasPorCursoGv(idCurso);
            lblCursoCard.Text = curso;

            //MessageBox.Show($"regNotas1_Click\nid curso = {idCurso}");
        }

        protected void regNotas4_Click(object sender, EventArgs e)
        {
            listarId.Visible = false;
            registrarId.Visible = true;
            string curso = lblCurso4.Text.Trim().ToLower();
            hfIdCurso.Value = Admin.obtenerIdCurso(curso).ToString();
            int idCurso = int.Parse(hfIdCurso.Value);
            listarEvidenciasId.Visible = true;
            listarAlumnosPorCursoId.Visible = false;
            listarEvidenciasPorCursoGv(idCurso);
            lblCursoCard.Text = curso;

            //MessageBox.Show($"regNotas1_Click\nid curso = {idCurso}");
        }

        protected void regNotas5_Click(object sender, EventArgs e)
        {
            listarId.Visible = false;
            registrarId.Visible = true;
            string curso = lblCurso5.Text.Trim().ToLower();
            hfIdCurso.Value = Admin.obtenerIdCurso(curso).ToString();
            int idCurso = int.Parse(hfIdCurso.Value);
            listarEvidenciasId.Visible = true;
            listarAlumnosPorCursoId.Visible = false;
            listarEvidenciasPorCursoGv(idCurso);
            lblCursoCard.Text = curso;
        }

        protected void regNotas6_Click(object sender, EventArgs e)
        {
            
        }

        /*=============================== END BOTONES CREAR EVIDENCIA ===========================================*/





        /*====================================== GRIDVIEW REGISTRAR NOTAS ========================================*/

        protected void gvListarEvidencias_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int indice = Convert.ToInt32(e.CommandArgument);
                GridViewRow fila = gvListarEvidencias.Rows[indice];
                int idEvidencia = int.Parse(fila.Cells[0].Text);

                if (e.CommandName == "ver")
                {
                    //MessageBox.Show($"id evidencia = {idEvidencia}");
                    listarAlumnosPorEvidencia(idEvidencia);
                    //MessageBox.Show("Documento = "+documento);
                }
                else if (e.CommandName == "eliminar")
                {

                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Error "+ex);
            }
        }

        protected void gvListarAlumnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int indice = Convert.ToInt32(e.CommandArgument);
                GridViewRow fila = gvListarAlumnos.Rows[indice];
                int idEvidencia = int.Parse(fila.Cells[0].Text.ToLower());
                string descripcion = fila.Cells[1].Text;

                if (e.CommandName == "ver")
                {
                    //MessageBox.Show($"id evidencia = {idEvidencia}");
                    listarAlumnosPorEvidencia(idEvidencia);
                    hfidEvidActualizarNota.Value = idEvidencia.ToString();
                    listarEvidenciasId.Visible = false;
                    listarAlumnosPorCursoId.Visible = true;
                    lblDescripcionEvidencia.Text = descripcion;
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Error "+ex);
            }
        }

        protected void gvListarAlumnosPorEvidencia_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int numFila = ((GridViewRow)((LinkButton)e.CommandSource).Parent.Parent).RowIndex;
            TextBox txtNota = gvListarAlumnosPorEvidencia.Rows[numFila].Cells[1].FindControl("txtNota") as TextBox;
            string idAlumno = (gvListarAlumnosPorEvidencia.Rows[numFila].Cells[2].Text);
            decimal nota = decimal.Parse(txtNota.Text);
            int idEvidencia = int.Parse(hfidEvidActualizarNota.Value);
            int idCurso = int.Parse(hfIdCurso.Value);

            if (e.CommandName == "guardar")
            {
                //MessageBox.Show($"aspx  nota = {nota}\nidentificacion = {idAlumno}\nid Evidencia = {idEvidencia}");
                actualizarNotasAsp(idAlumno, nota, idEvidencia);
               
            }
        }

        protected void gvListarAlumnosPorEvidencia_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        /*====================================== END GRIDVIEW REGISTRAR NOTAS ===================================*/



        private void listarEvidenciasPorCursoGv(int idCurso)
        {
            string idDocente = hfIdDocente.Value; /*-------------------------------cambios 20/06/2021 1150----------------------------*/
            CursoAsignatura ca = Admin.buscarAsigDeDocente(idDocente); /*-------------------------------cambios 20/06/2021 1150----------------------------*/
            int idAsignatura = ca.idAsignatura; /*-------------------------------cambios 20/06/2021 1150----------------------------*/


            hfIdCurso.Value = idCurso.ToString();
            //string curso = lblCurso1.Text.Trim();
            //hfIdCurso.Value = Admin.obtenerIdCurso(curso).ToString();
            //int idCurso = int.Parse(hfIdCurso.Value);

            //MessageBox.Show($"listarEvidenciasPorDocente\nid docente = {idDocente}\nid asignatura = {idAsignatura}\nid curso = {idCurso}");



            //int idCurso = int.Parse(hfIdCurso.Value);
            //string idDocente = hfIdDocente.Value;
            gvListarAlumnos.DataSource = null;
            gvListarAlumnos.DataBind();
            gvListarAlumnos.DataSource = Admin.evidenciasPorDocenteyCurso(idCurso, idDocente, idAsignatura);
            //gvListarAlumnos.DataSource = Admin.listarEvidenciasPorCurso(idCurso, idDocente);
            gvListarAlumnos.DataBind();
        }


        private void listarAlumnosPorEvidencia(int idEvidencia)
        {
            //MessageBox.Show($"listarAlumnosPorEvidencia aspx = {idEvidencia}");
            gvListarAlumnosPorEvidencia.DataSource = null;
            gvListarAlumnosPorEvidencia.DataBind();
            gvListarAlumnosPorEvidencia.DataSource = Admin.listarAlumnosPorEvidencia(idEvidencia);
            gvListarAlumnosPorEvidencia.DataBind();
        }

        private void actualizarNotasAsp(string idAlumno, decimal nota, int idEvidencia)
        {
            int opcion = Admin.actualizarNotas(idAlumno, nota, idEvidencia);

            if (opcion == 1)
            {
                //Response.Write("<script>alert("+"'Nota registrada'"+")</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "agregar()", true);
            }
            else if (opcion==2)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                //Response.Write("<script>alert(" + "'Error de registro'" + ")</script>");
            }
        }

       

        protected void lbNotasEvBc_Click(object sender, EventArgs e)
        {
            listarId.Visible = true;
            registrarId.Visible = false;
            evidenciaId.Visible = false;
        }

        protected void lbCursosNotasBc_Click(object sender, EventArgs e)
        {
            listarId.Visible = true;
            registrarId.Visible = false;
            evidenciaId.Visible = false;
        }
    }
}