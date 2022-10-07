<%--
  Created by IntelliJ IDEA.
  User: betja
  Date: 19/08/2022
  Time: 02:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registrar Instructor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
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
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="inicio-admin.jsp">Back</a>
                    </li>
                </ul>
                <form action="logout" class="d-flex" role="search">
                    <button class="btn btn btn-success" type="submit">Salir</button>
                </form>
            </div>
        </div>
    </nav>
</header>

<div class="container mt-3" style="width: 700px;  border-radius: 5px;">

    <h1 class="text-center" style="color: white">Ingresar Instructor</h1>

    <div class="row justify-content-center" style="background: transparent">
        <div class="col-4" style="width:500px; background: white;  border-radius: 5px;">

            <form action="save-instructor" method="post">
                <div class="mb-3">
                    <label for="controlName" class="form-label">Nombre: </label>
                    <input type="text" class="form-control" id="controlName" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="controlEmail" class="form-label">email: </label>
                    <input type="text" class="form-control" id="controlEmail" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="controlPassword" class="form-label">Contaseña </label>
                    <input type="text" class="form-control" id="controlPassword" name="password" required>
                </div>

                <button type="submit" class="btn btn-primary">Registrar</button>
                <button type="reset" class="btn btn-danger">Cancelar</button>
                <a href="javascript:history.back()"> Volver Atrás</a>
            </form>


        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
<%

    if (request.getSession().getAttribute("rol") != "admin") {
        response.sendRedirect("home");
    }
%>
