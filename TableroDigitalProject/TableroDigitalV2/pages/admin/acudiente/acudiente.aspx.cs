using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ModeloV2;

namespace TableroDigitalV2.pages.acudiente
{
    public partial class acudiente : System.Web.UI.Page
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
                registrarId.Visible = false;
                listarAcudientes();
                listarTipoDocumentoDdl();
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


        protected void lbCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            HttpContext.Current.Response.Redirect("../../../principal.aspx", true);
            Response.Redirect("../../../principal.aspx");
        }

        protected void lbActualizarDatos_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                editarAcudiente();
                listarId.Visible = true;
                registrarId.Visible = false;
                editarId.Visible = false;
                limpiarCamposEditar();
                listarAcudientes();
            }
            else
            {
                MessageBox.Show("Debe ingresar todos los datos");
            }
            
        }

        protected void lbRegistrarAcudiente_Click(object sender, EventArgs e)
        {

        }

        protected void lbBuscarNavBarGv_Click(object sender, EventArgs e)
        {
            buscarNavbarGV();
        }

        protected void gvListarAcudientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvListarAcudientes.PageIndex = e.NewPageIndex;
                gvListarAcudientes.DataBind();
                listarAcudientes();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void gvListarAcudientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int indice = Convert.ToInt32(e.CommandArgument);
                GridViewRow fila = gvListarAcudientes.Rows[indice];
                documento = fila.Cells[0].Text;

                if (e.CommandName == "editar")
                {
                    //MessageBox.Show("Test "+documento);
                    listarId.Visible = false;
                    registrarId.Visible = false;
                    editarId.Visible = true;
                    llenarCampos();
                }
                else if (e.CommandName == "eliminar")
                {
                    //MessageBox.Show("Test " + documento);                 
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "eliminar()", true);

                    cambiarEstado();
                    listarAcudientes();
                    //eliminarAcudiente();

                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show($"Test {ex}");
            }
           
        }


        /*===================================  METODOS LISTAR  =========================================*/

        private void listarAcudientes()
        {
            gvListarAcudientes.DataSource = null;
            gvListarAcudientes.DataBind();
            gvListarAcudientes.DataSource = Admin.listarAcudientes();
            gvListarAcudientes.DataBind();
        }

        private void listarTipoDocumentoDdl()
        {
            ddlTipo.DataSource = null;
            ddlTipo.DataBind();
            ddlTipo.DataSource = Admin.listarTipoDocumento();
            ddlTipo.DataValueField = "id";
            ddlTipo.DataTextField = "tipo";
            ddlTipo.DataBind();
        }

        /*=================================  END METODOS LISTAR  =======================================*/



        /*=================================  END METODOS EDITAR  ======================================*/

        private void editarAcudiente()
        {
            try
            {
                string id = txtId.Text.Trim().ToLower();
                string nombre = txtNombre.Text.Trim().ToLower();
                string apellido = txtApellido.Text.Trim().ToLower();
                string telefono = txtTelefono.Text.Trim().ToLower();
                string direccion = txtDireccion.Text.Trim().ToLower();
                string correo = txtCorreo.Text.Trim().ToLower();
                int tipoDocumento = int.Parse(ddlTipo.SelectedValue);

                int opcion = Admin.editarUsuario(id, nombre, apellido, telefono, direccion, correo, tipoDocumento);

                if (opcion == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "notiAlert()", true);                   
                }
                else if (opcion == 2)
                {
                    Response.Write("<script>alert(" + "'Error al actualizar los datos'" + ")</script>");
                }
            }
            catch (Exception)
            {

            }
           
        }

        /*===================================  METODO EDITAR  ========================================*/



        /*===================================  METODO ELIMINAR  ======================================*/

        private void eliminarAcudiente()
        {
            bool acudienteBorrado = Admin.eliminarUsuario(documento);

            if (acudienteBorrado)
            {
                Response.Write("<script>alert(" + "'Registro eliminado con éxito'" + ")</script>");
            }
            else 
            {
                Response.Write("<script>alert(" + "'Error al eliminar el registro'" + ")</script>");
            }
        }

        private void cambiarEstado()
        {
            int opcion = Admin.cambiarEstadoUsuario(documento);
             

            if (opcion==1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "eliminar()", true);
                //Response.Write("<script>alert(" + "'Registro eliminado con éxito'" + ")</script>");
            }
            else if (opcion==2)
            {
                Response.Write("<script>alert(" + "'Error al eliminar el registro'" + ")</script>");
            }
        }

        /*=================================  END METODO ELIMINAR  ====================================*/




        /*======================================  FUNCIONES ============================================*/

        private void llenarCampos()
        {
            UsuarioDb u = Admin.buscarUsuarioPorid(documento);

            txtId.Text = u.id;
            txtNombre.Text = u.nombre;
            txtApellido.Text = u.apellido;
            txtTelefono.Text = u.telefono;
            txtDireccion.Text = u.direccion;
            txtCorreo.Text = u.correo;
            ddlRegistrarTipoDocumento.ClearSelection();
            ListItem tipoDocumento = ddlRegistrarTipoDocumento.Items.FindByValue(u.idTipoDocumento.ToString());

            if (tipoDocumento != null)
            {
                tipoDocumento.Selected = true;
            }
        }

        private void buscarNavbarGV()
        {
            string dato = txtBuscarNavbarGv.Text.Trim().ToLower();

            gvListarAcudientes.DataSource = null;
            gvListarAcudientes.DataBind();
            gvListarAcudientes.DataSource = Admin.listarAcudientePorNombre(dato);
            gvListarAcudientes.DataBind();
        }

        private void limpiarCamposEditar()
        {
            txtId.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            txtCorreo.Text = string.Empty;
            ddlTipo.ClearSelection();
        }

        protected void lbEliminarAcudiente_Click(object sender, EventArgs e)
        {
            cambiarEstado();
            listarAcudientes();
        }

       

        /*====================================  END FUNCIONES ==========================================*/


    }
}