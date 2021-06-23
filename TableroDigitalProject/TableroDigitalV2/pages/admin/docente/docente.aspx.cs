using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ModeloV2;

namespace TableroDigitalV2.pages.docente
{
    public partial class docente : System.Web.UI.Page
    {
        string documento;
        protected void Page_Load(object sender, EventArgs e)
        {
            validarSession();
            if (!Page.IsPostBack)
            {
                cargarFecha();
                cargarNombre();
                registrarId.Visible = false;
                editarId.Visible = false;
                listarDocentesGv();
                listarTipoDocumentoDdl();
                listarTipoDocumentoEditDdl();
                listarAsignaturaDdl();
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
            lblEditFecha.Text = DateTime.Now.ToString("yyyy");
            lblListFecha.Text = DateTime.Now.ToString("yyyy");
            lblRegistrofecha.Text = DateTime.Now.ToString("yyyy");
        }





        /*===================================  BUTTONS  =========================================*/

        protected void lbRegistrarDocente_Click(object sender, EventArgs e)
        {
            registrarId.Visible = true;
            listarId.Visible = false;
            editarId.Visible = false;
        }

        protected void lbCrearNuevoDocente_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                registrarDocente();
                limpiarCampos();
                listarDocentesGv();
            }
            
        }

        protected void lbActualizarDatos_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                editarDocente();
                listarDocentesGv();
                editarId.Visible = false;
                registrarId.Visible = false;
                listarId.Visible = true;
            }
            
        }

        protected void lbBuscarNavBarGv_Click(object sender, EventArgs e)
        {
            buscarDocenteGv();
        }

        protected void lbCerrarSesion_Click(object sender, EventArgs e)
        {

            hfDocumento.Value = string.Empty;           
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            HttpContext.Current.Response.Redirect("../../../principal.aspx", true);
            Response.Redirect("../../../principal.aspx");
        }

        protected void gvListarDocentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex);
            }
        }

        protected void gvListarDocentes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvListarDocentes.PageIndex = e.NewPageIndex;
                gvListarDocentes.DataBind();
                listarDocentesGv();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error"+ex);
            }
            
        }

        protected void gvListarDocentes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int indice = Convert.ToInt32(e.CommandArgument);
            GridViewRow fila = gvListarDocentes.Rows[indice];
            documento = fila.Cells[0].Text;

            if (e.CommandName=="editar")
            {
                //MessageBox.Show("Test "+documento);
                listarId.Visible = false;
                registrarId.Visible = false;
                editarId.Visible = true;
                llenarCampos();
            }
            else if (e.CommandName=="eliminar")
            {
                
                eliminarDocente();
                listarDocentesGv();
            }
        }

        /*===================================  END BUTTONS  =========================================*/






        /*===================================  METODOS LISTAR  =========================================*/

        public void listarDocentesGv()
        {
            gvListarDocentes.DataSource = null;
            gvListarDocentes.DataBind();
            gvListarDocentes.DataSource = Admin.listarDocentes();
            gvListarDocentes.DataBind();
        }

        private void listarTipoDocumentoDdl()
        {
            ddlRegistrarTipoDocumento.DataSource = null;
            ddlRegistrarTipoDocumento.DataBind();
            ddlRegistrarTipoDocumento.DataSource = Admin.listarTipoDocumento();
            ddlRegistrarTipoDocumento.DataValueField = "id";
            ddlRegistrarTipoDocumento.DataTextField = "tipo";
            ddlRegistrarTipoDocumento.DataBind();
        }

        private void listarTipoDocumentoEditDdl()
        {
            ddlTipo.DataSource = null;
            ddlTipo.DataBind();
            ddlTipo.DataSource = Admin.listarTipoDocumento();
            ddlTipo.DataValueField = "id";
            ddlTipo.DataTextField = "tipo";
            ddlTipo.DataBind();
        }

        private void listarAsignaturaDdl()
        {
            ddlAsignaturaReg.DataSource = null;
            ddlAsignaturaReg.DataBind();
            ddlAsignaturaReg.DataSource = Admin.listarAsignatura();
            ddlAsignaturaReg.DataValueField = "id";
            ddlAsignaturaReg.DataTextField = "materia";
            ddlAsignaturaReg.DataBind();
        }
        
        /*=================================  END METODOS LISTAR  =======================================*/






        /*====================================  METODOS REGISTRAR  ========================================*/

        public void registrarDocente()
        {
            string id = txtRegistroId.Text.Trim().ToLower();
            string nombre = txtRegistroNombre.Text.Trim().ToLower();
            string apellido = txtRegistroApellido.Text.Trim().ToLower();
            string telefono = txtRegistroTelefono.Text.Trim().ToLower();
            string direccion = txtRegistroDireccion.Text.Trim().ToLower();
            string correo = txtRegistroCorreo.Text.Trim().ToLower();
            string pass = txtRegistroPass.Text.Trim();
            int idEstado = 1;
            int idRol = 2;
            int tipoDocumento = int.Parse(ddlRegistrarTipoDocumento.SelectedValue);
            int idAsignatura = int.Parse(ddlAsignaturaReg.SelectedValue);

            

            int opcion = Admin.registrarAcudiente(id, nombre, apellido, telefono, direccion, correo, pass, idEstado, idRol, tipoDocumento);

            if (opcion==1)
            {
                limpiarCampos();
                //MessageBox.Show($"id acudiente = {id}\nid asignatura = {idAsignatura}");
                Admin.registrarAsignaturaDocenteCurso(idAsignatura, id);
                Response.Write("<script>alert(" + "'Usuario registrado con éxito'" + ")</script>");
            }
            else if (opcion==2)
            {
                Response.Write("<script>alert(" + "'Error al registrar usuario'" + ")</script>");
            }
            else if (true)
            {
                Response.Write("<script>alert(" + "'El usuario ya se encuentra registrado'" + ")</script>");
            }
        }


        /*=================================  END METODOS REGISTRAR  =======================================*/






        /*=====================================  METODOS EDITAR  ==========================================*/

        private void editarDocente()
        {
            string id = txtId.Text;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string telefono = txtTelefono.Text;
            string direccion = txtDireccion.Text;
            string correo = txtCorreo.Text;
            int tipoDocumento = int.Parse(ddlTipo.SelectedValue);

            int opcion = Admin.editarUsuario(id, nombre, apellido, telefono, direccion, correo, tipoDocumento);

            if (opcion==1)
            {
                Response.Write("<script>alert(" + "'Registro actualizado con éxito'" + ")</script>");
            }
            else if (opcion==2)
            {
                Response.Write("<script>alert(" + "'Error al modificar los datos'" + ")</script>");
            }
        }
       

        /*===================================  END METODOS EDITAR  ========================================*/






        /*=====================================  METODOS ELIMINAR  ========================================*/
        

        //private void eliminarDocente()
        //{
        //    bool docenteEliminado = Admin.eliminarUsuario(documento);

        //    if (docenteEliminado)
        //    {
        //        Response.Write("<script>alert(" + "'Registro eliminado con éxito'" + ")</script>");
        //    }
        //    else 
        //    {
        //        Response.Write("<script>alert(" + "'Error al eliminar el registro'" + ")</script>");
        //    }
        //}


        private void eliminarDocente()
        {
            int opcion = Admin.cambiarEstadoUsuario(documento);

            if (opcion==1)
            {
                Response.Write("<script>alert(" + "'Registro eliminado con éxito'" + ")</script>");
            }
            else if(opcion==2)
            {
                Response.Write("<script>alert(" + "'Error al eliminar el registro'" + ")</script>");
            }
        }

        /*===================================  END METODOS ELIMINAR  ======================================*/







        /*========================================  FUNCIONES  ============================================*/

        private void limpiarCampos()
        {
            txtRegistroId.Text = string.Empty;
            txtRegistroNombre.Text = string.Empty;
            txtRegistroApellido.Text = string.Empty;
            txtRegistroTelefono.Text = string.Empty;
            txtRegistroDireccion.Text = string.Empty;
            txtRegistroCorreo.Text = string.Empty;
            txtRegValidarCorreo.Text = string.Empty;
            txtRegistroPass.Text = string.Empty;
            txtValidarPass.Text = string.Empty;
            ddlRegistrarTipoDocumento.ClearSelection();
        }

        private void llenarCampos()
        {
            UsuarioDb u = Admin.buscarUsuarioPorid(documento);
            txtId.Text = u.id;
            txtNombre.Text = u.nombre;
            txtApellido.Text = u.apellido;
            txtTelefono.Text = u.telefono;
            txtDireccion.Text = u.direccion;
            txtCorreo.Text = u.correo;
            ddlTipo.ClearSelection();
            ListItem tipoDocumento = ddlTipo.Items.FindByValue(u.idTipoDocumento.ToString());
        }

        private void buscarDocenteGv()
        {
            string dato =  txtBuscarNavbarGv.Text;

            gvListarDocentes.DataSource = null;
            gvListarDocentes.DataBind();
            gvListarDocentes.DataSource = Admin.listarDocentesPorNombre(dato);
            gvListarDocentes.DataBind();
        }

        /*======================================  END FUNCIONES  ==========================================*/



    }
}