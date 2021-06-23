using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using ModeloV2;

namespace TableroDigitalV2.pages
{
    public partial class pruebas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fecha = DateTime.Today.ToString("yyyy-MM-dd");
            DateTime fecha1 = DateTime.Today;
            DateTime fecha2 = DateTime.Now;
            MessageBox.Show($"Fecha = {fecha}\nfecha = {fecha1}\nfecha = {fecha2}");
            //Admin.idAlumnos(3);
            int idCurso = 3;
            int IdEvid = 1;
            List<string> idAlumno = Admin.idAlumnos(idCurso);
            int opcion = Admin.registrarEvidenciaAlumnos(IdEvid, idAlumno);

            //if (opcion == 1)
            //{
            //    Response.Write("<script>alert(" + "'Datos ingresados'" + ")</script>");
            //}
            //else if (opcion == 2)
            //{
            //    Response.Write("<script>alert(" + "'Error al ingresar datos'" + ")</script>");
            //}

           
        }

        protected void lbPrueba_Click(object sender, EventArgs e)
        {
            alert();
        }


        private void alert()
        {
            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "notiAlert()", true);
        }
    }
}