using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ModeloV2;

namespace TableroDigitalV2.pages.alumno
{
    public partial class alumno : System.Web.UI.Page
    {
        string documento;
        protected void Page_Load(object sender, EventArgs e)
        {
            validarSession();
            if (!Page.IsPostBack)
            {
                cargarFecha();
                cargarNombre();
                editarId.Visible = false;
                regAlumnoId.Visible = false;
                listarTipoDocumentoDdl();
                listarTipoDocumentoEditDdl();
                listarCursoDdl();
                listarEstadoDdl();
                listarEstadoDdlEdit();
                listarAlumnosGV();
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
            lblFechaFooterEditar.Text = DateTime.Now.ToString("yyyy");
            lblFechaFooterListar.Text = DateTime.Now.ToString("yyyy");
            lblFechaFooterRegistrar.Text = DateTime.Now.ToString("yyyy");
        }

        private void limpiarCampos()
        {
            txtDocumentoAc.Text = string.Empty;
            txtDocumentoAl.Text = string.Empty;
            txtNombreAc.Text = string.Empty;
            txtNombreAl.Text = string.Empty;
            txtApellidoAc.Text = string.Empty;
            txtApellidoAl.Text = string.Empty;
            txtTelefonoAc.Text = string.Empty;
            txtTelefonoAl.Text = string.Empty;
            txtDireccionAc.Text = string.Empty;
            txtDireccionAl.Text = string.Empty;
            txtCorreoAc.Text = string.Empty;
            txtCorreoAl.Text = string.Empty;
            txtValCorreoAc.Text = string.Empty;
            txtPassAc.Text = string.Empty;
            txtValPassAc.Text = string.Empty;
            ddlTipoDocumentoAc.ClearSelection();
            ddlTipoDocumentoAl.ClearSelection();
            ddlEstadoAl.ClearSelection();
        }

        private void limpiarCamposEditar()
        {
            txtIdEdit.Text = string.Empty;
            txtNombreEdit.Text = string.Empty;
            txtApellidoEdit.Text = string.Empty;
            txtTelefonoEdit.Text = string.Empty;
            txtDireccionEdit.Text = string.Empty;
            ddlEstadoEd.ClearSelection();
            ddlTipoEdit.ClearSelection();
        }

        public void llenarCampos()
        {
            
            //MessageBox.Show("Test id alumno = "+documento);
            Alumno a = Admin.buscarAlumnoPorId(documento);
            //MessageBox.Show("nombre = "+a.nombre+"\nTipo doc = "+a.idTipoDocumento+"\nEstado = "+a.idEstado);
            txtIdEdit.Text = a.id;
            txtNombreEdit.Text = a.nombre;
            txtApellidoEdit.Text = a.apellido;
            txtTelefonoEdit.Text = a.telefono;
            txtDireccionEdit.Text = a.direccion;
            txtCorreoEdit.Text = a.correo;
            ddlTipoEdit.ClearSelection();
            ddlEstadoEd.ClearSelection();
            ListItem tipo = ddlTipoEdit.Items.FindByValue(a.idTipoDocumento.ToString());
            ListItem estado = ddlEstadoEd.Items.FindByValue(a.idEstado.ToString());

            if (estado != null)
            {
                estado.Selected = true;
            }
            if (tipo != null)
            {
                tipo.Selected = true;
            }
        }

        public void mostrarEditar()
        {
            editarId.Visible = true;
            regAlumnoId.Visible = false;
            listarId.Visible = false;

        }


        /*===================================  BUTTONS  =========================================*/


        protected void gvListarAlumnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {            

            try
            {
                int indice = Convert.ToInt32(e.CommandArgument);
                GridViewRow fila = gvListarAlumnos.Rows[indice];
                documento = fila.Cells[0].Text;

                if (e.CommandName == "editar")
                {
                    //MessageBox.Show("Documento = "+documento);
                    mostrarEditar();
                    llenarCampos();
                }
                else if (e.CommandName=="eliminar")
                {
                    estadoAlumno(documento);
                    //eliminarAlumno(documento);
                    listarAlumnosGV();
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Error "+ex);
            }
           
        }

        protected void gvListarAlumnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvListarAlumnos.PageIndex = e.NewPageIndex;
                gvListarAlumnos.DataBind();
                listarAlumnosGV();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex);
            }
        }

        protected void gvListarAlumnos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lbCrearAlumno_Click(object sender, EventArgs e)
        {
            listarId.Visible = false;
            editarId.Visible = false;
            regAlumnoId.Visible = true;
        }

        protected void lbRegSiguiente_Click(object sender, EventArgs e)
        {
            listarId.Visible = false;
            editarId.Visible = false;
            //regAlumnoId.Visible = true;
            //regAcudienteId.Visible = true;
        }

        protected void btnCancelarRegistro_Click(object sender, EventArgs e)
        {
            listarId.Visible = true;
            editarId.Visible = false;
            regAlumnoId.Visible = false;
            listarAlumnosGV();
        }

        protected void show_Click(object sender, EventArgs e)
        {
            string idAcudiente = txtDocumentoAc.Text;
            string correo = txtCorreoAc.Text;
            bool acudienteEncontrado = Admin.validarCorreoUsuarioExiste(correo, idAcudiente);

            if (Page.IsValid)
            {
                if (!acudienteEncontrado)
                {
                    registroAcudiente();
                    registroAlumno();
                }
                else
                {
                    registroAlumno();
                }
            }
            else
            {
                Response.Write("<script>alert("+"'Todos los campos son obligatorios'"+")</scipt/>");
            }
           

            //registroAlumnoEnCurso();       

        }

        protected void lbCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            HttpContext.Current.Response.Redirect("../../../principal.aspx", true);
            Response.Redirect("../../../principal.aspx");
        }

        protected void lbBuscarAlumnoPorNombreNavGv_Click(object sender, EventArgs e)
        {
            listarAlumnosPorNombre();
        }

        protected void lbAlumnosReg_Click(object sender, EventArgs e)
        {
            listarId.Visible = true;
            regAlumnoId.Visible = false;
            editarId.Visible = false;
            limpiarCamposEditar();
        }

        protected void lbListarAlumnos_Click(object sender, EventArgs e)
        {
            editarId.Visible = false;
            regAlumnoId.Visible = false;
            listarId.Visible = true;
            listarAlumnosGV();
        }


        /*===================================  END BUTTONS  =========================================*/



        /*=================================  METODOS LISTAR  =========================================*/

        public void listarAlumnosGV()
        {
            gvListarAlumnos.DataSource = null;
            gvListarAlumnos.DataBind();
            gvListarAlumnos.DataSource = Admin.listarAlumnos();
            gvListarAlumnos.DataBind();
        }

        public void listarAlumnosPorNombre()
        {
            string dato = txtBuscarNavGv.Text.Trim().ToLower();
            gvListarAlumnos.DataSource = null;
            gvListarAlumnos.DataBind();
            gvListarAlumnos.DataSource = Admin.listarAlumnosPorNombre(dato);
            gvListarAlumnos.DataBind();
        }
        
        public void listarTipoDocumentoDdl()
        {
            ddlTipoDocumentoAc.DataSource = null;
            ddlTipoDocumentoAl.DataSource = null;
            ddlTipoDocumentoAc.DataBind();
            ddlTipoDocumentoAl.DataBind();
            ddlTipoDocumentoAc.DataSource = Admin.listarTipoDocumento();
            ddlTipoDocumentoAc.DataValueField = "id";
            ddlTipoDocumentoAc.DataTextField = "tipo";
            ddlTipoDocumentoAl.DataSource = Admin.listarTipoDocumento();
            ddlTipoDocumentoAl.DataValueField = "id";
            ddlTipoDocumentoAl.DataTextField = "tipo";
            ddlTipoDocumentoAc.DataBind();
            ddlTipoDocumentoAl.DataBind();  
        }

        public void listarTipoDocumentoEditDdl()
        {
            ddlTipoEdit.DataSource = null;
            ddlTipoEdit.DataBind();
            ddlTipoEdit.DataSource = Admin.listarTipoDocumento();
            ddlTipoEdit.DataValueField = "id";
            ddlTipoEdit.DataTextField = "tipo";
            ddlTipoEdit.DataBind();
        }

        public void listarEstadoDdlEdit()
        {
            ddlEstadoEd.DataSource = null;
            ddlEstadoEd.DataBind();
            ddlEstadoEd.DataSource = Admin.listarEstado();
            ddlEstadoEd.DataValueField = "id";
            ddlEstadoEd.DataTextField = "estado1";
            ddlEstadoEd.DataBind();
        }

        public void listarEstadoDdl()
        {
            ddlEstadoAl.DataSource = null;
            ddlEstadoAl.DataBind();
            ddlEstadoAl.DataSource = Admin.listarEstado();
            ddlEstadoAl.DataValueField = "id";
            ddlEstadoAl.DataTextField = "estado1";
            ddlEstadoAl.DataBind();
        }

        public void listarCursoDdl()
        {
            ddlCursoAl.DataSource = null;
            ddlCursoAl.DataBind();
            ddlCursoAl.DataSource = Admin.listarCurso();
            ddlCursoAl.DataValueField = "id";
            ddlCursoAl.DataTextField = "curso1";
            ddlCursoAl.DataBind();
        }




        
        /*=================================  METODOS DE REGISTRO  =========================================*/

        public void registroAcudiente()
        {
            string idAc = txtDocumentoAc.Text.Trim().ToLower();
            string nombreAc = txtNombreAc.Text.Trim().ToLower();
            string apellidoAc = txtApellidoAc.Text.Trim().ToLower();
            string telefonoAc = txtTelefonoAc.Text.Trim();
            string direccionAc = txtDireccionAc.Text.Trim().ToLower();
            string correoAc = txtCorreoAc.Text.Trim().ToLower();
            string pass = txtPassAc.Text.Trim();
            int idEstado = 1;
            int idRol = 1;
            int tipoDocumento = int.Parse(ddlTipoDocumentoAc.SelectedValue);

            int opcion = Admin.registrarAcudiente(idAc, nombreAc, apellidoAc, telefonoAc, direccionAc, correoAc, pass, idEstado, idRol, tipoDocumento);

            //if (opcion == 1)
            //{
            //    Response.Write("<script>alert("+ "'Usuario registrado con éxito'"+")</script>");
            //}
            //else if (opcion==2)
            //{
            //    Response.Write("<script>alert(" + "'Error al registrar el usuario'" + ")</script>");
            //}
            //else if (opcion==3)
            //{
            //    Response.Write("<script>alert(" + "'El usuario ya se encuentra registrado'" + ")</script>");
            //}
        }

        public void registroAlumno()
        {
            string idAl = txtDocumentoAl.Text.Trim();
            string nombreAl = txtNombreAl.Text.Trim().ToLower();
            string apellidoAl = txtApellidoAl.Text.Trim().ToLower();
            string telefonoAl = txtTelefonoAl.Text.Trim();
            string direccionAl = txtDireccionAl.Text.Trim().ToLower();
            string correoAl = txtCorreoAl.Text.Trim().ToLower();
            string idAcudiente = txtDocumentoAc.Text.Trim().ToLower();
            int cursoAl = int.Parse(ddlCursoAl.SelectedValue);
            int tipoDocumento = int.Parse(ddlTipoDocumentoAl.SelectedValue);
            int estado = int.Parse(ddlEstadoAl.SelectedValue);

            bool res = false;

            int opcion = Admin.registrarAlumno(idAl, nombreAl, apellidoAl, telefonoAl, direccionAl, correoAl, idAcudiente, tipoDocumento, estado);
            int opcionRegAlCurso = Admin.registrarAlumnoEnCurso(idAl, cursoAl);

            if (opcion == 1)
            {
                limpiarCampos();
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "agregar()", true);
                //Response.Write("<script>alert(" + "'Usuario registrado con éxito'" + ")</script>");
            }
            else if (opcion == 2)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                //Response.Write("<script>alert(" + "'Error al regsitrar al usuario'" + ")</script>");
            }
            else if (opcion == 3)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "existe()", true);
                //Response.Write("<script>alert(" + "'El usuario ya se encuentra registrado'" + ")</script>");
            }
        }

        public void registroAlumnoEnCurso()
        {
            string idAlumno = txtDocumentoAl.Text.Trim().ToLower();
            int idCurso = int.Parse(ddlCursoAl.SelectedValue);

            int opcion = Admin.registrarAlumnoEnCurso(idAlumno, idCurso);

            //if (opcion == 1)
            //{
            //    Response.Write("<script>alert(" + "'Usuario registrado con éxito'" + ")</script>");
            //}
            //else if (opcion == 2)
            //{
            //    Response.Write("<script>alert(" + "'Error al regsitrar al usuario'" + ")</script>");
            //}
            //else if (opcion == 3)
            //{
            //    Response.Write("<script>alert(" + "'El estudiante ya se encuentra registarado'" + ")</script>");
            //}

        }

        protected void lbGuardarEditar_Click(object sender, EventArgs e)
        {
            editarAlumno();
            limpiarCamposEditar();
            listarAlumnosGV();
            editarId.Visible = false;
            listarId.Visible = true;
            
        }

        /*===============================  END METODOS DE REGISTRO  =========================================*/





        /*===================================  METODOS DE EDITAR  ===========================================*/

        private void editarAlumno()
        {
            string id = txtIdEdit.Text.Trim().ToLower();
            string nombre = txtNombreEdit.Text.Trim().ToLower();
            string apellido = txtApellidoEdit.Text.Trim().ToLower();
            string telefono = txtTelefonoEdit.Text.Trim().ToLower();
            string direccion = txtDireccionEdit.Text.Trim().ToLower();
            string correo = txtCorreoEdit.Text.Trim().ToLower();
            //string idAcudiente = txtIdEdit.Text.Trim().ToLower();
            int estado = int.Parse(ddlEstadoEd.SelectedValue);
            int tipoDocumento = int.Parse(ddlTipoEdit.SelectedValue);

            int opcion = Admin.editarAlumno(id, nombre, apellido, telefono, direccion, correo, tipoDocumento, estado);

            if (opcion==1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "actualizar()", true);
            }
            else if (opcion==2)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
            }
            
        }


        /*=================================  END METODOS DE EDITAR  =========================================*/





        /*===================================  METODOS DE ELIMINAR  =========================================*/

        public void estadoAlumno(string id)
        {
            int opcion = Admin.cambiarEstadoAlumno(id);

            if (opcion==1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "eliminar()", true);
                //Response.Write("<script>alert(" + "'Registro eliminado con exito'" + ")</script>");
            }
            else if (opcion==2)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                //Response.Write("<script>alert(" + "'Error al eliminar registro'" + ")</script>");
            }
        }
        public void eliminarAlumno(string id)
        {

            bool alumnoEliminado = Admin.eliminarAlumno(id);

            if (alumnoEliminado)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "eliminar()", true);
                //Response.Write("<script>alert(" + "'Registro eliminado con exito'" + ")</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                //Response.Write("<script>alert(" + "'Error al eliminar registro'" + ")</script>");
            }
        }


        /*=================================  END METODOS DE ELIMINAR  =======================================*/





    }
}