using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ModeloV2;

namespace tableroDigital.pages.login
{
    public partial class inicio_sesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
            
        }       

        protected void btnIngresar_Click1(object sender, EventArgs e)
        {        

            string correo = txtCorreo.Text;
            string pass = Encriptacion.GetSHA256(txtPass.Text);
            UsuarioDb usuarioEncontrado = Admin.validarSesion(correo, pass);

            if (usuarioEncontrado != null)
            {
                string idUsuarioEnSesion = usuarioEncontrado.id;
                int idRol = usuarioEncontrado.idRol;
                //MessageBox.Show("usuario encontrado\nid = "+idUsuarioEnSesion+"id rol = "+idRol);

                if (idRol == 1)
                {
                    Session["usuarioEncontrado"] = idUsuarioEnSesion;
                    Response.Redirect("../acudiente/acudiente-u.aspx");
                    txtCorreo.Text = string.Empty;
                    txtPass.Text = string.Empty;
                }
                else if (idRol == 2)
                {
                    Session["usuarioEncontrado"] = idUsuarioEnSesion;
                    Response.Redirect("../docente/docente-u.aspx");
                    txtCorreo.Text = string.Empty;
                    txtPass.Text = string.Empty;
                }
                else if (idRol == 3)
                {
                    Session["usuarioEncontrado"] = idUsuarioEnSesion;
                    Response.Redirect("../admin/administrador.aspx");
                    txtCorreo.Text = string.Empty;
                    txtPass.Text = string.Empty;
                }
                
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                //Response.Write("<script>alert(" + "'Usuario no encontrado'" + ")</script>");
            }
            
        }


      
    }
}