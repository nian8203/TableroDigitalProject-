using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ModeloV2;

namespace TableroDigitalV2.pages.admin
{
    public partial class administrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            validarSession();
            cargarFecha();
            cargarNombre();
            cargarConteos();
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
            //lblFechaNotificaciones.Text = DateTime.Now.ToString("yyyy");
            //lblFechaDocentes.Text = DateTime.Now.ToString("yyyy");
            //lblFechaAlPendientes.Text= DateTime.Now.ToString("yyyy");
            lblFechaFooter.Text = DateTime.Now.ToString("yyyy");
        }

        private void validarSession()
        {
            if (Session["usuarioEncontrado"] == null)
            {
                Response.Redirect("../../principal.aspx");
            }
        }

        protected void lbCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            HttpContext.Current.Response.Redirect("../../principal.aspx", true);
            Response.Redirect("../../principal.aspx");
        }

        private void cargarConteos()
        {
            int qAlumnos = Admin.contarAlumnos();
            int qDocentes = Admin.conteoDocentes();
            int qPendiente = Admin.conteoPendientes();
            double promedio = Admin.promedioAlto();
            lblConteoAlumnos.Text = qAlumnos.ToString();
            lblConteoDocentes.Text = qDocentes.ToString();
            lblConteoPendientes.Text = qPendiente.ToString();
            lblPromedioAlto.Text = promedio.ToString();
        }

    }
}