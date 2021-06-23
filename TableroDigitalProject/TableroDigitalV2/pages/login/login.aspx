<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="tableroDigital.pages.login.inicio_sesion" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>--%>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login TD</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../../resources/login/vendor/login/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../resources/login/vendor/bootstrap/css/bootstrap.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../resources/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../resources/login/vendor/animate/animate.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../resources/login/vendor/css-hamburgers/hamburgers.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../resources/login/vendor/animsition/css/animsition.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../resources/login/vendor/select2/select2.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../resources/login/vendor/daterangepicker/daterangepicker.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../resources/login/css/util.css" />
    <link rel="stylesheet" type="text/css" href="../../resources/login/css/main.css" />
    <link rel="stylesheet" type="text/css" href="../../resources/principal/css/style.css" />
    <!--===============================================================================================-->

    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.0.18/sweetalert2.min.js" integrity="sha512-mBSqtiBr4vcvTb6BCuIAgVx4uF3EVlVvJ2j+Z9USL0VwgL9liZ638rTANn5m1br7iupcjjg/LIl5cCYcNae7Yg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.0.18/sweetalert2.all.min.js" integrity="sha512-kW/Di7T8diljfKY9/VU2ybQZSQrbClTiUuk13fK/TIvlEB1XqEdhlUp9D+BHGYuEoS9ZQTd3D8fr9iE74LvCkA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script type="text/javascript">
        function error() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Error',
                text: 'Usuario o contraseña incorrectos!',
                showConfirmButton: false,
                timer: 3000
            })
        }
    </script>

</head>
<body>


    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-form-title" style="background-image: url(../../resources/login/images/login.png);">
                    <img src="../../resources/login/images/logo_letras_blancas.png" alt="Alternate Text" style="width: 200px"/>
                   <%-- <span class="login100-form-title-1">Sign In                        
                    </span>--%>
                </div>

                <form id="form1" runat="server" class="login100-form validate-form featureArea">
                    <div class="wrap-input100 validate-input m-b-26" data-validate="Ingrese su correo">
                        <span class="label-input100">Usuario</span>
                        <asp:TextBox ID="txtCorreo" runat="server" AutoComplete="new-password" CssClass="input100" name="username" placeholder="Ingrese su correo" autofocus=""></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input m-b-18" data-validate="Ingrese su contraseña">
                        <span class="label-input100">Contraseña</span>
                        <asp:TextBox ID="txtPass" runat="server"  CssClass="input100" AutoComplete="new-password"  name="username" placeholder="Ingrese su contraseña" TextMode="Password"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="flex-sb-m w-full p-b-30">
                        <div class="contact100-form-checkbox">
                            <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me" />
                            <label class="label-checkbox100" for="ckb1">
                                Recordarme
                            </label>
                        </div>

                        <div>
                            <a href="#" class="txt1">Olvido su contraseña?
                            </a>
                        </div>
                    </div>

                    <div class="container-login100-form-btn">                        
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="login100-form-btn form-control" OnClick="btnIngresar_Click1"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!--===============================================================================================-->
    <script src="../../resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="../../resources/login/vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="../../resources/login/vendor/bootstrap/js/popper.js"></script>
    <script src="../../resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="../../resources/login/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="../../resources/login/vendor/daterangepicker/moment.min.js"></script>
    <script src="../../resources/login/vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="../../resources/login/vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    <script src="../../resources/login/js/main.js"></script>

</body>
</html>
