<%--
  Created by IntelliJ IDEA.
  User: betja
  Date: 25/08/2022
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Oferta talleres</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <style>

        h1{
            color: white;
        }
        body{
            font-family: 'Montserrat', sans-serif;
            background: #012d5f;
        }

        .cards{
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;

            justify-content: space-between;
        }

        img{
            width: 90px;
            height: 270px;
        }


    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark " style="background: #029475">
        <div class="container-fluid">
            <a class="navbar-brand" href="inicio-estudiante.jsp">SITAE</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <span class="navbar-text">
                <c:out value="${sessionScope.get('name')}"/>
            </span>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="inicio-estudiante.jsp">Estudiante</a>
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

    <h1 class="text-center">Oferta de talleres</h1>

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
    </div>
</div>



<div class="row justify-content-center" style="background: transparent;">
    <div class="col-10" style="width: 1200px;">
        <div class="cards">
        <div class="row justify-content-center">
            <c:forEach items="${list}" var="taller">
                <div class="card" style="width: 18rem;">
                    <img src="images?id=${taller.id}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><c:out value="${taller.name}"/></h5>
                        <p class="card-text"><c:out value="${taller.type}"/></p>
                        <p class="card-text"><c:out value="${taller.place}"/></p>
                        <p class="card-text"><c:out value="${taller.horario}"/></p>
                       <a class="btn btn-info" onclick="window.open('registrar-alumno-taller.jsp',
                        'popup', 'top=100, left=100, width=700, height=680, toolbar=NO, resizable=NO, Location=NO,' +
                        ' Menubar=NO, Titlebar=No, Status=NO')" rel="nofollow">Inscribirse</a>
                    </div>
                </div>
            </c:forEach>

    </div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>

<%
    if (request.getSession().getAttribute("rol") != "student") {
        response.sendRedirect("home");
    }
%>



