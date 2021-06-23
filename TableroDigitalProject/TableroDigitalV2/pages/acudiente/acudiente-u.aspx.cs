using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ModeloV2;
using TextBox = System.Windows.Forms.TextBox;

namespace TableroDigitalV2.pages.acudiente
{
    public partial class acudiente_u : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //notasAlumnoId.Visible = false;

            validarSession();

            if (!Page.IsPostBack)
            {
                cargarNombre();
                mostarCards();
                llenarcampos();
                actualizarId.Visible = false;
                actualizarPassId.Visible = false;
                listarTipoDocumentoDdl();
                cargarFecha();
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
            string idAcudiente = u.id;
            hfIdAcudiente.Value = idAcudiente;
            hfDocumento.Value = idAcudiente;
            //MessageBox.Show("Nombre user = " + nombre + "user session = " + usuarioEnSesion+"id aciduente = "+idAcudiente);
            lblNombre.Text = nombre;
        }

        private void cargarFecha()
        {
            lblRegistrofecha.Text = DateTime.Now.ToString("yyyy");
            lblDateDirectorCurso.Text = DateTime.Now.ToString("yyyy");
            lblFechaPass.Text = DateTime.Now.ToString("yyyy");
        }

        protected void lbCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            HttpContext.Current.Response.Redirect("../../principal.aspx", true);
            Response.Redirect("../../principal.aspx");
        }


        private void mostarCards()
        {
            //string idAcudiente = "56896358";
            string acudiente = hfDocumento.Value;
           // MessageBox.Show($"acudiente en mostarCards = {acudiente} no funciona");
            //string idAcudiente = hfIdAcudiente.Value;
            UsuarioDb u = Admin.informacionAcudiente(acudiente);
            List<string> idAlumno = Admin.idAlumnoPorAcudiente(acudiente);
            string documento = idAlumno[0];
            Alumno a = Admin.informacionAlumno(documento);
            List<int> idEvidencias = Admin.idEvidencias(documento);

            //foreach (var item in idEvidencias)
            //{
            //    MessageBox.Show("id asginatura = "+item);
            //}


            string curso = Admin.curso(documento);
            string nombreAl = a.apellido+" "+a.nombre;
            string nombreAc = u.apellido + " " + u.nombre;
            string correo = a.correo;
            string direccion = a.direccion;
            string telefono = a.telefono;


            //MessageBox.Show($"id acudiente = {documento}\nid alumno = {nombreAl}");
            lblNombreAlumno1.Text = nombreAl;
            lblAcudiente1.Text = nombreAc;
            lblCurso1.Text = curso;
            lblCorreo1.Text = correo;
            lblDireccion1.Text = direccion;
            lblTelefono1.Text = telefono;
            listarEvidenciasGv(documento);

            if (idAlumno.Count==1)
            {

            }
        }

        private void llenarcampos()
        {
            //string idAcudiente = "56896358";
            string idAcudiente = hfIdAcudiente.Value;
            List<string> idAlumno = Admin.idAlumnoPorAcudiente(idAcudiente);
            string documento = idAlumno[0];
            //DataSet Dst = new DataSet();
            //Dst = (DataSet)Admin.idcurso(documento);
            //TextBox1.Text = Dst.Tables[0].Rows[0]["curso"].ToString();
        }

       private void actualizarDatosAcudiente()
        {
            string id = txtId.Text.Trim().ToLower();
            string nombre = txtNombre.Text.Trim().ToLower();
            string apellido = txtApellido.Text.Trim().ToLower();
            string telefono = txtTelefono.Text.Trim().ToLower();
            string direccion = txtDireccion.Text.Trim().ToLower();
            string correo = txtCorreo.Text.Trim().ToLower();
            int tipoDocumento = int.Parse(ddlTipoDocumento.SelectedValue);

            //MessageBox.Show($"id = {id}\nnombre = {nombre}");

            int opcion = Admin.editarUsuario(id, nombre, apellido, telefono, direccion, correo, tipoDocumento);

            if (opcion == 1)
            {
                mostarCards();
                Response.Write("<script>alert(" + "'Los datos se han actualizado con exito'" + ")</script>");
            }
            else if (opcion == 2)
            {
                Response.Write("<script>alert(" + "'Error al actualizar los datos'" + ")</script>");
            }
        }

        private void listarEvidenciasGv(string idAlumno)
        {
            gvListarEvidencias.DataSource = null;
            gvListarEvidencias.DataBind();
            gvListarEvidencias.DataSource = Admin.listarEvidenciasPorAlumno(idAlumno);
            gvListarEvidencias.DataBind();
        }


        private void llenarCampos()
        {
            string idAcudiente = hfIdAcudiente.Value;
            UsuarioDb u = Admin.buscarUsuarioPorid(idAcudiente);

            txtId.Text = u.id;
            txtNombre.Text = u.nombre;
            txtApellido.Text = u.apellido;
            txtTelefono.Text = u.telefono;
            txtDireccion.Text = u.direccion;
            txtCorreo.Text = u.correo;
            ddlTipoDocumento.ClearSelection();
            ListItem tipoDocumento = ddlTipoDocumento.Items.FindByValue(u.idTipoDocumento.ToString());

            if (tipoDocumento != null)
            {
                tipoDocumento.Selected = true;
            }
        }

        protected void lbActualizarDatos_Click(object sender, EventArgs e)
        {
            actualizarId.Visible = true;
            notasAlumnoId.Visible = false;
            actualizarPassId.Visible = false;
            llenarCampos();
        }

        protected void lbActualizarPass_Click(object sender, EventArgs e)
        {

            actualizarId.Visible = false;
            actualizarPassId.Visible = true;
            notasAlumnoId.Visible = false;
        }

        private void listarTipoDocumentoDdl()
        {
            ddlTipoDocumento.DataSource = null;
            ddlTipoDocumento.DataBind();
            ddlTipoDocumento.DataSource = Admin.listarTipoDocumento(); ;
            ddlTipoDocumento.DataValueField = "id";
            ddlTipoDocumento.DataTextField = "tipo";
            ddlTipoDocumento.DataBind();
        }

        protected void lbActualizarContraseña_Click(object sender, EventArgs e)
        {
            string idAcudiente = hfIdAcudiente.Value;
            string pass = Encriptacion.GetSHA256(txtPass.Text.Trim());
            bool res = Admin.actualizarPassAdmin(idAcudiente,pass);

            if (res)
            {
                Response.Write("<script>alert(" + "'Su contraseña se ha actualizado'" + ")</script>");
                notasAlumnoId.Visible = true;
                actualizarId.Visible = false;
                actualizarPassId.Visible = false;
            }
            else
            {
                Response.Write("<script>alert(" + "'Error! no se han podido realizar los cambios'" + ")</script>");
            }
            
        }

        protected void lbActualizarDatosAcudiente_Click(object sender, EventArgs e)
        {
            actualizarDatosAcudiente();
            notasAlumnoId.Visible = true;
            actualizarId.Visible = false;
            actualizarPassId.Visible = false;
        }

        protected void gvListarEvidencias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvListarEvidencias.PageIndex = e.NewPageIndex;
                gvListarEvidencias.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}