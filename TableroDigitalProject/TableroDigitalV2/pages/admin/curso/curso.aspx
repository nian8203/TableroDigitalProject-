﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="curso.aspx.cs" Inherits="TableroDigitalV2.pages.admin.curso" %>

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
    <!-- endinject -->
    <link rel="shortcut icon" href="http://www.urbanui.com/" />

    <script src="../../resources/jsExt/swalert.js"></script>
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
                timer: 3000
            })
        }
        function existe() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Error',
                text: 'El curso ya esta registrado',
                showConfirmButton: false,
                timer: 3000
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
                                        OnClick="lbCerrarSesion_Click" CausesValidation="false">
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
                                    <li class="nav-item"><a class="nav-link active" href="../acudiente/acudiente.aspx">Acudiente</a></li>
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
                            <a class="nav-link" href="#">
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






                <!--=============================== REGISTRAR CURSO =================================-->

                <div class="main-panel" id="registrarId" runat="server">
                    <div class="content-wrapper">
                        <div class="page-header">
                            <h3 class="page-title">Registro 
                            </h3>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="curso.aspx" style="color: #de3c2f">Listar</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Cursos</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Curso</h4>
                                        <%--                                        <form class="form-sample">--%>
                                        <p class="card-description">
                                            Ingrese el nombre del curso a registrar.
                                        </p>
                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Curso</label>
                                                    <div class="col-sm-9" style="color: red;">
                                                        <asp:TextBox ID="txtCurso" runat="server" CssClass="form-control text-capitalize" CausesValidation="True" MaxLength="30" Height="35px" required></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvCurso" ToolTip="hola a todos" Display="Dynamic" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtCurso"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <%--<asp:button runat="server" type="button" class="btn btn-outline-danger float-right" data-toggle="modal" data-target="#staticBackdropRegistro" Text="Guardar"/>
                                                        Guardar
                                                    </asp:button>--%>
                                                    <asp:LinkButton ID="lbCrearCurso" runat="server" CssClass="btn btn-outline-danger"
                                                            Width="150" CausesValidation="True" Height="40px" Font-Size="Large"
                                                            OnClick="lbCrearCurso_Click">
                                                                 Registrar
                                                        </asp:LinkButton>
<%--                                                    <asp:linkbutton runat="server" id="lbguardarcurso" type="button" class="btn btn-outline-danger float-left ml-2" data-toggle="modal" data-target="#staticbackdropregistro">guardar</asp:linkbutton>--%>
                                                    <asp:LinkButton ID="lbEditarCurso" runat="server" CssClass="btn btn-outline-danger float-left ml-2" OnClick="lbEditarCurso_Click">Actualizar</asp:LinkButton>
                                                    <%--                                                    <asp:Button ID="btnEditar" CssClass="btn btn-outline-dark float-right mr-3" CausesValidation="false" runat="server" Text="Cancelar" />--%>
                                                </div>
                                            </div>
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
                                                        <%--<asp:LinkButton ID="lbCrearCurso" runat="server" CssClass="btn btn-outline-danger"
                                                            Width="150" CausesValidation="True" Height="40px" Font-Size="Large"
                                                            OnClick="lbCrearCurso_Click">
                                                                 Registrar
                                                        </asp:LinkButton>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:HiddenField ID="hfDocumento" runat="server" />
                                        <asp:HiddenField ID="hfIdDocente" runat="server" />
                                        <asp:HiddenField ID="hfIdCurso" runat="server" />
                                        <asp:HiddenField ID="hfMateria" runat="server" />

                                    </div>
                                </div>


                                <div class="row mt-5" id="cursoId" runat="server">
                                    <div class="col-12 grid-margin">
                                        <div class="card">
                                            <div class="card-body">

                                                <h4 class="card-title">Cursos</h4>
                                                <p class="card-description">
                                                    Listado de cursos.
                                                </p>
                                                <div class="row" style="padding: 10px">
                                                    <!--=============================== GRIDVIEW =================================-->
                                                    <div class="row justify-content-center align-items-center table-responsive ml-1 table-borderless">
                                                        <asp:GridView ID="gvListarCursos" runat="server" CssClass="table table-hover"
                                                            OnRowCommand="gvListarCursos_RowCommand" DataKeyNames="id"
                                                            OnRowDataBound="gvListarCursos_RowDataBound"
                                                            AutoGenerateColumns="false" BorderStyle="None" BackColor="#EFE9E9" HeaderStyle-BackColor="#FFCCCC"
                                                            ForeColor="#333333">


                                                            <Columns>
                                                                <asp:BoundField DataField="id" HeaderText="ID" ItemStyle-CssClass="text-capitalize" Visible="false" />
                                                                <asp:BoundField DataField="curso1" HeaderText="Curso" ItemStyle-CssClass="text-capitalize " ItemStyle-Width="250" />

                                                                <asp:TemplateField HeaderText="Alumnos" ItemStyle-CssClass="" ItemStyle-Width="250">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbAlumnos" runat="server" CssClass=""
                                                                            CommandName="alumnos"
                                                                            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CausesValidation="false">
                                                                             <i class="fas fa-user-graduate menu-icon" style="padding-left:25px"></i>
                                                 <%--<i class="fas fa-pencil-alt menu-icon" style="padding-left:12px;"></i>--%>
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Asignaturas" ItemStyle-Width="250">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbAsignaturas" runat="server" CssClass=""
                                                                            CommandName="asignaturas"
                                                                            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CausesValidation="false">
                                                                             <i class="fas fa-book-open menu-icon" style="padding-left:35px;"></i>
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>


                                                                <asp:TemplateField HeaderText="Acción">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbEdit" runat="server" CssClass=""
                                                                            CommandName="editar"
                                                                            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CausesValidation="false">
                                                                                <i class="fas fa-pencil-alt menu-icon" style="padding-left:5px;"></i>
                                                                        </asp:LinkButton>
                                                                        <asp:LinkButton ID="lbDelete" runat="server" CssClass=""
                                                                            CommandName="eliminar"
                                                                            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CausesValidation="false">
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
                                        <asp:Label ID="lblFechaCurso" runat="server" Text=""></asp:Label>
                                                <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. Todos los derechos reservados.</span>
                                            <%--                                    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="far fa-heart text-danger"></i></span>--%>
                                        </div>
                                    </footer>
                                </div>





                                <div class="row mt-5" id="alumnosId" runat="server">
                                    <div class="col-12 grid-margin">
                                        <div class="card">
                                            <div class="card-body">

                                                <h4 class="card-title">Curso:
                                                    <asp:Label ID="lblCursoAlumno" runat="server" Text=""></asp:Label></h4>
                                                <p class="card-description">
                                                    Listado de alumnos.
                                                </p>
                                                <div class="row" style="padding: 10px">
                                                    <!--=============================== GRIDVIEW =================================-->
                                                    <div class="row justify-content-center align-items-center table-responsive ml-1 table-borderless">
                                                        <asp:GridView ID="gvListarAlumnos" runat="server" CssClass="table table-hover"
                                                            AutoGenerateColumns="false" BorderStyle="None" BackColor="#EFE9E9" HeaderStyle-BackColor="#FFCCCC"
                                                            ForeColor="#333333">

                                                            <Columns>
                                                                <asp:BoundField DataField="nombre" HeaderText="Nombre" ItemStyle-CssClass="text-capitalize" />
                                                                <asp:BoundField DataField="telefono" HeaderText="Telefono" ItemStyle-CssClass="text-capitalize" />
                                                                <asp:BoundField DataField="correo" HeaderText="Correo" />
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
                                        <asp:Label ID="lblFechaAlumno" runat="server" Text=""></asp:Label>
                                                <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. Todos los derechos reservados.</span>
                                            <%--                                    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="far fa-heart text-danger"></i></span>--%>
                                        </div>
                                    </footer>
                                </div>





                                <div class="row mt-5" id="asignaturasId" runat="server">
                                    <div class="col-12 grid-margin">
                                        <div class="card">
                                            <div class="card-body">

                                                <h4 class="card-title">Curso:
                                                    <asp:Label ID="lblCursoAsignatura" runat="server" Text=""></asp:Label>
                                                    <asp:LinkButton ID="lbAgrearDocenteaCurso" runat="server" CssClass="btn btn-danger float-right" Height="40"
                                                        OnClick="lbAgrearDocenteaCurso_Click" CausesValidation="false">
                                                        <i class="fas fa-plus"></i>&nbsp;&nbsp;Agregar asignatura
                                                    </asp:LinkButton>
                                                </h4>
                                                <p class="card-description">
                                                    Listado de asignaturas.
                                                </p>
                                                <div class="row" style="padding: 10px">
                                                    <!--=============================== GRIDVIEW =================================-->
                                                    <div class="row justify-content-center align-items-center table-responsive ml-1 table-borderless">
                                                        <asp:GridView ID="gvListarAsignturas" runat="server" CssClass="table table-hover"
                                                            AutoGenerateColumns="false" BorderStyle="None" BackColor="#EFE9E9" HeaderStyle-BackColor="#FFCCCC"
                                                            ForeColor="#333333">

                                                            <Columns>
                                                                <asp:BoundField DataField="materia" HeaderText="Asignatura" ItemStyle-CssClass="text-capitalize" />
                                                                <asp:BoundField DataField="docente" HeaderText="Docente" ItemStyle-CssClass="text-capitalize" />
                                                                <asp:BoundField DataField="correo" HeaderText="Correo" />
                                                            </Columns>

                                                        </asp:GridView>
                                                        <!--=============================== END GRIDVIEW =================================-->

                                                    </div>
                                                </div>
                                            </div>
                                        </div>




                                        <div class="card mt-3" runat="server" id="agregarDocentesId">
                                            <div class="card-body">

                                                <h4 class="card-title">Asignaciones
                                                    
                                                </h4>
                                                <p class="card-description">
                                                    Para agregar un docente al curso haga click sobre el icono.
                                                </p>
                                                <div class="row" style="padding: 10px">
                                                    <!--=============================== GRIDVIEW =================================-->
                                                    <div class="row justify-content-center align-items-center table-responsive ml-1 table-borderless">
                                                        <asp:GridView ID="gvListarDocentes" runat="server" CssClass="table table-hover"
                                                            AutoGenerateColumns="false" BorderStyle="None" BackColor="#EFE9E9" HeaderStyle-BackColor="#FFCCCC"
                                                            OnRowCommand="gvListarDocentes_RowCommand" DataKeyNames="idUsuario, idMateria"
                                                            ForeColor="#333333" >

                                                            <Columns>
                                                                <asp:BoundField DataField="idUsuario" HeaderText="ID Usuario" ItemStyle-CssClass="text-capitalize" Visible="false" />
                                                                <asp:BoundField DataField="idMateria" HeaderText="ID Materia" ItemStyle-CssClass="text-capitalize" Visible="false" />
                                                                <asp:BoundField DataField="materia" HeaderText="Asignatura" ItemStyle-CssClass="text-capitalize" />
                                                                <asp:BoundField DataField="docente" HeaderText="Docente" ItemStyle-CssClass="text-capitalize" />
                                                                <asp:BoundField DataField="correo" HeaderText="Correo" />

                                                                <asp:TemplateField HeaderText="Agregar">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbEdit" runat="server" CssClass=""
                                                                            CommandName="agregar"
                                                                            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CausesValidation="false">
                                                                                <i class="fas fa-check menu-icon" style="padding-left:25px;"></i>
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
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
                                        <asp:Label ID="lblFechaAsignatura" runat="server" Text=""></asp:Label>
                                                <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. Todos los derechos reservados.</span>
                                            <%--                                    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="far fa-heart text-danger"></i></span>--%>
                                        </div>
                                    </footer>
                                </div>






                            </div>
                        </div>
                    </div>








                    <!-- content-wrapper ends -->
                    <!-- partial:../../partials/_footer.html -->
                    <%-- <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 
                                <asp:Label ID="lblRegistrofecha" runat="server" Text=""></asp:Label>
                                <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. All rights reserved.</span>
                        </div>
                    </footer>--%>
                    <!-- partial -->
                </div>

                <!--=============================== END REGISTRAR ALUMNOS =================================-->


                <!--=============================== SELECCION CURSO =================================-->

                <div class="main-panel" id="seleccionId" runat="server">
                    <div class="content-wrapper">
                        <div class="page-header">
                            <h3 class="page-title">Registro 
                            </h3>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="docente.aspx" style="color: #de3c2f">Listar</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Registro</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-12 grid-margin">

                                <asp:LinkButton>hola</asp:LinkButton>

                                <div class="card col-6">
                                    <div class="card-body">
                                        <h4 class="card-title">Alumnos</h4>
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
                                        <div class="mt-5 mr-3">
                                            <button type="button" class="btn btn-outline-danger float-right" data-toggle="modal" data-target="#staticBackdropRegistro">
                                                Guardar
                                            </button>
                                            <asp:Button ID="btnCancelarRegistro" CssClass="btn btn-outline-dark float-right mr-3" CausesValidation="false" runat="server" Text="Cancelar" />
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
