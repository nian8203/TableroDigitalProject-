<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="docente-u.aspx.cs" Inherits="TableroDigitalV2.pages.docente.docente1" %>

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
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <asp:HiddenField ID="hfNombreCurso" runat="server" />


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
                                        Docente
                                    </p>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="docente-u.aspx">
                                <i class="fa fa-home menu-icon"></i>
                                <span class="menu-title">Inicio</span>
                            </a>
                        </li>
                        <%-- <li class="nav-item d-none d-lg-block">
                            <a class="nav-link active" data-toggle="collapse" href="#sidebar-layouts" aria-expanded="false" aria-controls="sidebar-layouts">
                                <i class="fas fa-user-tie menu-icon active"></i>
                                <span class="menu-title active">Usuario</span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="collapse" id="sidebar-layouts">
                                <ul class="nav flex-column sub-menu">
                                    <li class="nav-item"><a class="nav-link" href="../alumno/alumno.aspx">Alumno</a></li>
                                    <li class="nav-item"><a class="nav-link active" href="#">Docente</a></li>
                                    <li class="nav-item"><a class="nav-link" href="../acudiente/acudiente.aspx">Acudiente</a></li>
                                </ul>
                            </div>
                        </li>--%>
                        <%--<li class="nav-item">
                            <a class="nav-link" href="docente-u.aspx">
                                <i class="fas fa-user-tie menu-icon"></i>
                                <span class="menu-title">Cursos</span>
                            </a>
                        </li>--%>
                        <li class="nav-item">
                            <a class="nav-link" href="docente-u.aspx">
                                <i class="fas fa-school menu-icon"></i>
                                <span class="menu-title">Cursos</span>
                            </a>
                        </li>
                        <%-- <li class="nav-item">
                            <a class="nav-link" href="../asignatura/asignatura.aspx">
                                <i class="fas fa-book-open menu-icon"></i>
                                <span class="menu-title">Asignatura</span>
                            </a>
                        </li>--%>
                    </ul>
                </nav>





                <!--=============================== CREAR EVIDENCIA =================================-->

                <div class="main-panel" runat="server" id="listarId">
                    <div class="content-wrapper">
                        <div class="page-header">
                            <h3 class="page-title">Cursos</h3>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <%--                                    <li class="breadcrumb-item"><a href="docente.aspx" style="color: #de3c2f">Listar</a></li>--%>
                                    <%-- <li class="breadcrumb-item" aria-current="page">
                                        <asp:LinkButton ID="lbListarBreadCrumb" runat="server" CssClass="breadcrumb-item" OnClick="lbListarBreadCrumb_Click">Listar</asp:LinkButton>
                                    </li>--%>
                                    <%--                                    <li class="breadcrumb-item">Docentes</li>--%>
                                </ol>
                            </nav>
                        </div>


                        <div class="row">
                            <div class="col-12 grid-margin">





                                <div class="card-deck mt-3" id="card1" runat="server">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="card-title mt-2" style="font-size: 20px; font-weight: 500">
                                                Curso
                                                <asp:Label ID="lblCurso1" runat="server" Text=""></asp:Label>
                                                <asp:LinkButton ID="regNotas1" runat="server" CssClass="btn btn-danger float-right" Height="40"
                                                    OnClick="regNotas1_Click">
                                                    Registro notas
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="crearEviencia1" runat="server" CssClass="btn btn-danger float-right mr-3" Height="40"
                                                    OnClick="crearEviencia1_Click">
                                                    <%--<i class="fas fa-plus"></i>&nbsp;&nbsp;Evidencias--%>
                                                    Crear evidencia
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="card-deck mt-3" id="card2" runat="server">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="card-title mt-2" style="font-size: 20px; font-weight: 500">
                                                Curso
                                                <asp:Label ID="lblCurso2" runat="server" CssClass="" Text=""></asp:Label>
                                                <asp:LinkButton ID="regNotas2" runat="server" CssClass="btn btn-danger float-right" Height="40"
                                                    OnClick="regNotas2_Click">
                                                    <%--<i class="far fa-eye"></i>&nbsp;&nbsp;Alumnos--%>
                                                    Registro notas
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="crearEviencia2" runat="server" CssClass="btn btn-danger float-right mr-3" Height="40"
                                                    OnClick="crearEviencia2_Click">
                                                    <%--<i class="fas fa-plus"></i>&nbsp;&nbsp;Evidencias--%>
                                                    Crear evidencia
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-deck mt-3" id="card3" runat="server">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="card-title mt-2" style="font-size: 20px; font-weight: 500">
                                                Curso
                                                <asp:Label ID="lblCurso3" runat="server" CssClass="" Text=""></asp:Label>
                                                <asp:LinkButton ID="regNotas3" runat="server" CssClass="btn btn-danger float-right" Height="40"
                                                    OnClick="regNotas3_Click">
                                                    <%--<i class="far fa-eye"></i>&nbsp;&nbsp;Alumnos--%>
                                                    Registro notas
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="crearEviencia3" runat="server" CssClass="btn btn-danger float-right mr-3" Height="40"
                                                    OnClick="crearEviencia3_Click">
                                                    <%--<i class="fas fa-plus"></i>&nbsp;&nbsp;Evidencias--%>
                                                    Crear evidencia
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-deck mt-3" id="card4" runat="server">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="card-title mt-2" style="font-size: 20px; font-weight: 500">
                                                Curso
                                                <asp:Label ID="lblCurso4" runat="server" CssClass="" Text=""></asp:Label>
                                                <asp:LinkButton ID="regNotas4" runat="server" CssClass="btn btn-danger float-right" Height="40"
                                                    OnClick="regNotas4_Click">
                                                    <%--<i class="far fa-eye"></i>&nbsp;&nbsp;Alumnos--%>
                                                    Registro notas
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="crearEviencia4" runat="server" CssClass="btn btn-danger float-right mr-3" Height="40"
                                                    OnClick="crearEviencia4_Click">
                                                    <%--<i class="fas fa-plus"></i>&nbsp;&nbsp;Evidencias--%>
                                                    Crear evidencia
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-deck mt-3" id="card5" runat="server">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="card-title mt-2" style="font-size: 20px; font-weight: 500">
                                                Curso
                                                <asp:Label ID="lblCurso5" runat="server" CssClass="" Text=""></asp:Label>
                                                <asp:LinkButton ID="regNotas5" runat="server" CssClass="btn btn-danger float-right" Height="40"
                                                    OnClick="regNotas5_Click">
                                                    <%--<i class="far fa-eye"></i>&nbsp;&nbsp;Alumnos--%>
                                                    Registro notas
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="crearEviencia5" runat="server" CssClass="btn btn-danger float-right mr-3" Height="40"
                                                    OnClick="crearEviencia5_Click">
                                                    <%--<i class="fas fa-plus"></i>&nbsp;&nbsp;Evidencias--%>
                                                    Crear evidencia
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-deck mt-3" id="card6" runat="server">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="card-title mt-2" style="font-size: 20px; font-weight: 500">
                                                Curso
                                                <asp:Label ID="Label4" runat="server" CssClass="" Text=""></asp:Label>
                                                <asp:LinkButton ID="regNotas6" runat="server" CssClass="btn btn-danger float-right" Height="40"
                                                    OnClick="regNotas6_Click">
                                                    <%--<i class="far fa-eye"></i>&nbsp;&nbsp;Alumnos--%>
                                                    Registro notas
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="crearEviencia6" runat="server" CssClass="btn btn-danger float-right mr-3" Height="40"
                                                    OnClick="crearEviencia6_Click">
                                                    <%--<i class="fas fa-plus"></i>&nbsp;&nbsp;Evidencias--%>
                                                    Crear evidencia
                                                </asp:LinkButton>
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
                                </div>
                            </footer>

                        </div>
                        <!-- partial formulario de editar-->
                        <!-- main-panel ends -->
                    </div>
                </div>

                <!--=============================== END LISTAR DOCENTES =================================-->



                <!--===============================  CREAR EVIDENCIA =================================-->

                <div class="main-panel" id="evidenciaId" runat="server">
                    <div class="content-wrapper">
                        <div class="page-header">
                            <h3 class="page-title">Evidencias
                            </h3>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">

                                    <%--                                    <li class="breadcrumb-item"><a href="../notas/notas.aspx" class="breadcrumb-item" style="color: #de3c2f">Notas</a>--%>
                                    <li class="breadcrumb-item">
                                        <asp:LinkButton ID="lbNotasEvBc" runat="server" ForeColor="#de3c2f" OnClick="lbNotasEvBc_Click" CausesValidation="false">Cursos</asp:LinkButton>
                                    </li>
                                    <li class="breadcrumb-item " aria-current="page" style="color: #333333">Evidencias</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Nueva evidencia curso
                                            <asp:Label ID="lblCursoCrearEvidencia" runat="server" Text=""></asp:Label>
                                        </h4>
                                        <p class="card-description">
                                            Ingrese una breve descripción.
                                        </p>
                                        <%--<div class="row mb-3">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Asignatura</label>
                                                    <div class="col-sm-9">
                                                        <asp:DropDownList ID="ddlAsignaturas" runat="server" CssClass="form-control text-capitalize" Height="35px"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>--%>
                                        <div class="row mb-3">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group row">
                                                    <label class="col-sm-3 col-form-label">Descripción</label>
                                                    <div class="col-sm-9">
                                                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" CausesValidation="True" MaxLength="200" TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="form-text" ID="rfvDescripcion" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="txtDescripcion"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <div class="col-sm-12">
                                                        <button type="button" class="btn btn-outline-danger float-right" data-toggle="modal" data-target="#staticBackdropAsignarDirector">
                                                            Guardar
                                                        </button>
                                                        <%--                                                        <asp:Button ID="btnCancelar" CssClass="btn btn-outline-dark float-right mr-3" CausesValidation="false" runat="server" Text="Cancelar" />--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>





                                        <!-- Modal -->
                                        <div class="modal fade" id="staticBackdropAsignarDirector" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabelAsignarDirector" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="staticBackdropLabelAsignarDirector" style="color: rgba(0,0,0,.4);">Registro de Datos</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>


                                                    <div class="text-center">
                                                        <span style="font-size: 65px; color: Dodgerblue;">
                                                            <i class="fas fa-question-circle" style="margin-top: 30px; color: #0B94F7"></i>
                                                        </span>
                                                    </div>
                                                    <div class="modal-body" style="padding-top: 0px">
                                                        <h3 class="mt-4" style="color: rgba(0,0,0,.4);">Los datos seran registrados!</h3>
                                                        <h5 class=" mt-2 text-center" style="color: rgba(0,0,0,.4);">Desea continuar?</h5>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                        <asp:LinkButton ID="lbCrearEvidencia" runat="server" CssClass="btn btn-outline-danger"
                                                            Width="150" CausesValidation="True" Height="40px" Font-Size="Large"
                                                            OnClick="lbCrearEvidencia_Click">
                                                                 Guardar
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:HiddenField ID="hfIdDocente" runat="server" />
                                        <asp:HiddenField ID="hfIdCurso" runat="server" />
                                        <asp:HiddenField ID="hfCurso" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">



                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Evidencias           
                                                            
                                                          <%--  <div class="navbar-menu-wrapper d-flex align-items-stretch float-right">
                                                                <ul class="navbar-nav">
                                                                    <li class="nav-item nav-search d-none d-md-flex">
                                                                        <div class="nav-link">
                                                                            <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                    <span class="input-group-text">
                                                                                        <asp:LinkButton ID="lbEvidenciasPorCurso" runat="server" CausesValidation="false">
                                                                                             <i class="fas fa-search menu-icon"></i>
                                                                                        </asp:LinkButton>
                                                                                    </span>
                                                                                </div>
                                                                                <asp:TextBox ID="txtBuscarPorCursoGv" runat="server" CssClass="form-control" placeholder="Ingrese el curso"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>--%>

                                        </h4>
                                        <p class="card-description">
                                        </p>


                                        <!--=============================== GRIDVIEW =================================-->
                                        <div class="row justify-content-center align-items-center table-responsive ml-1 table-borderless">
                                            <asp:GridView ID="gvListarEvidencias" runat="server" CssClass="table table-hover" AllowPaging="True"
                                                PageSize="10" OnPageIndexChanging="gvListarEvidencias_PageIndexChanging"
                                                OnRowCommand="gvListarEvidencias_RowCommand"
                                                AutoGenerateColumns="false" BorderStyle="None" BackColor="#EFE9E9" HeaderStyle-BackColor="#FFCCCC"
                                                ForeColor="#333333">

                                                <Columns>
                                                    <asp:BoundField DataField="id" HeaderText="Codigo" />
                                                    <asp:BoundField DataField="descripcion" HeaderText="Descripcion" ItemStyle-CssClass="text-capitalize" />
                                                    <asp:BoundField DataField="fecha" HeaderText="Fecha" ItemStyle-CssClass="text-capitalize" />
                                                    <asp:TemplateField HeaderText="Accion" ItemStyle-CssClass="align-items-center" Visible="false">
                                                        <ItemTemplate>

                                                            <asp:LinkButton ID="lbEdit" runat="server" CssClass="" CausesValidation="false"
                                                                CommandName="ver"
                                                                CommandArgument="<%# ((GridViewRow)Container).RowIndex %>">
                                                  <i class="far fa-eye menu-icon" aria-hidden="true" style="padding-left:12px;"></i>
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="lbDelete" runat="server" CssClass="" CausesValidation="false"
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
                                            <%--  --%>



                                            <asp:HiddenField ID="HiddenField2" runat="server" />
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
                                    <asp:Label ID="lblDateDirectorCurso" runat="server" Text=""></asp:Label>
                                    <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. Todos los derechos reservados.</span>
                                <%--                                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="far fa-heart text-danger"></i></span>--%>
                            </div>
                        </footer>
                        <!-- partial -->
                    </div>


                    <!--=============================== END CREAR EVIDENCIA =================================-->

                    <asp:GridView ID="gvListarAlumnosPorCurso" runat="server"></asp:GridView>
                    <!-- page-body-wrapper ends -->
                </div>






                <!--=============================== REGISTRAR DOCENTES =================================-->

                <div class="main-panel" id="registrarId" runat="server">
                    <div class="content-wrapper">
                        <div class="page-header">
                            <h3 class="page-title">Evidencias 
                            </h3>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <%--                                    <li class="breadcrumb-item"><a href="docente.aspx" style="color: #de3c2f">Cursos</a></li>--%>
                                    <li class="breadcrumb-item">
                                        <asp:LinkButton ID="lbCursosNotasBc" runat="server" ForeColor="#de3c2f" OnClick="lbCursosNotasBc_Click" CausesValidation="false">Cursos</asp:LinkButton>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page" style="color: #333333">Notas</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-12 grid-margin">

                                <div class="card">
                                    <div class="card-body">

                                        <h2 class="card-title">Curso 
                                           <asp:Label ID="lblCursoCard" runat="server" Text=""></asp:Label>


                                            <%-- <ul class="navbar-nav float-right">--%>
                                            <%--<li class="nav-item nav-search d-none d-md-flex float-right">--%>
                                            <%-- <div class="nav-link float-right mr-2" style="padding-top: 0px;">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="padding-top: 10px;">
                                            <asp:LinkButton ID="lbBuscarNavBarGv" runat="server" Height="10">
                                        <i class="fas fa-search menu-icon"></i>
                                            </asp:LinkButton>
                                        </span>
                                        <asp:TextBox ID="txtBuscarNavbarGv" runat="server" CssClass="form-control" Height="40" Width="150" placeholder="Buscar"></asp:TextBox>

                                    </div>

                                </div>
                            </div>--%>
                                            <%-- </li>--%>
                                            <%-- </ul>--%>


                                        </h2>
                                        <%--<p class="card-description">
                                            Agregue, edite o elimine datos.
                                        </p>--%>

                                        <!--=============================== GRIDVIEW LISTAR EVIDENCIAS =================================-->
                                        <div id="listarEvidenciasId" runat="server">
                                            <p class="card-description">
                                                Seleccione la evidencia a evaluar.
                                            </p>

                                            <div class="row">
                                                <div class="row justify-content-center align-items-center table-responsive ml-1 table-borderless">
                                                    <asp:GridView ID="gvListarAlumnos" runat="server" CssClass="table table-hover" AllowPaging="True"
                                                        OnPageIndexChanging="gvListarAlumnos_PageIndexChanging"
                                                        OnRowCommand="gvListarAlumnos_RowCommand" PageSize="10"
                                                        AutoGenerateColumns="false" BorderStyle="None" BackColor="#EFE9E9" HeaderStyle-BackColor="#FFCCCC"
                                                        ForeColor="#333333">


                                                        <Columns>
                                                            <asp:BoundField DataField="id" HeaderText="Codigo" />
                                                            <asp:BoundField DataField="descripcion" HeaderText="Descripción" ItemStyle-CssClass="text-lowercase" />
                                                            <asp:BoundField DataField="fecha" HeaderText="Fecha" ItemStyle-CssClass="text-lowercase" />
                                                            <asp:TemplateField HeaderText="Accion" ItemStyle-CssClass="align-items-center">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="" CausesValidation="false"
                                                                        CommandName="ver"
                                                                        CommandArgument="<%# ((GridViewRow)Container).RowIndex %>">
                                                 <i class="fas fa-eye menu-icon" style="padding-left:12px;"></i>
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton ID="lbEdit" runat="server" CssClass="" CausesValidation="false"
                                                                        CommandName="editar"
                                                                        CommandArgument="<%# ((GridViewRow)Container).RowIndex %>">
                                                 <i class="fas fa-pencil-alt menu-icon" style="padding-left:12px;"></i>
                                                                    </asp:LinkButton>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%-- <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Accion" ShowHeader="True" Text="Ver" />--%>
                                                        </Columns>


                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                        <!--=============================== END GRIDVIEW LISTAR EVIDENCIAS =================================-->






                                        <!--=============================== GRIDVIEW LISTAR ALUMNOS EVIDENCIA =================================-->
                                        <div runat="server" id="listarAlumnosPorCursoId">
                                            <p class="card-description">
                                                Evidencia:
                                                 <asp:Label ID="lblDescripcionEvidencia" runat="server" Text=""></asp:Label>
                                            </p>

                                            <div class="row">
                                                <div class="row justify-content-center align-items-center table-responsive ml-1 table-borderless">
                                                    <asp:GridView ID="gvListarAlumnosPorEvidencia" runat="server" CssClass="table table-hover" AllowPaging="True"
                                                        OnPageIndexChanging="gvListarAlumnosPorEvidencia_PageIndexChanging"
                                                        OnRowCommand="gvListarAlumnosPorEvidencia_RowCommand" PageSize="10"
                                                        AutoGenerateColumns="false" BorderStyle="None" BackColor="#EFE9E9" HeaderStyle-BackColor="#FFCCCC"
                                                        ForeColor="#333333">


                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Acción" ItemStyle-CssClass="align-items-center" ItemStyle-Width="50">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lbVer" runat="server" CssClass="" CausesValidation="false"
                                                                        CommandName="guardar"
                                                                        CommandArgument="<%# ((GridViewRow)Container).RowIndex %>">
                                                 <i class="fas fa-check menu-icon" style="padding-left:12px;"></i>
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Nota">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtNota" runat="server" Width="35" CssClass="text-center" Text='<%# Eval("nota") %>'></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="identificacion" HeaderText="Documento" />
                                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" ItemStyle-CssClass="text-capitalize" />

                                                            <%-- <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Accion" ShowHeader="True" Text="Ver" />--%>
                                                        </Columns>

                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                        <!--=============================== END GRIDVIEW LISTAR ALUMNOS EVIDENCIA =================================-->



                                        <asp:HiddenField ID="hfidEvidActualizarNota" runat="server" />
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
                                <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. Todos los derechos reservados.</span>
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
