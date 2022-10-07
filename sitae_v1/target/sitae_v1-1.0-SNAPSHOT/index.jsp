
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SITAE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>

<!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


<style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@600&family=Rubik&display=swap');

    h2{
        margin-top: 2px;
    }
    input::placeholder{
        color: black;
        opacity: 0.70 ;
    }
    #tittle{
        color: white;
        font-size: 7px;
        margin-bottom: 60px;
        letter-spacing: 2px;
        margin-top: -20px;
        text-align: center;
    }

    body{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Montserrat', sans-serif;

        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        background: linear-gradient(60deg , #012d5f 50%, #029475 50%);
    }

    form{
        display: flex;
        flex-direction: column;
        background-color: #d9d9d9;
        text-align: center;
        padding: 30px 15px;
        -webkit-box-shadow: 7px -6px 0px 7px #A6A6A6;
        box-shadow: 7px -6px 0px 7px #A6A6A6;
        border-radius: 19px;
    }

    .logo-utez{
        width: 40%;
        left: calc(50% - 50%);
        display: block;
        margin: auto;
        margin-bottom: -10px;
        margin-top: 25px;
    }

    h1{
        margin: 20px;
        color: #545454;
        margin-top: -20px;
        margin-bottom: 5px;

    }

    form input{
        border: none;
        background-color: #a6a6a6;
    }

    i{
        font-size: 30px;
        color: #012d5f;
    }

    button{
        color: #fff;
        border: none;
        background-color: #012d5f;
        padding: 10px 15px;
        cursor: pointer;
        font-size: 15px;
        border-radius: 10px;
    }


    .item{
        display: flex;
        margin: 20px;
        width: 300px;
        margin-right: 20px;
    }

    form{
        display: flex;
        justify-content: center;
        align-items: center;
        width: 350px;
    }

    .form-control{
        width: 300px;
    }

    a{
        text-decoration: none;
        color: white;
    }
</style>
        <form method="post" action="login">

            <h1 class="h1 mb-5 fw-normal">Iniciar sesión en SITAE</h1>
            <c:if test="${param['message']=='error'}">
                <div class="alert alert-warning">
                    Usuario y/o contraseña incorrecta
                </div>

            </c:if>

            <div class="form-floating">
                <input type="email" name="email" required class="form-control" id="floatingInput" placeholder="name@utez.edu.mx">
                <label for="floatingInput">Usuario</label>
            </div>
            <div class="form-floating">
                <input type="password" name="password" required class="form-control" id="floatingPassword" placeholder="Password">
                <label for="floatingPassword">Contraseña</label>
            </div>

            <button type="submit">Iniciar sesión</button>
            <img class="logo-utez" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Logo-utez.png/300px-Logo-utez.png" alt="Logo de UTEZ">
            <a href="registrarse.jsp" style="color: black; background: yellow; margin-top: 20px">Registrate como alumno</a>
        </form>

<footer>
<br>
    <div class="row row-col-1">
        <div class="card mb-3 bg-white bg-opacity-75" style="width: 80rem;">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBDHqj9yzcsCWp-vZ6VgSHqxS5BWniESpoOw&usqp=CAU" class="img-fluid rounded-start" alt="...">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title">About</h5>
                        <p class="card-text">SITAE es un sistema de oferta de talleres en el cual las y los estudiantes puedan inscribirse a los talleres los cuales son
                            ofertados .</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (request.getSession().getAttribute("name") != null) {
        response.sendRedirect("home");
    }
%>