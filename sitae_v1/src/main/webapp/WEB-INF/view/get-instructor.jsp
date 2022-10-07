<%--
  Created by IntelliJ IDEA.
  User: betja
  Date: 19/08/2022
  Time: 02:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registrar Instructor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <style>
        h1{
            color: black;
        }
        body{

            font-family: 'Montserrat', sans-serif;

            background: linear-gradient(60deg , #012d5f 50%, #029475 50%);
        }
        div{

            background: white;
        }
    </style>
</head>
<body>

<div class="container mt-3" style="width: 700px;  border-radius: 5px; ">

    <h1 class="text-center">Ingresar Instructor</h1>

    <div class="row justify-content-center" >
        <div class="col-4">

            <form action="update-instructor" method="post">

                <input type="hidden" name="id" value="${instructorX.id}">

                <div class="mb-3">
                    <label for="controlName" class="form-label">Nombre: </label>
                    <input type="text" class="form-control" id="controlName" name="name" value="${instructorX.name}" required/>
                </div>
                <div class="mb-3">
                    <label for="controlEmail" class="form-label">email: </label>
                    <input type="text" class="form-control" id="controlEmail" name="email" value="${instructorX.email}" required/>

                </div>
                <div class="mb-3">
                    <label for="txtPassword"  value="form-label">password: </label>
                    <div class="input-group">

                        <input ID="txtPassword" type="Password" Class="form-control" name="password" value="${instructorX.password}">
                        <div class="input-group-append">
                            <button id="show_password" class="btn btn-primary" type="button" onclick="mostrarPassword()">
                                <span class="fa fa-eye-slash icon"></span> </button>
                        </div>
                    </div>
                </div>




                <button type="submit" class="btn btn-primary">Registrar</button>
                <button type="reset" class="btn btn-danger">Cancelar</button>
                <a href="javascript:history.back()"> Volver Atrás</a>

            </form>


        </div>
    </div>
</div>
<script type="text/javascript">
    function mostrarPassword(){
        var cambio = document.getElementById("txtPassword");
        if(cambio.type == "password"){
            cambio.type = "text";
            $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
        }else{
            cambio.type = "password";
            $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
        }
    }

    $(document).ready(function () {
        //CheckBox mostrar contraseña
        $('#ShowPassword').click(function () {
            $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
        });
    });
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>

