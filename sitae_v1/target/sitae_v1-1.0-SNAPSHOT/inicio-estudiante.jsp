<%--
  Created by IntelliJ IDEA.
  User: xemma
  Date: 18/08/2022
  Time: 11:52 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inicio Estudiante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body{
            background: #012d5f ;
        }

        section{
            align-items: center;
            margin-top: 20px;
        }

        h2{
            color: #fff;
            text-align: center;
            margin-top: 20px;
            margin-bottom: 2px;
        }

        .tarjetaTaller{
            margin-top: 50px;
        }

        .container{
            display: flex;
            flex-wrap: wrap;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        i{
            font-size: 30px;
        }


        .myButton{
            color: #fff;
            border: none;
            background-color: #012d5f;
            padding: 10px 15px;
            cursor: pointer;
            width: auto;
            font-size: 15px;
        }

        .myButton:hover{
            background-color: #819FF7;
        }
        a{
            text-decoration: none;
        }
    </style>
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
<h2 class="tittle">Estudiante</h2>

<div class="container">
    <div class="row">
        <div class="col">
            <div class="card" style="width: 19rem;">
                <img src="https://www.hispanosnba.com/0image/620c/zach-lavine-bulls-986473.jpg"/>
                <div class="card-body">
                    <h5 class="card-title">TALLERES</h5>
                    <a id="botoni1" href="list-ofertas" class="btn btn-primary">Oferta de  talleres</a>
                </div>
            </div>
        </div>

<script src="js/talleres.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (request.getSession().getAttribute("rol") != "student") {
        response.sendRedirect("home");
    }
%>
