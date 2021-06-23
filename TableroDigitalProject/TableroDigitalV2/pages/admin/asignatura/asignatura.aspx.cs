using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ModeloV2;

namespace TableroDigitalV2.pages.admin.asignatura
{
    public partial class asignatura_d : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            validarSession();
            if (!Page.IsPostBack)
            {
                btnEditar.Visible = false;
                lbEditarAs.Visible = false;
                cargarFecha();
                cargarNombre();
                listarAsignaturas();
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
            lblListFecha.Text = DateTime.Now.ToString("yyyy");
        }

        protected void lbCrearAsig_Click(object sender, EventArgs e)
        {
            string n = txtAsignatura.Text.Trim().ToLower();
            string nombre = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(n);
            int opcion = Admin.registrarAsignatura(nombre);

            if (Page.IsValid)
            {
                if (opcion == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "agregar()", true);
                    //Response.Write("<script>alert(" + "'Asignatura registrada con éxito'" + ")</script>");
                    listarAsignaturas();
                    txtAsignatura.Text = string.Empty;
                    txtAsignatura.Focus();
                }
                else if (opcion == 2)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                    //Response.Write("<script>alert(" + "'Error al registrar los datos'" + ")</script>");
                }
                else if (opcion == 3)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "existe()", true);
                    //Response.Write("<script>alert(" + "'La asignatura ya se encuentra registrada'" + ")</script>");
                    txtAsignatura.Focus();
                }
            }

        }

        protected void lbEditarAs_Click(object sender, EventArgs e)
        {
            editarAsignatura();
            listarAsignaturas();
            lbCrearAsig.Visible = true;
            lbEditarAs.Visible = false;
            txtAsignatura.Text = string.Empty;
            txtAsignatura.Focus();
        }

        protected void lbCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            HttpContext.Current.Response.Redirect("../../../principal.aspx", true);
            Response.Redirect("../../../principal.aspx");
        }
                
        protected void gvListarAsignaturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int indice = Convert.ToInt32(e.CommandArgument);
            GridViewRow fila = gvListarAsignaturas.Rows[indice];
            int id = int.Parse(fila.Cells[0].Text);
            hfDocumento.Value = id.ToString();

            if (e.CommandName == "editar")
            {
                //MessageBox.Show("editar id = " + id);
                Asignatura a = Admin.buscarAsignaturaPorId(id);

                lbEditarAs.Visible = true;
                lbCrearAsig.Visible = false;
                txtAsignatura.Text = a.materia;
                txtAsignatura.Focus();
            }
            else if (e.CommandName == "eliminar")
            {
                eliminarAsignatura();
                listarAsignaturas();
            }
        }
        

        private void listarAsignaturas()
        {
            gvListarAsignaturas.DataSource = null;
            gvListarAsignaturas.DataBind();
            gvListarAsignaturas.DataSource = Admin.listarAsignatura();
            gvListarAsignaturas.DataBind();
        }

                
        private void editarAsignatura()
        {
            int id = int.Parse(hfDocumento.Value);
            string n = txtAsignatura.Text.Trim().ToLower();
            string nombre = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(n);
            int opcion = Admin.editarAsignatura(id, nombre);

            if (opcion == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "agregar()", true);
                //Response.Write("<script>alert(" + "'Los datos se han actualizado con exito'" + ")</script>");
                txtAsignatura.Text = string.Empty;
                txtAsignatura.Focus();
                //lbEditarAs.Visible = false;
                lbCrearAsig.Visible = true;
            }
            else if (opcion == 2)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                //Response.Write("<script>alert(" + "'Error al actualizar los datos'" + ")</script>");
            }
            else if (opcion == 3)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "existe()", true);
                //Response.Write("<script>alert(" + "'La asignatura ya se encuentra registrada'" + ")</script>");
            }
        }

        private void eliminarAsignatura()
        {
            int id = int.Parse(hfDocumento.Value);
            int opcion = Admin.eliminarAsignatura(id);

            if (opcion == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "eliminar()", true);
                //Response.Write("<script>alert(" + "'Registro eliminado con éxito'" + ")</script>");
            }
            else if (opcion == 2)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                //Response.Write("<script>alert(" + "'Error al eliminar el registro'" + ")</script>");
            }
            else if (opcion==3)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "noEliminar()", true);
                //Response.Write("<script>alert(" + "'No se puede eliminar, hay docentes vinculados a esta asignatura'" + ")</script>");
            }
        }
    }
}