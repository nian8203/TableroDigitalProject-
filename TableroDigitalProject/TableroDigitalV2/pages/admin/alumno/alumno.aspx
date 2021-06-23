<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alumno.aspx.cs" Inherits="TableroDigitalV2.pages.alumno.alumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>alumnos</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../../resources/admin/vendors/iconfonts/font-awesome/css/all.min.css" />
    <link rel="stylesheet" href="../../../resources/admin/vendors/css/vendor.bundle.base.css" />
    <link rel="stylesheet" href="../../../resources/admin/vendors/css/vendor.bundle.addons.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../../resources/admin/css/style.css" />
    <!-- endinject -->
    <link rel="shortcut icon" href="http://www.urbanui.com/" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.0.18/sweetalert2.min.js" integrity="sha512-mBSqtiBr4vcvTb6BCuIAgVx4uF3EVlVvJ2j+Z9USL0VwgL9liZ638rTANn5m1br7iupcjjg/LIl5cCYcNae7Yg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.0.18/sweetalert2.all.min.js" integrity="sha512-kW/Di7T8diljfKY9/VU2ybQZSQrbClTiUuk13fK/TIvlEB1XqEdhlUp9D+BHGYuEoS9ZQTd3D8fr9iE74LvCkA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script>
        function agregar() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Proceso realizado',
                showConfirmButton: false,
                timer: 1500
            })
        }
        function eliminar() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Registro eliminado',
                showConfirmButton: false,
                timer: 1500
            })
        }
        function actualizar() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Registro actualizado',
                showConfirmButton: false,
                timer: 1500
            })
        }
        function error() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Error',
                text: 'Error de registro',
                showConfirmButton: false,
                timer: 2500
            })
        }
        function existe() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Error',
                text: 'Ya se encuentra registrado',
                showConfirmButton: false,
                timer: 2500
            })
        }
        function noEliminar() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'NO se puede eliminar',
                text: 'Hay docentes vinculados al registro',
                showConfirmButton: false,
                timer: 2500
            })
        }
    </script>
    <style type="text/css">
        .form-group {
            height: 35px;
        }

        #lbActualizar {
            font-weight: 500;
        }

        .menu-icon, #lbListarBreadCrumb {
            color: #de3c2f;
        }

            .menu-icon:hover {
                color: #9B9B9B;
            }

        .btn-cerrar-sesion {
            padding-top: 0px;
        }

        .col-form-label {
            padding-bottom: 0px;
            padding-left: 20px;
            color: #3c515a;
        }

        /*------------------formulario wizard----------------------*/
        /* Style the form */
        #regForm {
            background-color: #ffffff;
            margin: 100px auto;
            padding: 40px;
            width: 70%;
            min-width: 300px;
        }

        /* Style the input fields */
        input {
            padding: 10px;
            width: 100%;
            font-size: 17px;
            font-family: "PTSans", sans-serif;
        }

            /* Mark input boxes that gets an error on validation: */
            input.invalid {
                background-color: #ffdddd;
            }

        /* Hide all steps by default: */
        .tab {
            display: none;
        }

        /* Make circles that indicate the steps of the form: */
        .step {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbbbbb;
            border: none;
            border-radius: 50%;
            display: inline-block;
            opacity: 0.5;
        }

            /* Mark the active step: */
            .step.active {
                opacity: 1;
            }

            /* Mark the steps that are finished and valid: */
            .step.finish {
                background-color: #04AA6D;
            }
    </style>

</head>
<body>
    <form id="form1" runat="server">



        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row default-layout-navbar">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                    <a class="navbar-brand brand-logo" href="#">
                        <img src="../../../resources/img/LogoconRellenoTextoGris.png" alt="logo" />
                        <a class="navbar-brand brand-logo-mini" href="#">
                            <img src="../../../resources/img/faviconMesa de trabajo 1.svg" alt="logo" /></a>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-stretch">
                    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                        <span class="fas fa-bars"></span>
                    </button>
                    <%--  <ul class="navbar-nav">
                        <li class="nav-item nav-search d-none d-md-flex">
                            <div class="nav-link">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <asp:LinkButton ID="lbBuscarNavBar" runat="server">
                                        <i class="fas fa-search menu-icon"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtBuscarNavBar" runat="server" CssClass="form-control" placeholder="Buscar"></asp:TextBox>

                                </div>
                            </div>
                        </li>
                    </ul>--%>


                    <ul class="navbar-nav navbar-nav-right">
                        <li class="nav-item nav-profile dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                                <img src="../../../resources/admin/images/faces/face5.png" alt="profile" />
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown mt-3" aria-labelledby="profileDropdown">
                                <a class="dropdown-item" style="padding-top: 0px;">
                                    <asp:LinkButton ID="lbCerrarSesion" runat="server" CssClass="btn btn-default btn-cerrar-sesion" OnClick="lbCerrarSesion_Click" ForeColor="#de3c2f">
                                        <i class="fas fa-power-off text-red"></i> Cerrar Sesión
                                    </asp:LinkButton>
                                </a>

                            </div>
                        </li>
                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                        <span class="fas fa-bars"></span>
                    </button>
                </div>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:partials/_settings-panel.html -->
                <div class="theme-setting-wrapper">
                    <div id="settings-trigger"><i class="fas fa-fill-drip"></i></div>
                    <div id="theme-settings" class="settings-panel">
                        <i class="settings-close fa fa-times"></i>
                        <p class="settings-heading">SIDEBAR SKINS</p>
                        <div class="sidebar-bg-options selected" id="sidebar-light-theme">
                            <div class="img-ss rounded-circle bg-light border mr-3"></div>
                            Light
                        </div>
                        <div class="sidebar-bg-options" id="sidebar-dark-theme">
                            <div class="img-ss rounded-circle bg-dark border mr-3"></div>
                            Dark
                        </div>
                        <p class="settings-heading mt-2">HEADER SKINS</p>
                        <div class="color-tiles mx-0 px-4">
                            <div class="tiles primary"></div>
                            <div class="tiles success"></div>
                            <div class="tiles warning"></div>
                            <div class="tiles danger"></div>
                            <div class="tiles info"></div>
                            <div class="tiles dark"></div>
                            <div class="tiles default"></div>
                        </div>
                    </div>
                </div>

                <!-- nav -->
                <!-- menu lateral -->
                <nav class="sidebar sidebar-offcanvas" id="sidebar">
                    <ul class="nav">
                        <li class="nav-item nav-profile">
                            <div class="nav-link">
                                <div class="profile-image">
                                    <img src="../../../resources/admin/images/faces/face5.png" alt="image" />
                                </div>
                                <div class="profile-name">

                                    <p class="name">
                                        <asp:Label ID="lblNombre" runat="server" Text="" CssClass="text-capitalize"></asp:Label>
                                    </p>
                                    <p class="designation">
                                        Admnistrador
                                    </p>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../administrador.aspx">
                                <i class="fa fa-home menu-icon"></i>
                                <span class="menu-title">Inicio</span>
                            </a>
                        </li>
                        <li class="nav-item d-none d-lg-block">
                            <a class="nav-link" data-toggle="collapse" href="#sidebar-layouts" aria-expanded="false" aria-controls="sidebar-layouts">
                                <i class="fas fa-user-tie menu-icon"></i>
                                <span class="menu-title">Usuario</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="sidebar-layouts">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"><a class="nav-link" href="#">Alumno</a></li>
                                    <li class="nav-item"><a class="nav-link" href="../docente/docente.aspx">Docente</a></li>
                                    <li class="nav-item"><a class="nav-link" href="../acudiente/acudiente.aspx">Acudiente</a></li>
                                </ul>
                            </div>
                        </li>
                        <%-- <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fas fa-user-graduate menu-icon"></i>
                                <span class="menu-title active">Alumno</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../usuario/usuario.aspx">
                                <i class="fas fa-user-tie menu-icon"></i>
                                <span class="menu-title">Usuario</span>
                            </a>
                        </li>--%>
                        <li class="nav-item">
                            <a class="nav-link" href="../curso/curso.aspx">
                                <i class="fas fa-school menu-icon"></i>
                                <span class="menu-title">Curso</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../asignatura/asignatura.aspx">
                                <i class="fas fa-book-open menu-icon"></i>
                                <span class="menu-title">Asignatura</span>
                            </a>
                        </li>
                    </ul>
                </nav>


                <!--=============================== EDITAR ALUMNOS =================================-->

                <div class="main-panel" id="editarId" runat="server">
                    <div class="content-wrapper">
                        <div class="page-header">
                            <h3 class="page-title">Editar</h3>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item" aria-current="page">
                                        <asp:LinkButton ID="lbAlumnosReg" runat="server" ForeColor="#de3c2f" OnClick="lbAlumnosReg_Click">Alumnos</asp:LinkButton>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page" style="color: rgba(0,0,0,.4)">Editar</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Información Personal</h4>
                                        <p class="card-description">
                                            Llenar todos los campos.
                                        </p>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">No. Cedula</label>
                                                    <div class="col-sm-9" style="color: red;">
                                                        <asp:TextBox ID="txtIdEdit" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="30" Height="35px" ReadOnly="True"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvIdEdit" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtIdEdit"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Tipo</label>
                                                    <div class="col-sm-9">
                                                        <asp:DropDownList ID="ddlTipoEdit" runat="server" CssClass="form-control" Height="35px"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Nombre</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="txtNombreEdit" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvNombreEdit" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtNombreEdit"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Apellido</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="txtApellidoEdit" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvApellidoEdit" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtApellidoEdit"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Teléfono</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="txtTelefonoEdit" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvTelefonoEdit" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtTelefonoEdit"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Dirección</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="txtDireccionEdit" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="80" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvDireccionEdit" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtDireccionEdit"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Correo</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="txtCorreoEdit" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="30" Height="35px" TextMode="Email"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvCorreoEdit" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtCorreoEdit"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Estado</label>
                                                    <div class="col-sm-9">
                                                        <asp:DropDownList ID="ddlEstadoEd" runat="server" CssClass="form-control" Height="35px"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mt-3">
                                                <asp:LinkButton ID="lbGuardarEditar" runat="server" CssClass="btn btn-outline-danger float-right"
                                                    CausesValidation="True" Height="40px" 
                                                    OnClick="lbGuardarEditar_Click">
                                                                 Actualizar
                                                </asp:LinkButton>
                                                <%-- <button type="button" class="btn btn-outline-danger float-right" data-toggle="modal" style="width:120px" data-target="#staticBackdrop">
                                                    Guardar
                                                </button>--%>
                                                <asp:Button ID="btnCancelarForm" CssClass="btn btn-outline-dark float-right mr-3" Width="120" runat="server" Text="Cancelar" CausesValidation="false" />




                                                <!-- Modal -->
                                                <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="staticBackdropLabel" style="color: rgba(0,0,0,.4);">Actualizacion de Datos</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>


                                                            <div class="text-center">
                                                                <span style="font-size: 65px; color: Dodgerblue;">
                                                                    <%-- <i class="fas fa-exclamation-triangle" style="margin-top: 30px; color: #0B94F7"></i>--%>
                                                                    <%--<i class="fas fa-exclamation" style="margin-top: 30px; color: #0B94F7"></i>--%>
                                                                    <i class="fas fa-exclamation-circle" style="margin-top: 30px; color: #0B94F7"></i>
                                                                </span>
                                                            </div>
                                                            <div class="modal-body" style="padding-top: 0px">
                                                                <h3 class="mt-4" style="color: rgba(0,0,0,.4);">Los datos seran actualizados!</h3>
                                                                <h5 class=" mt-2 text-center" style="color: rgba(0,0,0,.4);">Desea realizar los cambios?</h5>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                                <%--<asp:LinkButton ID="lbGuardarEditar" runat="server" CssClass="btn btn-outline-danger"
                                                                    Width="150" CausesValidation="True" Height="40px" Font-Size="Large"
                                                                    OnClick="lbGuardarEditar_Click">
                                                                 Actualizar
                                                                </asp:LinkButton>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- content-wrapper ends -->
                        <!-- partial:../../../partials/_footer.html -->
                        <footer class="footer">
                            <div class="d-sm-flex justify-content-center justify-content-sm-between">
                                <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 
                                <asp:Label ID="lblFechaFooterEditar" runat="server" Text=""></asp:Label>
                                    <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. Todos los derechos reservados.</span>
                            </div>
                        </footer>
                    </div>
                    <!-- partial formulario de editar-->
                    <!-- main-panel ends -->
                </div>
                <!--=============================== END EDITAR ALUMNOS =================================-->





                <!--=============================== LISTAR ALUMNOS =================================-->


                <div class="main-panel" runat="server" id="listarId">
                    <div class="content-wrapper">
                        <div class="page-header">
                            <h3 class="page-title">Alumnos</h3>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item" aria-current="page">
                                        <asp:LinkButton ID="lbListarAlumnos" runat="server" CssClass="breadcrumb-item" ForeColor="#de3c2f" OnClick="lbListarAlumnos_Click">Alumnos</asp:LinkButton>
                                    </li>
                                    <li class="breadcrumb-item">Editar
                                    </li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Información Personal
                                            <asp:LinkButton ID="lbCrearAlumno" runat="server" CssClass="btn btn-danger float-right" Height="40" OnClick="lbCrearAlumno_Click">
                                           <i class="fas fa-user-plus"></i>&nbsp;&nbsp;Alumno
                                            </asp:LinkButton>
                                            <div class="nav-link float-right mr-2" style="padding-top: 0px;">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" style="padding-top: 10px;">
                                                            <asp:LinkButton ID="lbBuscarAlumnoPorNombreNavGv" runat="server" Height="10" OnClick="lbBuscarAlumnoPorNombreNavGv_Click">
                                                                <i class="fas fa-search menu-icon"></i>
                                                            </asp:LinkButton>
                                                        </span>
                                                        <asp:TextBox ID="txtBuscarNavGv" runat="server" CssClass="form-control" Height="40" Width="150" placeholder="Buscar"></asp:TextBox>

                                                    </div>

                                                </div>
                                            </div>
                                        </h4>
                                        <p class="card-description">
                                            Agregue, edite o elimine datos.
                                        </p>
                                        <div class="row">
                                            <!--=============================== GRIDVIEW =================================-->
                                            <div class="row justify-content-center align-items-center table-responsive ml-1 table-borderless">
                                                <asp:GridView ID="gvListarAlumnos" runat="server" CssClass="table table-hover" AllowPaging="True"
                                                    AlternatingRowStyle-BackColor="" OnSelectedIndexChanged="gvListarAlumnos_SelectedIndexChanged"
                                                    OnPageIndexChanging="gvListarAlumnos_PageIndexChanging"
                                                    OnRowCommand="gvListarAlumnos_RowCommand" PageSize="10"
                                                    AutoGenerateColumns="false" BorderStyle="None" BackColor="#EFE9E9" HeaderStyle-BackColor="#FFCCCC"
                                                    ForeColor="#333333" RowStyle-BorderStyle="NotSet" AlternatingRowStyle-BorderStyle="NotSet">


                                                    <Columns>
                                                        <asp:BoundField DataField="id" HeaderText="Documento" />
                                                        <asp:BoundField DataField="nombre" HeaderText="Nombre" ItemStyle-CssClass="text-capitalize" />
                                                        <asp:BoundField DataField="apellido" HeaderText="Apellido" ItemStyle-CssClass="text-capitalize" />
                                                        <asp:BoundField DataField="telefono" HeaderText="Teléfono" />
                                                        <asp:BoundField DataField="correo" HeaderText="Correo" />
                                                        <asp:TemplateField HeaderText="Acción" ItemStyle-CssClass="align-items-center">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lbEdit" runat="server" CssClass=""
                                                                    CommandName="editar"
                                                                    CommandArgument="<%# ((GridViewRow)Container).RowIndex %>">
                                                                     <i class="fas fa-pencil-alt menu-icon" style="padding-left:12px;"></i>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="lbDelete" runat="server" CssClass=""
                                                                    CommandName="eliminar"
                                                                    CommandArgument="<%# ((GridViewRow)Container).RowIndex %>">
                                                                     <i class="fa fa-trash menu-icon" aria-hidden="true" style="padding-left:12px;"></i>
                                                                </asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%-- <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Accion" ShowHeader="True" Text="Ver" />--%>
                                                    </Columns>


                                                </asp:GridView>
                                                <!--=============================== END GRIDVIEW =================================-->

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- content-wrapper ends -->
                            <!-- partial:../../../partials/_footer.html -->
                            <footer class="footer">
                                <div class="d-sm-flex justify-content-center justify-content-sm-between">
                                    <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 
                                <asp:Label ID="lblFechaFooterListar" runat="server" Text=""></asp:Label>
                                        <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. Todos los derechos reservados.</span>
                                </div>
                            </footer>
                        </div>
                        <!-- partial formulario de editar-->
                        <!-- main-panel ends -->
                    </div>
                </div>

                <!--=============================== END LISTAR ALUMNOS =================================-->


                <!--=============================== REGISTRAR ALUMNOS =================================-->

                <div class="main-panel" id="regAlumnoId" runat="server">
                    <div class="content-wrapper">
                        <div class="page-header ml-2">
                            <h3 class="page-title">Registro 
                            </h3>
                            <nav aria-label="breadcrumb" class="">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="alumno.aspx" style="color: #de3c2f">Alumnos</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Registro</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row m-0">
                            <div class="col-12 grid-margin">
                                <div class="card" id="ac">
                                    <div class="card-body">



                                        <div class="tab">
                                            <h4 class="card-title ml-3">Información Acudiente</h4>
                                            <p class="card-description ml-3">
                                                Llenar todos los campos.
                                            </p>

                                            <div class="row mt-3">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">No. Documento</label>
                                                        <div class="col-sm-12" style="color: red;">
                                                            <asp:TextBox ID="txtDocumentoAc" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="15" Height="35px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="form-text" ID="rfvDocumentoAc" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtDocumentoAc" ValidationGroup="registro"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Tipo</label>
                                                        <div class="col-sm-12">
                                                            <asp:DropDownList ID="ddlTipoDocumentoAc" runat="server" CssClass="form-control" Height="35px"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Teléfono</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtTelefonoAc" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="20" Height="35px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="form-text" ID="rfvTelefonoAc" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtTelefonoAc" ValidationGroup="registro"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Nombre</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtNombreAc" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="form-text" ID="rfvNombreAc" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtNombreAc" ValidationGroup="registro"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Apellido</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtApellidoAc" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="form-text" ID="rfvApellidoAc" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtApellidoAc" ValidationGroup="registro"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Dirección</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtDireccionAc" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="80" Height="35px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="form-text" ID="rfvDireccionAc" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtDireccionAc" ValidationGroup="registro"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Correo</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtCorreoAc" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="50" Height="35px" TextMode="Email" onpaste="return false" oncut="return false" oncopy="return false"></asp:TextBox>
                                                            <%--                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvRegistroCorreo" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroCorreo"></asp:RequiredFieldValidator>--%>
                                                            <asp:RegularExpressionValidator ID="revCorreoAc" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtCorreoAc" Text="Correo no valido" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" Font-Size="Small" ValidationGroup="registro"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Validar Correo</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtValCorreoAc" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="50" Height="35px" TextMode="Email" onpaste="return false" oncut="return false" oncopy="return false"></asp:TextBox>
                                                            <%--                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvRegValidarCorreo" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtRegValidarCorreo"></asp:RequiredFieldValidator>--%>
                                                            <asp:CompareValidator ID="cvValCorreoAc" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtCorreoAc" ControlToCompare="txtValCorreoAc" Text="Los correos no coinciden" Font-Size="Small" ForeColor="red" ValidationGroup="registro"></asp:CompareValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Contraseña</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtPassAc" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="15" Height="35px" TextMode="SingleLine" onpaste="return false" oncut="return false" oncopy="return false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="form-text" ID="rfvPassAc" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtPassAc" ValidationGroup="registro"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Validar Contraseña</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtValPassAc" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="15" Height="35px" TextMode="SingleLine" onpaste="return false" oncut="return false" oncopy="return false"></asp:TextBox>
                                                            <%--                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvRegValidarCorreo" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtRegValidarCorreo"></asp:RequiredFieldValidator>--%>
                                                            <asp:CompareValidator ID="cvPassAc" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtPassAc" ControlToCompare="txtValPassAc" Text="Los datos no coinciden" Font-Size="Small" ForeColor="red" ValidationGroup="registro"></asp:CompareValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--<div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Rol</label>
                                                        <div class="col-sm-12">
                                                            <asp:DropDownList ID="ddlRolAc" runat="server" CssClass="form-control" Height="35px"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>--%>
                                            </div>

                                        </div>




                                        <div class="tab">
                                            <h4 class="card-title ml-3">Información Alumno</h4>
                                            <p class="card-description ml-3">
                                                Llenar todos los campos.
                                            </p>

                                            <div class="row mt-3">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">No. Documento</label>
                                                        <div class="col-sm-12" style="color: red;">
                                                            <asp:TextBox ID="txtDocumentoAl" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="form-text" ID="rfvDocumentoAl" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtDocumentoAl" ValidationGroup="registro"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Tipo</label>
                                                        <div class="col-sm-12">
                                                            <asp:DropDownList ID="ddlTipoDocumentoAl" runat="server" CssClass="form-control" Height="35px"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Nombre</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtNombreAl" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="form-text" ID="rfvNombreAl" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtNombreAl" ValidationGroup="registro"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Apellido</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtApellidoAl" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="form-text" ID="rfvApellidoAl" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtApellidoAl" ValidationGroup="registro"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Correo</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtCorreoAl" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="30" Height="35px" TextMode="Email"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="form-text" ID="rfvCorreoAl" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtCorreoAl" ValidationGroup="registro"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Dirección</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtDireccionAl" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="form-text" ID="rfvDireccionAl" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtDireccionAl" ValidationGroup="registro"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Teléfono</label>
                                                        <div class="col-sm-12">
                                                            <asp:TextBox ID="txtTelefonoAl" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="form-text" ID="rfvTelefonoAl" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtTelefonoAl" ValidationGroup="registro"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Curso</label>
                                                        <div class="col-sm-12">
                                                            <asp:DropDownList ID="ddlCursoAl" runat="server" CssClass="form-control" Height="35px"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-12 col-form-label">Estado</label>
                                                        <div class="col-sm-12">
                                                            <asp:DropDownList ID="ddlEstadoAl" runat="server" CssClass="form-control" Height="35px"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>


                                        <div class="mt-5 mr-3">
                                            <asp:Button ID="show" CssClass="btn btn-outline-danger float-right mr-3 ml-3" CausesValidation="true" runat="server" Text="Guardar" Width="120" OnClick="show_Click" ValidationGroup="registro" />
                                            <button type="button" class="btn btn-outline-dark float-right" id="prevBtn" onclick="nextPrev(-1)" style="width: 120px">Anterior</button>
                                            <button type="button" class="btn btn-outline-danger float-right" id="nextBtn" onclick="nextPrev(1)" style="width: 120px; margin-right: 15px">Siguiente</button>

                                        </div>

                                        <!-- Circles which indicates the steps of the form: -->
                                        <div style="text-align: center; margin-top: 40px;" hidden>
                                            <span class="step"></span>
                                            <span class="step"></span>
                                            <span class="step"></span>
                                            <span class="step"></span>
                                        </div>

                                        <!-- Modal -->
                                        <div class="modal fade" id="staticBackdropRegistro" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabelRegistro" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="staticBackdropLabelRegistro" style="color: rgba(0,0,0,.4);">Registro de Datos</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>


                                                    <div class="text-center">
                                                        <span style="font-size: 65px; color: Dodgerblue;">
                                                            <%-- <i class="fas fa-exclamation-triangle" style="margin-top: 30px; color: #0B94F7"></i>--%>
                                                            <%--<i class="fas fa-exclamation" style="margin-top: 30px; color: #0B94F7"></i>--%>
                                                            <%--                                                            <i class="fas fa-exclamation-circle" style="margin-top: 30px; color: #0B94F7"></i>--%>
                                                            <i class="fas fa-question-circle" style="margin-top: 30px; color: #0B94F7"></i>
                                                        </span>
                                                    </div>
                                                    <div class="modal-body" style="padding-top: 0px">
                                                        <h3 class="mt-4" style="color: rgba(0,0,0,.4);">Los datos seran registrados!</h3>
                                                        <h5 class=" mt-2 text-center" style="color: rgba(0,0,0,.4);">Desea continuar?</h5>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                        <asp:LinkButton ID="lbGuardarRegistroAlumno" runat="server" CssClass="btn btn-outline-danger"
                                                            Width="150" CausesValidation="True" Height="40px" Font-Size="Large">
                                                                 Guardar
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                    </div>
                                </div>






                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:../../partials/_footer.html -->
                    <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 
                                <asp:Label ID="lblFechaFooterRegistrar" runat="server" Text=""></asp:Label>
                                <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. Todos los derechos reservados.</span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>

                <!--=============================== END REGISTRAR ALUMNOS =================================-->


                <!-- page-body-wrapper ends -->
            </div>
        </div>




    </form>


    <!-- plugins:js -->
    <script src="../../../resources/admin/vendors/js/vendor.bundle.base.js"></script>
    <script src="../../../resources/admin/vendors/js/vendor.bundle.addons.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <!-- End plugin js for this page-->
    <!-- inject:js -->
    <script src="../../../resources/admin/js/off-canvas.js"></script>
    <script src="../../../resources/admin/js/hoverable-collapse.js"></script>
    <script src="../../../resources/admin/js/misc.js"></script>
    <script src="../../../resources/admin/js/settings.js"></script>
    <script src="../../../resources/admin/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="../../../resources/admin/js/dashboard.js"></script>
    <script src="../../../resources/admin/js/wizard.js"></script>
    <!-- End custom js for this page-->

    <script>
        var currentTab = 0; // Current tab is set to be the first tab (0)
        showTab(currentTab); // Display the current tab

        function showTab(n) {
            // This function will display the specified tab of the form ...
            var x = document.getElementsByClassName("tab");
            x[n].style.display = "block";
            // ... and fix the Previous/Next buttons:
            if (n == 0) {
                document.getElementById("prevBtn").style.display = "none";
                document.getElementById('show').style.display = "none";
                document.getElementById('nextBtn').style.display = "inline";
            } else {
                document.getElementById("prevBtn").style.display = "inline";
                document.getElementById('show').style.display = "inline";
                document.getElementById('nextBtn').style.display = "none";
            }
            // if (n == 1) {
            //   document.getElementById('show').style.display = "inline";
            //   document.getElementById("nextBtn").style.display = "none";
            //   n = 0


            // } else {
            //   document.getElementById("nextBtn").innerHTML = "Siguiente";
            // }

            // ... and run a function that displays the correct step indicator:
            fixStepIndicator(n)
        }

        function nextPrev(n) {
            // This function will figure out which tab to display
            var x = document.getElementsByClassName("tab");
            // Exit the function if any field in the current tab is invalid:
            if (n == 1 && !validateForm()) return false;
            // Hide the current tab:
            x[currentTab].style.display = "none";
            // Increase or decrease the current tab by 1:
            currentTab = currentTab + n;
            // if you have reached the end of the form... :
            if (currentTab >= x.length) {
                //...the form gets submitted:
                document.getElementById("regForm").submit();
                return false;
            }
            // Otherwise, display the correct tab:
            showTab(currentTab);
        }

        function validateForm() {
            // This function deals with validation of the form fields
            var x, y, i, valid = true;
            x = document.getElementsByClassName("tab");
            y = x[currentTab].getElementsByTagName("input");
            // A loop that checks every input field in the current tab:
            for (i = 0; i < y.length; i++) {
                // If a field is empty...
                if (y[i].value == "") {
                    // add an "invalid" class to the field:
                    y[i].className += " invalid";
                    // and set the current valid status to false:
                    valid = false;
                }
            }
            // If the valid status is true, mark the step as finished and valid:
            if (valid) {
                document.getElementsByClassName("step")[currentTab].className += " finish";
            }
            return valid; // return the valid status
        }

        function fixStepIndicator(n) {
            // This function removes the "active" class of all steps...
            var i, x = document.getElementsByClassName("step");
            for (i = 0; i < x.length; i++) {
                x[i].className = x[i].className.replace(" active", "");
            }
            //... and adds the "active" class to the current step:
            x[n].className += " active";
        }
    </script>

</body>
</html>
