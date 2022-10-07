<%--
  Created by IntelliJ IDEA.
  User: betja
  Date: 19/08/2022
  Time: 02:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Administrar instructores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <style>
        body{
            font-family: 'Montserrat', sans-serif;
            background: #012d5f;
            margin: auto;
            overflow: auto;
            background: linear-gradient(315deg, rgba(101,0,94,1) 3%, rgba(60,132,206,1) 38%, rgba(48,238,226,1) 68%, rgba(255,25,25,1) 98%);
            animation: gradient 15s ease infinite;
            background-size: 400% 400%;
            background-attachment: fixed;
        }
        @keyframes gradient {
            0% {
                background-position: 0% 0%;
            }
            50% {
                background-position: 100% 100%;
            }
            100% {
                background-position: 0% 0%;
            }
        }

        .wave {
            background: rgb(255 255 255 / 25%);
            border-radius: 1000% 1000% 0 0;
            position: fixed;
            width: 200%;
            height: 12em;
            animation: wave 10s -3s linear infinite;
            transform: translate3d(0, 0, 0);
            opacity: 0.8;
            bottom: 0;
            left: 0;
            z-index: -1;
        }

        .wave:nth-of-type(2) {
            bottom: -1.25em;
            animation: wave 18s linear reverse infinite;
            opacity: 0.8;
        }

        .wave:nth-of-type(3) {
            bottom: -2.5em;
            animation: wave 20s -1s reverse infinite;
            opacity: 0.9;
        }

        @keyframes wave {
            2% {
                transform: translateX(1);
            }

            25% {
                transform: translateX(-25%);
            }

            50% {
                transform: translateX(-50%);
            }

            75% {
                transform: translateX(-25%);
            }

            100% {
                transform: translateX(1);
            }
        }
        td{
            background: white;
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
<h1 class="text-center" style="color: #012d5f;">Lista de Instructores</h1>
<div class="row justify-content-center mb-2" style="width:auto">
    <div class="col-10">
        <div class="row justify-content-end">
            <div class="col-10">
                <c:if test="${param['result-save']}">
                <c:if test="${param['result-save']=='ok'}">
                bien
            </div>
            </c:if>
            <c:if test="${param['result-save']=='error'}">
            mal
        </div>
        </c:if>
        </c:if>
    </div>
    <div class="col-2 text-end" style="margin-bottom: 5px">
        <a href="create-instructor" class="btn btn-primary" >Registrar Instructor</a>
    </div>
</div>


<div class="row justify-content-center">
    <div class="col-10" style=" width: 1200px; border-radius: 7px;">
        <table class="table table-hover table-bordered table-striped">
            <thead>
            <tr>
                <th>Nombre</th>
                <th>email</th>
                <th>Acciones</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="instructor">
                <tr>
                    <td> <c:out value="${instructor.name}" /></td>
                    <td> <c:out value="${instructor.email}" /></td>
                    <td>

                        <div class="row justify-content-center">
                            <div class="col-6">
                                <a href="get-instructor?id=${instructor.id}"  class="btn btn-info">
                                    <i class="fa-solid fa-magnifying-glass"></i> Cosultar
                                </a>
                            </div>

                            <div class="col-6">
                                <form action="delete-instructor" method="post" class="d-inline">

                                    <input type="hidden" name="id" value="${instructor.id}">

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
<div>
    <div class="wave"></div>
    <div class="wave"></div>
    <div class="wave"></div>
</div>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
<%

    if (request.getSession().getAttribute("rol") != "admin") {
        response.sendRedirect("home");
    }
%>