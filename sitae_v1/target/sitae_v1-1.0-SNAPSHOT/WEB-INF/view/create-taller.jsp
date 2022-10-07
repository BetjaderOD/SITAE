    <%--
  Created by IntelliJ IDEA.
  User: betja
  Date: 18/08/2022
  Time: 07:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Crear Taller</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <style>

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

<div class="container mt-3" >
    <h1 class="text-center" style="color: white">Crear Taller</h1>
    <div class="row justify-content-center" style="background: transparent">
        <div class="col-4" style="width:500px; background: white;  border-radius: 5px;">

            <form action="save-taller" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="controlName" class="form-label">Nombre: </label>
                    <input type="text" class="form-control" id="controlName" name="name" required>
                </div>

                <label for="controlName" class="form-label">Tipo: </label>
                <select class="form-select" aria-label="Default select example" name="type" placeholder="eleccione...">

                    <option value="Deportivo">Deportivo</option>
                    <option value="Cultural" >Cultural</option>
                </select>


                <div class="mb-3">
                    <label for="controlPlace" class="form-label">Lugar: </label>
                    <input type="text" class="form-control" id="controlPlace" name="place" required>
                </div>

                <div class="mb-3">

                    <label for="controlName" class="form-label">Horario: </label>
                    <select class="form-select" aria-label="Default select example" name="horario" placeholder="Seleccione...">

                        <option value="8:00-10:00 Am">8:00-10:00 Am</option>
                        <option value="10:00-12:00 Am" >10:00-12:00 Am</option>
                        <option value="13:00-15:00 Pm">13:00-15:00 Pm</option>
                        <option value="15:00-17:00 Pm" >15:00-17:00 Pm</option>
                    </select>
                    <div class="mb-3">
                        <label for="photo-taller" class="form-label">Foto del taller:</label>
                        <input type="file" class="form-control" id="photo-taller"  name="photo" required>
                    </div>

                </div>

                <button type="submit" class="btn btn-primary">Registrar</button>
                <button type="reset" class="btn btn-danger">Cancelar</button>
                <a href="javascript:history.back()"> Volver Atrás</a>

            </form>


        </div>
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