<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="acudiente.aspx.cs" Inherits="TableroDigitalV2.pages.acudiente.acudiente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>listar</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../../resources/admin/vendors/iconfonts/font-awesome/css/all.min.css" />
    <link rel="stylesheet" href="../../../resources/admin/vendors/css/vendor.bundle.base.css" />
    <link rel="stylesheet" href="../../../resources/admin/vendors/css/vendor.bundle.addons.css" />
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../../resources/admin/css/style.css" />
    <%--    <script src="../../../resources/jsExt/swalert.js"></script>--%>
    <!-- endinject -->
    <link rel="shortcut icon" href="http://www.urbanui.com/" />

    <script src="../../resources/jsExt/swalert.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.0.18/sweetalert2.min.js" integrity="sha512-mBSqtiBr4vcvTb6BCuIAgVx4uF3EVlVvJ2j+Z9USL0VwgL9liZ638rTANn5m1br7iupcjjg/LIl5cCYcNae7Yg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.0.18/sweetalert2.all.min.js" integrity="sha512-kW/Di7T8diljfKY9/VU2ybQZSQrbClTiUuk13fK/TIvlEB1XqEdhlUp9D+BHGYuEoS9ZQTd3D8fr9iE74LvCkA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.0.18/sweetalert2.min.css" integrity="sha512-riZwnB8ebhwOVAUlYoILfran/fH0deyunXyJZ+yJGDyU0Y8gsDGtPHn1eh276aNADKgFERecHecJgkzcE9J3Lg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script>       

        function eliminar() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Registro eliminado',
                showConfirmButton: false,
                timer: 1500
            })
        }

        function notiAlert() {

            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Proceso realizado',
                showConfirmButton: false,
                timer: 1500
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
                    <%-- <ul class="navbar-nav">
                        <li class="nav-item nav-search d-none d-md-flex">
                            <div class="nav-link">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <asp:LinkButton ID="lbBuscarUsuarioPorNombre" runat="server">
                                        <i class="fas fa-search menu-icon"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtBuscarAlumnoPorNombre" runat="server" CssClass="form-control" placeholder="Buscar por nombre"></asp:TextBox>

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
                                    <asp:LinkButton ID="lbCerrarSesion" runat="server" CssClass="btn btn-default btn-cerrar-sesion" ForeColor="#de3c2f"
                                        OnClick="lbCerrarSesion_Click">
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
                            <a class="nav-link active" data-toggle="collapse" href="#sidebar-layouts" aria-expanded="false" aria-controls="sidebar-layouts">
                                <i class="fas fa-user-tie menu-icon active"></i>
                                <span class="menu-title active">Usuario</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="sidebar-layouts">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"><a class="nav-link" href="../alumno/alumno.aspx">Alumno</a></li>
                                    <li class="nav-item"><a class="nav-link" href="../docente/docente.aspx">Docente</a></li>
                                    <li class="nav-item"><a class="nav-link active" href="#">Acudiente</a></li>
                                </ul>
                            </div>
                        </li>
                        <%-- <li class="nav-item">
                            <a class="nav-link" href="#">
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
                                    <li class="breadcrumb-item"><a href="acudiente.aspx" style="color: #de3c2f">Listar</a></li>
                                    <%-- <li class="breadcrumb-item" aria-current="page">
                                        <asp:LinkButton ID="lbReturnEditarListar" runat="server" CssClass="text-danger" OnClick="lbReturnEditarListar_Click">Listar</asp:LinkButton>
                                    </li>--%>
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
                                                    <label class="col-sm-3 col-form-label">No. Documento</label>
                                                    <div class="col-sm-9" style="color: red;">
                                                        <asp:TextBox ID="txtId" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="20" Height="35px" ReadOnly="True"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvId" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtId" ValidationGroup="editar"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Tipo</label>
                                                    <div class="col-sm-9">
                                                        <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control" Height="35px"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Nombre</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvNombre" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtNombre" ValidationGroup="editar"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Apellido</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvApellido" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtApellido" ValidationGroup="editar"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Teléfono</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="15" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rvTelefono" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtTelefono" ValidationGroup="editar"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Dirección</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="80" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvDireccion" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtDireccion" ValidationGroup="editar"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Correo</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="50" Height="35px" TextMode="Email" ReadOnly="true"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvCorreo" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtCorreo" ValidationGroup="editar"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <%-- <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Rol</label>
                                                    <div class="col-sm-9">
                                                        <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-control" Height="35px"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 mt-3">

                                                <%--<button type="button" class="btn btn-outline-danger float-right" data-toggle="modal" data-target="#staticBackdrop">
                                                    Guardar
                                                </button>--%>
                                                <asp:LinkButton ID="lbActualizarDatos" runat="server" CssClass="btn btn-outline-danger float-right mr-4"
                                                    CausesValidation="True" Height="40" Font-Size="Large"
                                                    OnClick="lbActualizarDatos_Click" ValidationGroup="editar">
                                                                 Actualizar
                                                </asp:LinkButton>
                                                <%--                                                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-outline-danger float-right" Text="Guardar" data-toggle="modal" data-target="#staticBackdrop" ValidationGroup="editar" />--%>
                                                <asp:Button ID="btnCancelarForm" CssClass="btn btn-outline-dark float-right mr-3" Height="40" runat="server" Text="Cancelar" />








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
                                    <asp:Label ID="lblEditFecha" runat="server" Text=""></asp:Label>
                                    <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. All rights reserved.</span>
                                <%--                                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="far fa-heart text-danger"></i></span>--%>
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
                            <h3 class="page-title">Acudientes</h3>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="acudiente.aspx" style="color: #de3c2f">Listar</a></li>
                                    <%-- <li class="breadcrumb-item" aria-current="page">
                                        <asp:LinkButton ID="lbListarBreadCrumb" runat="server" CssClass="breadcrumb-item" OnClick="lbListarBreadCrumb_Click">Listar</asp:LinkButton>
                                    </li>--%>
                                    <li class="breadcrumb-item">Docentes</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">

                                        <h4 class="card-title">Información Personal 
                                            
                                           <%--  <asp:LinkButton ID="lbRegistrarAcudiente" runat="server" CssClass="btn btn-danger float-right" Height="40"
                                                 OnClick="lbRegistrarAcudiente_Click">
                                           <i class="fas fa-user-plus"></i>&nbsp;&nbsp;Acudiente
                                             </asp:LinkButton>--%>

                                            <%-- <ul class="navbar-nav float-right">--%>
                                            <%--<li class="nav-item nav-search d-none d-md-flex float-right">--%>
                                            <div class="nav-link float-right mr-2" style="padding-top: 0px;">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" style="padding-top: 10px;">
                                                            <asp:LinkButton ID="lbBuscarNavBarGv" runat="server" Height="10"
                                                                OnClick="lbBuscarNavBarGv_Click">
                                        <i class="fas fa-search menu-icon"></i>
                                                            </asp:LinkButton>
                                                        </span>
                                                        <asp:TextBox ID="txtBuscarNavbarGv" runat="server" CssClass="form-control" Height="40" Width="150" placeholder="Buscar"></asp:TextBox>

                                                    </div>

                                                </div>
                                            </div>
                                            <%-- </li>--%>
                                            <%-- </ul>--%>


                                        </h4>
                                        <p class="card-description">
                                            Listado de docentes.
                                        </p>
                                        <div class="row">
                                            <!--=============================== GRIDVIEW =================================-->
                                            <div class="row justify-content-center align-items-center table-responsive ml-1 table-borderless">
                                                <asp:GridView ID="gvListarAcudientes" runat="server" CssClass="table table-hover" AllowPaging="True"
                                                    AlternatingRowStyle-BackColor=""
                                                    OnPageIndexChanging="gvListarAcudientes_PageIndexChanging"
                                                    OnRowCommand="gvListarAcudientes_RowCommand" PageSize="10"
                                                    AutoGenerateColumns="false" BorderStyle="None" BackColor="#EFE9E9" HeaderStyle-BackColor="#FFCCCC"
                                                    ForeColor="#333333">


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



                                        <!-- Modal -->
                                        <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" runat="server">
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
                                                        <asp:LinkButton ID="lbEliminarAcudiente" runat="server" CssClass="btn btn-outline-danger"
                                                            Width="150" Height="40px" Font-Size="Large"
                                                            OnClick="lbEliminarAcudiente_Click">
                                                                 Eliminar
                                                        </asp:LinkButton>
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
                                        <asp:Label ID="lblListFecha" runat="server" Text=""></asp:Label>
                                        <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. Todos los derechos reservados.</span>
                                    <%--                                    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="far fa-heart text-danger"></i></span>--%>
                                </div>
                            </footer>

                        </div>
                        <!-- partial formulario de editar-->
                        <!-- main-panel ends -->
                    </div>
                </div>

                <!--=============================== END LISTAR DOCENTES =================================-->




                <!--=============================== REGISTRAR DOCENTES =================================-->

                <div class="main-panel" id="registrarId" runat="server">
                    <div class="content-wrapper">
                        <div class="page-header">
                            <h3 class="page-title">Registro 
                            </h3>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="docente.aspx" style="color: #de3c2f">Notas</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Alumno</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Información Personal</h4>
                                        <%--                                        <form class="form-sample">--%>
                                        <p class="card-description">
                                            Llenar todos los campos.
                                        </p>
                                        <div class="row mt-3">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-12 col-form-label">No. Documento</label>
                                                    <div class="col-sm-12" style="color: red;">
                                                        <asp:TextBox ID="txtRegistroId" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="15" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvRegistroId" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroId"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-12 col-form-label">Tipo</label>
                                                    <div class="col-sm-12">
                                                        <asp:DropDownList ID="ddlRegistrarTipoDocumento" runat="server" CssClass="form-control" Height="35px"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-12 col-form-label">Telefono</label>
                                                    <div class="col-sm-12">
                                                        <asp:TextBox ID="txtRegistroTelefono" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="20" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvRegistroTelefono" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroTelefono"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-12 col-form-label">Nombre</label>
                                                    <div class="col-sm-12">
                                                        <asp:TextBox ID="txtRegistroNombre" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvRegistroNombre" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroNombre"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-12 col-form-label">Apellido</label>
                                                    <div class="col-sm-12">
                                                        <asp:TextBox ID="txtRegistroApellido" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvRegistroApellido" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroApellido"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-12 col-form-label">Direccion</label>
                                                    <div class="col-sm-12">
                                                        <asp:TextBox ID="txtRegistroDireccion" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="50" Height="35px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvRegistroDireccion" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroDireccion"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-12 col-form-label">Correo</label>
                                                    <div class="col-sm-12">
                                                        <asp:TextBox ID="txtRegistroCorreo" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="50" Height="35px" TextMode="Email" onpaste="return false" oncut="return false" oncopy="return false"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="revRegistroCorreo" runat="server" ErrorMessage="RegularExpressionValidator" ForeColor="red" ControlToValidate="txtRegistroCorreo" Text="Correo no valido" ValidationExpression="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" Font-Size="Small"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-12 col-form-label">Validar Correo</label>
                                                    <div class="col-sm-12">
                                                        <asp:TextBox ID="txtRegValidarCorreo" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="50" Height="35px" TextMode="Email" onpaste="return false" oncut="return false" oncopy="return false"></asp:TextBox>
                                                        <%--                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvRegValidarCorreo" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtRegValidarCorreo"></asp:RequiredFieldValidator>--%>
                                                        <asp:CompareValidator ID="cvValidarCorreo" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtRegistroCorreo" ControlToCompare="txtRegValidarCorreo" Text="Los correos no coinciden" Font-Size="Small" ForeColor="red"></asp:CompareValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-12 col-form-label">Contraseña</label>
                                                    <div class="col-sm-12">
                                                        <asp:TextBox ID="txtRegistroPass" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="50" Height="35px" TextMode="SingleLine" onpaste="return false" oncut="return false" oncopy="return false"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvRegistroPass" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtRegistroPass"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-12 col-form-label">Validar Contraseña</label>
                                                    <div class="col-sm-12">
                                                        <asp:TextBox ID="txtValidarPass" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="50" Height="35px" TextMode="SingleLine" onpaste="return false" oncut="return false" oncopy="return false"></asp:TextBox>
                                                        <%--                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvRegValidarCorreo" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtRegValidarCorreo"></asp:RequiredFieldValidator>--%>
                                                        <asp:CompareValidator ID="cvValidarPass" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtRegistroPass" ControlToCompare="txtValidarPass" Text="Los datos no coinciden" Font-Size="Small" ForeColor="red"></asp:CompareValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-sm-12 col-form-label">Rol</label>
                                                    <div class="col-sm-12">
                                                        <asp:DropDownList ID="ddRegistroRol" runat="server" CssClass="form-control" Height="35px"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>

                                        <div class="mt-5 mr-3">
                                            <button type="button" class="btn btn-outline-danger float-right" data-toggle="modal" data-target="#staticBackdropRegistro">
                                                Guardar
                                            </button>
                                            <asp:Button ID="btnCancelarRegistro" CssClass="btn btn-outline-dark float-right mr-3" CausesValidation="false" runat="server" Text="Cancelar" />
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
                                                        <asp:LinkButton ID="lbCrearNuevoAcudiente" runat="server" CssClass="btn btn-outline-danger"
                                                            Width="150" CausesValidation="True" Height="40px" Font-Size="Large">
                                                                 Registrar
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                        <asp:HiddenField ID="hfDocumento" runat="server" />
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
                                <asp:Label ID="lblRegistrofecha" runat="server" Text=""></asp:Label>
                                <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. All rights reserved.</span>
                            <%--                            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="far fa-heart text-danger"></i></span>--%>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>

                <!--=============================== END REGISTRAR ALUMNOS =================================-->

                <!-- page-body-wrapper ends -->
            </div>
        </div>
        <!-- container-scroller -->


    </form>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


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
    <!-- End custom js for this page-->

</body>
</html>
