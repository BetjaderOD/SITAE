<%--
  Created by IntelliJ IDEA.
  User: carolinacorcino
  Date: 15/08/22
  Time: 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inicio Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
<!doctype html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Opciones de Administrador</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

        <style>
                i{
                        font-size: 33px;
                }

                body{
                     background: #012d5f;
                }

                h2{
                        color: white;
                        text-align: center;
                }

                .container{
                        margin-top: 20px;
                        display: flex;
                        justify-content: center;
                }

                .card{
                        height: 400px;
                        width: 100px;
                        margin: 50px;
                        text-align: center;
                }

                .card-title{
                        margin-top: 20px;
                }

                #botoni{
                        margin-top: 70px;
                }
                #botoni1{
                        margin-top: 70px;
                }

                img{
                        width: 130px;
                        height: 200px;
                }

        </style>
</head>
<body>
<header>
        <nav class="navbar navbar-expand-lg navbar-dark " style="background: #029475">
                <div class="container-fluid">
                        <a class="navbar-brand" href="inicio-admin.jsp">SITAE</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                        </button>
                        <span class="navbar-text">
                      <c:out value="${sessionScope.get('name')}"/>
                      </span>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item">
                                                <a class="nav-link" href="inicio-admin.jsp">Administar</a>
                                        </li>
                                </ul>
                                <form action="logout" class="d-flex" role="search">
                                        <button class="btn btn btn-success" type="submit">Salir</button>
                                </form>
                        </div>
                </div>
        </nav>
</header>
<h2>ADMINISTRAR</h2>
<div class="container">
        <div class="row">
                <div class="col">
                        <div class="card" style="width: 19rem;">
                                <img src="https://www.santepourtous.nc/images/sampledata/thematiques/diabete/espace-grand-public/solutions-au-quotidien/activite-physique-reguliere-grand.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                        <h5 class="card-title">TALLERES</h5>
                                        <a id="botoni1" href="list-taller" class="btn btn-primary">Administar</a>
                                </div>
                        </div>
                </div>
                <div class="col">
                        <div class="card" style="width: 19rem;">
                                <img src="https://cdn.milenio.com/uploads/media/2022/04/09/fernando-ortiz-cuauhtemoc-blanco-reencuentran.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                        <h5 class="card-title">INSTRUCTORES</h5>

                                        <a id="botoni" href="list-intsructor" class="btn btn-primary">Administar</a>
                                </div>
                        </div>
                </div>
        </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
<%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (request.getSession().getAttribute("rol") != "admin") {
                response.sendRedirect("home");
        }
%>
