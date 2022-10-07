<%--
  Created by IntelliJ IDEA.
  User: betja
  Date: 18/08/2022
  Time: 07:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Administrar talleres</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <style>

        h1{
            color: white;
        }
        body{
            font-family: 'Montserrat', sans-serif;
            background: #012d5f;
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
<div class="container mt-3" style="background: transparent;">

<h1 class="text-center">Lista de talleres</h1>

<div class="row justify-content-center mb-2">
    <div class="col-10">
        <div class="row justify-content-end">
            <div class="col-10">

                <c:if test="${param['result-save']}">

                <c:if test="${param['result-save']=='ok'}">
                Persona bien
            </div>
            </c:if>
            <c:if test="${param['result-save']=='error'}">
            mal
        </div>
        </c:if>
        </c:if>
    </div>
    <div class="col-2 text-end" style="margin-bottom: 5px">
        <a href="create-taller" class="btn btn-primary">Registrar taller</a>
    </div>
</div>
</div>


<div class="row justify-content-center" style="background: transparent">
    <div class="col-10" style="background: white; width: 1200px; border-radius: 7px;">
        <table class="table table-hover table-bordered table-striped">
            <thead>
            <tr>

                <th>Nombre</th>
                <th>Tipo</th>
                <th>Lugar</th>
                <th>Horario</th>
                 <th>Imagen</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="taller">
                <tr>

                    <td><c:out value="${taller.name}"/></td>
                    <td><c:out value="${taller.type}"/></td>
                    <td><c:out value="${taller.place}"/></td>
                    <td><c:out value="${taller.horario}"/></td>

                    <td class="col-2">
                        <img src="images?id=${taller.id}" class="img-thumbnail">

                    </td>


                    <td>

                        <div class="row justify-content-center">
                            <div class="col-6">
                                <a href="get-taller?id=${taller.id}"  class="btn btn-info">
                                    <i class="fa-solid fa-magnifying-glass"></i> Cosultar
                                </a>
                            </div>

                            <div class="col-6">
                                <form action="delete-taller" method="post" class="d-inline">

                                    <input type="hidden" name="id" value="${taller.id}">

                                    <button type="submit" class="btn btn-danger mt-2">
                                        <i class="fa-solid fa-trash"></i> Eliminar
                                    </button>
                                </form>
                            </div>

                        </div>



                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
<%
    if (request.getSession().getAttribute("rol") != "admin") {
        response.sendRedirect("home");
    }
%>

