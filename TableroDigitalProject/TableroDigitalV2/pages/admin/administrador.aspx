<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="administrador.aspx.cs" Inherits="TableroDigitalV2.pages.admin.administrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>administrador</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../resources/admin/vendors/iconfonts/font-awesome/css/all.min.css" />
    <link rel="stylesheet" href="../../resources/admin/vendors/css/vendor.bundle.base.css" />
    <link rel="stylesheet" href="../../resources/admin/vendors/css/vendor.bundle.addons.css" />
    <!-- endinject -->
    <!-- plugin css for this page -->
    <a href="admin.aspx">admin.aspx</a>
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../resources/admin/css/style.css" />
    <!-- endinject -->
    <link rel="shortcut icon" href="http://www.urbanui.com/" />
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
                        <img src="../../resources/img/LogoconRellenoTextoGris.png" alt="logo" />
                        <a class="navbar-brand brand-logo-mini" href="#">
                            <img src="../../resources/img/faviconMesa de trabajo 1.svg" alt="logo" /></a>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-stretch">
                    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                        <span class="fas fa-bars"></span>
                    </button>

                    <ul class="navbar-nav navbar-nav-right">
                        <li class="nav-item nav-profile dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                                <img src="../../resources/admin/images/faces/face5.png" alt="profile" />
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown mt-3" aria-labelledby="profileDropdown">
                                <a class="dropdown-item" style="padding-top: 0px;">
                                    <asp:LinkButton ID="lbCerrarSesion" runat="server" CssClass="btn btn-default btn-cerrar-sesion"
                                        OnClick="lbCerrarSesion_Click" CausesValidation="false" ForeColor="#DE3C2F">
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
                                    <img src="../../resources/admin/images/faces/face5.png" alt="image" />
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
                            <a class="nav-link active" href="#">
                                <i class="fa fa-home menu-icon"></i>
                                <span class="menu-title active">Inicio</span>
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
                                    <li class="nav-item"><a class="nav-link" href="alumno/alumno.aspx">Alumno</a></li>
                                    <li class="nav-item"><a class="nav-link" href="docente/docente.aspx">Docente</a></li>
                                    <li class="nav-item"><a class="nav-link" href="acudiente/acudiente.aspx">Acudiente</a></li>
                                </ul>
                            </div>
                        </li>
                        <%-- <li class="nav-item">
                            <a class="nav-link" href="usuario/usuario.aspx">
                                <i class="fas fa-user-tie menu-icon"></i>
                                <span class="menu-title">Usuario</span>
                            </a>
                        </li>--%>
                        <li class="nav-item">
                            <a class="nav-link" href="curso/curso.aspx">
                                <i class="fas fa-school menu-icon"></i>
                                <span class="menu-title">Curso</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="asignatura/asignatura.aspx">
                                <i class="fas fa-book-open menu-icon"></i>
                                <span class="menu-title">Asignatura</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="page-header">
                            <h3 class="page-title">Principal
                            </h3>
                        </div>

                        <div>
                        </div>


                        <div class="row grid-margin">
                            <div class="col-12">
                                <div class="card card-statistics">
                                    <div class="card-body">
                                        <div class="d-flex flex-column flex-md-row align-items-center justify-content-between">
                                            <div class="statistics-item">
                                                <p>
                                                    <i class="icon-sm fa fa-user mr-2"></i>
                                                    Matriculados 
                                                    <asp:Label ID="lblFechaNotificaciones" runat="server" Text=""></asp:Label>
                                                </p>
                                                <h2>
                                                    <asp:Label ID="lblConteoAlumnos" runat="server" Text=""></asp:Label>

                                                </h2>
<%--                                                <label class="badge badge-outline-success badge-pill">2.7% increase</label>--%>
                                            </div>
                                            <div class="statistics-item">
                                                <p>
                                                   <%-- <i class="icon-sm fas fa-hourglass-half mr-2"></i>--%>
                                                    <i class="icon-sm fa fa-user mr-2"></i>
                                                    Pendientes
                                                    <asp:Label ID="lblFechaAlPendientes" runat="server" Text=""></asp:Label>
                                                </p>
                                                <h2>
                                                    <asp:Label ID="lblConteoPendientes" runat="server" Text=""></asp:Label>
                                                </h2>
<%--                                                <label class="badge badge-outline-success badge-pill">12% increase</label>--%>
                                            </div>
                                              <div class="statistics-item">
                                                <p>
                                                    <%--<i class="icon-sm fas fa-hourglass-half mr-2"></i> --%>  
                                                    <i class="icon-sm fa fa-user mr-2"></i>
                                                    Promedio
                                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                                </p>
                                                <h2>
                                                    <asp:Label ID="lblPromedioAlto" runat="server" Text=""></asp:Label>
                                                </h2>
<%--                                                <label class="badge badge-outline-success badge-pill">12% increase</label>--%>
                                            </div>
                                            <div class="statistics-item">
                                                <p>
                                                    <i class="icon-sm fa fa-user mr-2"></i>
                                                    Docentes
                                                    <asp:Label ID="lblFechaDocentes" runat="server" Text=""></asp:Label>
                                                </p>
                                                <h2>
                                                    <asp:Label ID="lblConteoDocentes" runat="server" Text=""></asp:Label>
                                                </h2>
<%--                                                <label class="badge badge-outline-danger badge-pill">30% decrease</label>--%>
                                            </div>
                                            
                                          
                                           <%-- <div class="statistics-item">
                                                <p>
                                                    <i class="icon-sm fas fa-chart-line mr-2"></i>
                                                    Sales
                       
                                                </p>
                                                <h2>9000</h2>
                                                <label class="badge badge-outline-success badge-pill">10% increase</label>
                                            </div>
                                            <div class="statistics-item">
                                                <p>
                                                    <i class="icon-sm fas fa-circle-notch mr-2"></i>
                                                    Pending
                       
                                                </p>
                                                <h2>7500</h2>
                                                <label class="badge badge-outline-danger badge-pill">16% decrease</label>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                      <%--  <div class="row">
                            <div class="col-md-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">
                                            <i class="fas fa-gift"></i>
                                            Orders
                                        </h4>
                                        <canvas id="orders-chart"></canvas>
                                        <div id="orders-chart-legend" class="orders-chart-legend"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">
                                            <i class="fas fa-chart-line"></i>
                                            Sales
                                        </h4>
                                        <h2 class="mb-5">56000 <span class="text-muted h4 font-weight-normal">Sales</span></h2>
                                        <canvas id="sales-chart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 
                                <asp:Label ID="lblFechaFooter" runat="server" Text=""></asp:Label>
                                <a href="https://www.urbanui.com/" target="_blank" style="color: #de3c2f">Tablero Digital</a>. Todos los derechos reservados.</span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->

    </form>

    <!-- plugins:js -->
    <script src="../../resources/admin/vendors/js/vendor.bundle.base.js"></script>
    <script src="../../resources/admin/vendors/js/vendor.bundle.addons.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <!-- End plugin js for this page-->
    <!-- inject:js -->
    <script src="../../resources/admin/js/off-canvas.js"></script>
    <script src="../../resources/admin/js/hoverable-collapse.js"></script>
    <script src="../../resources/admin/js/misc.js"></script>
    <script src="../../resources/admin/js/settings.js"></script>
    <script src="../../resources/admin/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="../../resources/admin/js/dashboard.js"></script>
    <!-- End custom js for this page-->
</body>
</html>
