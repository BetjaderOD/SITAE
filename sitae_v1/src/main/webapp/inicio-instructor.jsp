<%--
  Created by IntelliJ IDEA.
  User: betja
  Date: 24/08/2022
  Time: 01:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Talleres Asignados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
     <!-- <style>
        .bar{
            background-color: #029475;
            color: aliceblue;
            text-align: center;
            display: flex;
            justify-content: space-between;
            padding: 10px;

        }

        body{
            background: linear-gradient(60deg, #012d5f 50%, #029475 50% );
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            background-attachment: fixed;
        }

        .container-xl{
            background-color: white;
            margin-top: 20px;
        }

        .container{
            display: flex;
            justify-content: center;
            margin-top: 50px;
        }

        thead{
            font-size: 22px;
        }

        i{
            font-size: 33px;
        }

        table{
            background-color: white;
        }

        .title{
            color: aliceblue;
            text-align: center;
            margin: 20px;
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

        .card{
            box-shadow: inset;
        }

        .acreditado{
            color: white;
            background-color: green;
        }

        .no-acreditado{
            color: white;
            background-color: rgb(202, 28, 28);
        }

        button{
            justify-content: center;
        }

        nav{
            background-color: #029475;
        }
    </style> -->

    <style>
        body {
            margin: auto;
            font-family: -apple-system, BlinkMacSystemFont, sans-serif;
            overflow: auto;
            background: linear-gradient(315deg, rgba(101,0,94,1) 3%, rgba(60,132,206,1) 38%, rgba(48,238,226,1) 68%, rgba(255,25,25,1) 98%);
            animation: gradient 15s ease infinite;
            background-size: 400% 400%;
            background-attachment: fixed;
        }
        .tallerA{
            margin-top: 20px;
            margin-bottom: 20px;
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
    </style>
</head>
<body>
<!--NAVBAR-->
<nav class="navbar navbar-expand-lg navbar-dark " style="background: #029475">
    <div class="container-fluid">
        <a class="navbar-brand" href="inicio-admin.jsp">SITAE</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#">Administar</a>
                </li>
            </ul>
            <form action="logout" class="d-flex" role="search">
                <button class="btn btn btn-success" type="submit">Salir</button>
            </form>
        </div>
    </div>
</nav>



<div class="title" style="text-align:center; color: white;">
    <h2 class="tallerA">TALLERES ASIGNADOS</h2>
</div>
<div class="container" style="display: flex; justify-content: center;">
    <div class="row">
        <div class="col">
            <div class="card" style="width: 18rem;">
                <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFBgUFRUYGRgaGxobGBoZGxocIRsaGRgbGRobGhobIS0kHR0qHxgYJTcmLC4xNDQ0GyM6PzoyPi0zNDEBCwsLEA8QHxISHzMqIyozMzMxMTMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzM//AABEIAK8BIAMBIgACEQEDEQH/xAAcAAAABwEBAAAAAAAAAAAAAAAAAQIDBAUGBwj/xAA9EAACAQMDAgQFAQYEBgIDAAABAhEAAyEEEjEFQQYiUWETMnGBkaEHQmKxwdEUI1KSFXKisuHwgsIzQ1P/xAAZAQEBAQEBAQAAAAAAAAAAAAAAAQIDBAX/xAAmEQACAgEDBQEAAgMAAAAAAAAAAQIREgMhMQQTFEFRYSJxQoGR/9oADAMBAAIRAxEAPwDsVCk0KpAUKFCgBQoUKAKhFCjqgKKEUdCaALbRbKVNFNAFsobKOaFLJQnZRbaXQpYoRtobaXQq2ShG2j2UqhSxQnZQ2UdCKChOwUMUe2hsoAt1EXpeyhspsNxouaLNPbKVtpYxGQhpQt05Q3VLLSEC3SggobqKaWNg4o6TRxUKHNCaG2iigDoUqkxQAoUKKgDoqOhFAFRUqKOKARR0rbRbaEoTQpW2hFUoVCl0U1CUFFCKOaE0KFFHFFNCaAOKEUU0JoA4oRSZoFqAXQpnfmI+9KBoBU0JohR7aAImiJoFKICgBNHQC0YWhKAKMUNtHFCh0KKKOoAUU0VCgBQoqKaoFUU0m5cCgk9qjW725N/4qSklyErJc0W8Vhm8aN8RrQTzBiozzmPtWp09xiFL4J7Vy7sXsjSiWQNDdUe7qVUSSKRptWtwShBHtWu5EYsllqItUBbrF4nFS2cDmtKaZGmObqKabe4IqNoXczvI9orVow9ibNChNN3rwUTVNDk0KrV10tnFSH1YxFc81ZrBkuhUd9SAJNJs6ncJFM0MGSqKmw9Ie5WlJMjTQ49yKqerdcs6Zd124Fngck/QVV+LPEyaS3iGuMPIvp/E1cZ6n1S5euG5cYsx7n+QrSRmztWj8aaK4YF4Kf4wVH+75R+a0NjUK4DKwYHgggg/QjBrzKblav8AZ5cvvrbdu3cdUkvcAOGROQwODJKrPI3YijRUzu6mjBptDSwawaKLxr1Q6fSMwnc5CA5xu5JPbAI+pFYXpXiC5b+RyPbsfqpxXVb1pXUo6hlYQysAQQeQQeRXMvFXhE6ab2nBazyyZJt+47lP1H0rcWYkjX9G8UW7sJchHPH+lj7E8H2P5rQ7q4lYumK6D4O62bg+DcMuolCeWUcg+4/l9K04qrRlSd0zV76PdSQKOsGw91Iv3QiljwKWCKj68j4bT6GowN9L6lb1FsXLTBlPBFS5rEfsuvr/AIZrYYErcufguSP0NbipGVqwNu8CTVTrOv27ZC8yYxmsN4l8dP8ADIW2yBuGJEx7QcVkL/iZmVPhtDDv3+/Y1zlrL/E5u3wdm6lqt1omYntR3L4t6UuTACyT9q5L0brl25ci7dYj0nH4HFde0wQ6cBsrtHPfFc3PK6O0FRyXTIty9/lbgSZYkMDBPM+tdR02nI2eZiIzP/vNZLrfWLenPxFtAGY4A9fSnuj+NnuMJsnYBkrmPrXmUlF7m9jVdTtW9rEmPXJFH0W/aNuLUbQORTGr12n1FlhIMjI7j6ij6KbdvTgJEbfauqau0VmR6J4rduoXdPc43sE+3Y1qn1Nx9SqGBbAn3JPb0iuS9Nur/wAXZiYDXH2t2k8fath1fX6m1qtyqz29vImB6zAxWW2i6as2vU9QEEk1mvB2vuXb98tcJRWhBgAfjmsj1/xkL1p0+VvY9u8Gs74Y61qbZZLTABjJMZ+orrCVPJ8HPU/ltE9FI81W9ZDEAAxmqnoPWLa21+LdXfA3biBnvii6/wBVR1X4TgsCOD2+1d56kXHkkNKae6F+VMsZIpVvqSs+1Rx3qKGLW5ETGarenK3xZLjbDY++a4WdsS9u6oM0TxViEJtmDBg5rO3nR7nzRB7d6v1dDbILQIPeP1qp8hph6Oywtw1wn1aAKXrbxS27qs7EZgvG7apMD6xTPSlUA7WJUYBmZJyc+2P1qYx9eO9dtNUrOMnucA8QdTe7dZ3MsTJ9B6AewFU7PU/xLoG0+qu2W/dY7T6o3mQiefKR9waqfiSwVQWY8KoJJ+gHNdbMUPV1f9kHTYt3dQRl2Ftf+VBuYj6swH/wrCdM8GdRvwV0xRT+9dIT/pbzfpXZfCvTjpNNa07xvVfPHBdiWaD3Ek/io2VGiU06DUdGp0NWTQujImkg0oUBhupeDIuk2sI2VUCdh7rz8vp9x2qvTomp09xbiW3bYwPlBMxyIHYjFdMojWlJoy4plbrOpJbCsxgOsrOO0kfXIrmvV/2kvbdwiBkkhSTB/Hcfit7416cb+juKnzoPiJHO5ATA9yu5fvXBtbaLLtuCCPWvNqzkpL4RoudJ+0jW/E5QhjhSIj2kV1TS6s3dE1y6wlkJaAQBI7E5NcHsdLLEbASR6TXQbPTtUmgvFmldrEBt0xt83JwKRmm9rI0O/sicM9yO0fcdv5GuszXIv2OgKLjtjgD6Ca6nY1ttyQrAke9ddPZUaORav9nuvuqN1y0Y7DcP6Vj+peGtRprpt3FE8ypMEevFd203WnVYa25I7xWY63prl+6bsECIAz7/AN65Nx9Fxoynh7wbrG23PhrsOQC0H8RjFdRvM1vTAPbJ2qJAg8D9ab6X1kW7aI6NIAGBMx71L1PWAyEKjkkf6f61XBVyWNnJes321V6QpCLkA9veBW06Glu3aUSu1uc+vaqt+j3ZJCn8f+KyvWOkapJ2b9szAn+VcFpm1S5NV1XxBp9KzKi7/WM5jieO9TOj9Y0mrt7C+xo+QtB49BXM7mhvbAbiMBPerboPS/8AM3NuVQvIMRMdxxVwSR0Ss0t7wlbD/EF4Bgdw5kVMsdQuQyEhsQG/Ss3b8KJdunbqXySfnnk/Wi6j1BdDcNpgzADDc8nua83V6cpRXauz39DqQg2tSkmYnWKVu3A3+tv+4xUjpupZGkcVrrXhD/ETfJID5jA5pGl8Iolz4V1iFaYPt9RxXrVSjUvh85r+bcWUavcd94eI9qv9H1FvKrdyBI/vWnt+BNJtIBb/AHn0oum+Crdth5iYjkjtVxTXB1jqtPkm6KxEjeYIHemes6W3bsm8HI2gnn9KtR0tQxMmIiqHxX0knSsltjiTH2qODovfrcxd/qFy4dwuQBnJinl6+8bLjMV75xWd6ZpLly78P4bsQYIH/mtb1bwneNgC1ZO6Mjcv9TVcFVGY67bbOo9Bt7NNaUiDsUke7DcR+tTi1MJgAegA/FGWr0rZHlbt2UfiLwhptdct3L28FAVIQhd6kyFcxMAzEEfMaseldH0+mXbYspb7EqPMY/1OfM33NS91DdSwOhqeADjaeex9KibqNXoCRauFTsbnt7/SpIeo4IuDaeex9DWN6h+0bSWWe2S7ujtbYKoA3ISrZdhIkciayU3ytTimuS3/ANrScW7P3e4f+1U/rT3TP2h3LtxVZktqxABFuQJ7NueY9xS6KdWQ0ZNQ9BqhcQMO8z7EGCD7ggj7VKmqmQBNeZ/GWsddbftkRsd0AHcAwpP1WDXpfvXmvx+Q+uu3AMOQwjgwoXH+2o69kY70HxL8JY2gkZz7Ga2XWutjXWRbsXNpKneoJ4IzMj9K5EEMxFXXSb1yyxZVY4yIPFcsceDNGp8DdZt6UOt0gAmMzyD7U/1rxntuA6by4ywzI+hFY3Vu7KG28mT9SajvpLjMAF5Fc4wvdlvaj07YtKSQTT6aVRP9a51Z69dVtwIJ9xinrnie+QRKj6D/AM154z6eLtIr12+Te37CEA4xmmTrrIkb0EYPmFc9TrV0D5yZ9c1Cd5JYjJyT710fWx9Ix3EdNPUbA/8A2J/uFOrftH95T9xXLFYelOI8dqnmr4O4afx09s2gq7S0z29KpukFf8KyQN5kDA57VA+LM0FvbflxXPy97oktRtbA0uhe0CZG7sYFVt7pl6/rEFwKycuY9sfWrM6gn60tdU65FafWp+jzwg4yybbNSzpbCokQMf0qP1uxaIRzyDWc+OxoNfJ5M1nzPw7Saao12nvoomaW+qSQZ5rIC6fXFF8Umr5v4Z/o6Pa0SFZ3c+9Bul2zyf1rAL1G4BAuNA9zR/8AE7v/APR/ya6ebH4dMkbROh2bbG4gUMeT61NtohxIrnj9QucfEb8mkrrnGQ7fk1PNj8GSXo2hfNNvciqHVddSzphfuE7RCsYJO6dowOSa5t1z9oV+4SLI+EvZsMx/+q/aT717YyySaNo7R8ShvrJ+E/E6au0DIFxYDp6H1H8J7fjtV+L9Wyk4PQVqiLepQuVLBNfVC2j3G4RWc/RQSf5V5hv32dmdjLOxZvqxk/qa7t441/wunalu7oLY995CH/pLH7VwKa1EDoapNm9HeoU0sNVB3L9lviU3g1m40uAGB9dsI36bD/uNdKVq80+ANVcTXacWgWZrgUqO6sCrn6BCzf8Axr0hbLd1P6Vjg0N9Y162LF283FtGf/apIH3MD71y614dtajQ6drh84tgk9zulv61bfth6k66ezpEBB1D5P8ADbKnb9S7IfopqNbYKqoOFUKPoBH9K8/Ua/br9Oc5UUml6LpkRXcSyn15g4qVcvKSTbtCCsfirEuvoPxQ+IOIFeN9Y27ow5t8GSXQXCRK4mpV/p7hgVHatJ8QelA3B6VY9Y16OMo5O7KhbwOM+/tNJe4IIBPvTQRMsNwGBB9+096SbCkj5gScGcSM5+2a8e50HRqO2MUFvGPUf3pdvSjco4nMj37/AE5on0h7Zk7QP6wKm4Fb8TI+lBLnGeaZu6ZwAYG0xkfp9AaWJCkqDjnE/f8AnTcC/iHIHI5ptbx5mkBwzAkMZ5xGDSRdiRtPLQD3AxIqgcTUebAp57hyKhlxDEqwEAzPIOBSrWELSYzOckioB86ojBgU6936VH0+03CrAyBIkc4BH3zTgtxuB49ZmPt2qf2BaOYJmlB8fzonQbZUMQCMR2nk+1G23bO6JO3IwCPWgGXuwwk085j96o9+0dwPlAIAA9fpUm9pmnBEcHj8+4oAT2J+9JYkSQcikjdgEAZPHPlMZFAWyTIZfp6R2+tUB6qwb2mvafu67k/508y/qo/WuSNXXVtkecN5hkAYk98ntWC8X9N+HeN1R5LhLf8AK/Lr+cj6+1fU6HVuOL9HSD9FN07qD2HFy20MPwR3BHcGuteHfE9vUpztcfMp5H9x71xo1Z+G1LaqyASPOJgkeUZYY9QCPvXukrRs7e2uQcsPzTtvUu/yW2P8R8o/Jqqs6y0nyW0H8UAn8nNON1FjyxrjkQieOei6rVaUW7RRijh2UNBICsABOCc944rjN+0yMVdWVhhlYEEH0IORXc01kEEGCKc1uh0utXbqbQLR5bi4dfowz9jj2rcdRcFOB09atMzBFUsxICqoJJJwAAMk1vutfsvupL6W6l1ByrEIyj3PytHc4+lbfwR4MtaJRcYi5fIy8YQHlUB49C3J9hituaLQ9+zfwcNEnxboB1LjzcH4anOwH/VxuI7iBgSd6rVFt07dvKil3IVVBLE9gK52aMF4+Aua3TJ2sW3uEdt11giD6/5bH7D1qs3kMJIpPVOordvPcFyCzztI/dACqPbygfefWoZvSScY/wDTFfH6nUznf/DzTdsnfEk9qP4kAn8VA098ZMebgGPWhv3MUkgk7R6fX2rgZonrfLTkR7UBfEGef6VXNq0UczGPqR/SpCXA67i0TgDjPaDSwRl06kEFvPt2gY9uy847555qPr2QKIC7gT6iRGQCBAPMEyfrWo6la0rWwLYs5ZS5djBQs0jdbJAdYBDGQAJirAvofhgNatMiMNsICm453AtgZ3kmfrXvWhH6bw/TDq24eUFvhiWJJE5jYvuSGx7U8+oByZiAAQI5JgFhjABz7e9a2/Y0NpWR1Xa4XhoI2gqrLERG9sySQZM1P/4jpHAQlChEBRMbeBIjA83608eHFjD9MXfCKyEszCMic+h5xHlInj8U2LyEEBisfKDIMt2InsQa0/WL2jJFnFxztEW4BJh0yVEEqG4PqPWKVZ8MaL4TKDLGIO4SGkkRmBuJiCAPvNTx03SYwMet6VCuBgjaVaZgmJnvuE4nilKC0bbh9yYnYBMA9yQZj1x9LNvCVxtwW4Aobbu2yG2yMEAERLff1kVXv4ZKOQt5WTybpb4Zfa4DgYiZGJ9p9TFofoxYVp/LM8z2EHzNmBwSoB/NP6jVABkABIwAexADTnmQDVrrvDOkDKPjPbViD8MebdxnzFiO47ZGKsuj9I0trcSUdQSyM5Qsvlht0AehM9pp4u/IwZkgQrLjDDzOYhtpls4GMce1R9Tq4dfIwIG0gwV2kYOPvz6Ct/rOjaO7bW2AoGShViYLEF4M94+XvB9DUF/DeltlizglgQGc7v3z5QgiQBiZ7DnNa8XfkYMyJ1YEf5hZpAOT6duJAz+KetXFVCxUbXkfXODyTx696uuteFbdxvMUQ+VR8JdgDBTBYTkQCYEfL3oaPwXaKojXS7pBncFBUjA28/vD3GIqeLfsYMrLXUFgNADcESBEkhcHHqOeaLTXA8OZbbggCAG45OM/2qxueC7YlXus6fME2mTB4JBl4O309TUXWeGdrKtq465E79xX6jbE8A5wPvFR9KMGIW6X3DFsH1wNpjygx80xmovxQk2925xO2YzjIP8AerOx4UdWRn1Bbz+cIoWTDSIJkHAyCcTjvUPrfhxrdt3tXmcDO0kE7d0QPpnMkmPc1H0j5GDGApYpBkzEM0EEk8/afWhrbVq4pFxMEbjJwQQYjbkEQciq9umXxsd7qAGSE3OYjjsYPbOJgd6iX7V1SrLcA3uVQkMZaAwXGJ7SJmDWtPp5RlaYUWUfUvDZUzaYOpyAxAMHghvlYe+PpUboFprepTepUgOYII/cYd/rWtvICFtxLAAF0WASQfMrRkHbkGRx3NZ2/rnDbZDD1HaOZHYivpKTapnU0SdQp1NefX7Vk/8AGHntn24gH68j809YvluCJyYOJAE4Pc84ri4tENWnUan6LqMMJNZDT3WIU9mbYPdsGP8AqFWt6yLaK1x1UETBYTH057Vg0kbttaF015j3VVBxkuwAH61eaB/KB6AD9K4/f8XpsWygdh8QOxAA3EYVQCQY+veK1vhzxY96FSwygEAvcdUUGYjMljPYAx3gZrdSXJpHRheCgsxAUAkk4AA5JNYvxB4h/wAR/lW9hQkjzHDns2OwIOP6xF2tq491w9y21tV2pbzlpV97A8sCBGYE0zpvDVhUaHYMxTe8r59rTOcAluYiSOK56mUlUTM4trYyF20rL8TaAhVfMsgSAYAM4kg8/wBqFu3bYMqiAgJZSwBghoAb1BHGeD2re9Q6fZuKLTKNsOxUCPMy7ZyMEHIMiCKir4VsW7T7AHYz5rhnbIgiewAziDg5zXm8V3szn22YXTW7UnyNvE9ySNoO4ADtGcTT+o0TW2IYJgKZmD5xuBjPaff2rYr0exsG20CVhTtAlRAJ8rCCIPacE8nNN9U6GjD4lu2D8kKWK7rYXbGwkecAY+X92Tio+mdWR6boyL2BHw4BYHjcuCIMiDJkHvFNaW8V2ElSwyQIOZI4PrxBq+ToNy0vy7vL88TDFZAIGNu3cCZGeKgL4cvsGlUWWQByAAASy7oYzEfeBgVz7EuKJiyu1PUba2VQbwyhiW2cksBJb9yFxGO/NQmZ9oCQzR5Q6sIUjuRjcYHt3NM6mw4dbof2cCRDHEqJgkelSixKgF98xBJiMyB5SIjM1qTWzMkmy7FPhsyoQSRthtwIxv7TMgkDikaS3c2uHDbYLACACCB8xg9xP/mKi29Fc2neFAUMVHzQCfmkkeozyCKDXLtsC2doELI8p2rIy7DnJPfkio1YG9aLiODbTcrr5ShkqQ0wYiZzjOfQiamjVNO2VBhQAJnbAB3YBBUBcZ4x604FJWfibQJIJPoSNsGVI9JB5NRrGquMdtu2SrArv2wwO4nytE4IJyIOcCtcpIEkdRZHcIyZJXb5t0MSAGmO4zER95JX7dxts+cECZkwkyzQBhTJIJimGt7HHxASUiPoP4IDT7HmpIcENcFw7XncWg7lAIVIU5iIjt/ObIAe0Why2w5BERAGAwAYnlYA5z9zF+K9rzgOYeQVJhtwkkyJUbuMcgfd+wkljtO4gbXJgemYEg7ce8VFbX3MzbgQcgkEgEM5Uuck4H5pFtvY0kK04bb8RUZCwgMJJjc0jMRy4k+kGczItIzIzKWyN2WMjyiGDNy5KoIEEDHvUSxqd77yjAn922QsqQFJloWZnEU5ptTvV1nzSCgBwIAAPkJnAJjHFabfohIY3EB2uQ24PDGCHElYI4wWwJjd71JRtS52/Ed2IAC529xEiJbnOPbmolzUgAf5ndhtgmCvDCRBG30iD+ac0nWiq7jcQPtaSmJ+aSMRwR/tqKckUXb6lrN5DXJ2g5UkAQTmSBP4jn0pq5rLtxkm45PEqxJY8jbuHrGf7UynVkcTecF0WUdF2knELgCBByciPemdJ1NGLIZV2+QgQN0CSZ4BHcVZSl6BYafqN2cO8L5VbcCAGOTuI3TJyPbtFOWtZdIa38T5fMN+whkY7V2FwDhgyk4jaPWow1dsFBtCPtJQDkiBPlP+rgfQ8U/peooxYsjDuQyD5TIlZEwciPf70c5LcWQrlm5tcCN7yHmJIJWGBKzHywCY8p7kyese+iJb8gQAExG5h80sSsYxmf54W+qBPw7ZBaVJacHafKEkxt+U5zzU17iBNkhxuyFXOCXgZyBBYmef0zHVkhZWhwBLW48gUzIXnEHzAAQMZ+YEDio13QOoXYiuJbcIBQLAKlWEBtxgSIgiTUixcOVNuQQGDSfMdxAheTO6I+9Ed6JdKlmEiBtHlUyXDpnEz7ya13HYsjNorZVlZEBnyBTJyzNknkyZn+FZ7io+p6a6eZ0YLAK7TIYsMHHHK8nImPSrK9qma4DsXaiquFdSULDaRP7v7siCPWlaHUKoubwgVRMMJIZCoAWTBOwdjTuSRLK46RbiibasoWXA8pHI3L/qG0A4ng0ttVbdlttb8iwwUqp2gJtQSwEL5jKzEt2jNymn8is4BJdRbggAlzMNJBUwWH1Puah6jSo127bVFCyMGJVgMhfaCPpFVarS/C5Matae2o221srwzFQWn+FmYwILAYMcj6P6PWXEAVXyF2lCymFPmIUuSJHaZOaFnpNtNhAYlvmJJMkbSQBwpnHGKavdPDbmCguILLIQz6kAdsjnPesvUuVWMmTdH1O6twQQXHlt5DMUUSQ0HyhTOe+4manavq9ze3mBwrsbY+RoTZtRsD90yfTiDNVNm0bbBtj7vMNu6VcKPMx7iY7HEd6Ndcrjb8NoAZpxg7QMYkAfWmbRcmWem6lttEpuDsYczuJGBuIMwCVlsRLzwIDL664UFsXFFsEq0EAtCblLbgIkgSTyd3NVV20AC1pWuMCZKs45xJzliOQP1qS2qdlD3RhAmcCCOQxMFo9M81HJktjtvV3bdtBbd9rMzllbIUhVALsIIwcngn7lzqHVL90fNG3y4YiBu826ARMBcRHuar7AdQWVm2NO628EMrHvnIGYjI5qaUS4puW2gkqpCwIC5UAn1ET9PSmf6S2WOl8XQVlVJBJjeSDuGGJPyzJ8oB5+9WNzxQ7AMhUAMxyDJgAqqgbQFG/nnC+5rNtbW4kKm48HaABugGSoJBzmfam9NoLaKSXcuG8iL8sGCd275RAYDsKq1XwmXNjRRWaWGPKuxpHygfYznim9VatuGgFdsFRGFHpIpN/SKSoLPMfMKnvf22wqgEcsT3I9Y7VzTvcyQnsoPOtwFFUmCYLex7nPYU5de3cVWKiBAB3lSPqDz/Wm+rqfh7zsKsB8i/KfSaft6e2tn4l22HMCEBIzHeK1XsB662jWQ1jkHcx3Eyfp2mj1nUCjKbbOPIqws4xksR71X6HQqzCN6IRLEtAn0q3Xp1wMNiEqeT9PSj5BW/CvEo6oCYYeaY75kjmja9cWfiWEcAeYkkzx8vvkVdal7bNCsSQPMJyPtUGLgDG2QyKZYGQSDzRMDI1t0qHt24DYGdpEDMiYPtipIQvbEXNzg8HEr3AI5M1Hv61gSFA+gwZ7H6VETWhboBzmCTI95Ee9Z3fCBM/wwUFU2rcIjORkz5iOSST+lNW1cGbu1/okAEAqRMUWt0xU71buCSucelWGqt3blsfD5UTtPefatJvgEM6G28tbYgMrLkbvMQO09lkT70yOn2xgywVoIA24xlhwR704Uv2TvO07oBUDseR7U7r76jYRZ2QDOwllb/mB4o2/TNDX+CtqpBYYEqWGPNIEmPpj3peu6agUuoVG8pVj5lBEQInE/Q07bsWlVWcwXAhO09uadvkx5VDkGQH+UD1rFu7TJYuygu2/8zY7gghl8uIHlX0496rLiOrs6NdG7crKYZSDmAxzGKstZp18qK6KzAFmQyATSGtXLaShLRJMZLeuO1X+SIVx04mQqpIXaQMrghpHE04UkfC3sWgkEYWGHeJ2nn0qbb1Qx8RSHJhc/un1FFoGuC4balOZIYQT35/vUUvoEPptgVztILjzL+7GCJ4ORIpaXyblxRceSDJiFho8y/2p3qNq5dCWxJA4nAmSTAH86Z1GiKyxTznHzHkDA9IqqgK1pBtStxSVUqBxvIMyI4wtVidQLETb3kCW8wAHbdHcRU/Q6prQINsDdg4ntET6VHsWtM1wrcBWRAEkz6R6CqnG90VCtNr7bzbd43TsIJhYM7ff609d19pBtdS5bO8chic78ZxwR61BHQUgqoIIclfoeAD2FK13T7lu6A9wXN6xJg7REQAMfmtKMPTIRn1tt3ZVZ1bzFdvmAXjaZ5MdxT+jeHDOSYyTMFieIPqPQ80NH09QgZUQFTBkGYB7x3qQdzMWUKBGAvt9ak69AdfWXCqKLeFLEsObitkliOBFIXVqpMTuiSMR7bRx60rS9TuIgVkkkRgjA+nrUHUFZR4eGLBjBlT79sVOQStJrB593ztkGPmEQZAwKa01/wCKpRkGyCG3c7swy/pxUnW2kVUVmDQY3RnjGR781AbRhlITD/eOe1LTA0NJcRNqNbIOBuyY7qJ7VYI+2V3pJHlUSBvAHf0qOdOEK+VSSBzkT6g04mstn/8AImEkBR3BMkj71puwRfgi0pAuHfgeUnapzPoTg03a0Tq+5X3IIYlmzmZWJk5J/FWytb3uUtsQ8ESBhhxNR9aqDOyHbLxwc8fwmjlX+wOaeXL7sHiD/SpbaVRbKjAYQT/aqzTX/PHfvVhqtcNoXgzmufAC0+lRE2HKnOcUxotNc3MVYlZxPAFN6gvPMg1M0nxLSeaCDyK3vV2Ajpra5yzdxOJov8VcuPsdyEA/dMR+KS+rBJlQBUNdTDEjiomy7lhp+nJLMGz3nvTiXkXyoPMcEVW3tYMcyaeu3URd6DzR3qU2QkMjrO5V4Pm7/Sl6bS23tedPMCdpioul1zXU8wGKGs6gyhQuFnNHadAQ+qdN0AGIp9NeLj4LKduT2FRXKXHiDPerJEVbTAiScfaq2ki0J6a6FWbfuImCahWNSu8ruJE88j8VXX7RSFXCntS9DpCCZ+1KXKFF1qOmi4A3xCdnyj1pnUdQZMfD3QIqOy3LaBwe/FL0msdhLAH2qPghK02m3J8R3I7wYx9KRc6kw2Iix/Ef3qjajVsymF+XtIotJqg5UsI7CO1VXe/AJmjZS5LkhgOT60Vy06hiGVieex+xqNqtSiyCCfenfj27i5BBipVAkaS+fhBLjQwPlbuKrb7xcAW4XI7n+1C5Ebs4qPetr80kTzUrcFunU12hXkt78VHfqC7gxUeU+lV5tR5h5lPryKRpVK7zJZY4NWMV9LRbazqybC8MHHyxxmow1VouhfkrMzGarGW7egIAD7mjHTtrAOZNdcEluyFwdXbLfDDhQeWFWLC1shnkgcjms9Z6HudoOIo2siwZcbp96xhF8Aetv8W7AYIqxniYq5v2ZhbZDqOeMGsvdUXm8pK+lSdPZKAjcwJ9DzSSRWXj6a2w+HcBUjII9aippmEjJInaYxHpioiByDLmmbGsu2yBuwPvWUk0KJGoVgxlQWIH2jvTIbgMokkfelXNQZlsz3+tFq9IwtqymRMmeaLkhZ3+rohWIBXED196g27/AMRyGX5jJP19KKzoFKl7n375p17iBJtrLcAnFHFfQf/Z
                  " class="card-img-top" alt="...">
                <div class="card-body">

                    <h5 class="card-title">Taller</h5>
                    <form action="list-futbol" method="get">
                       <button type="submit" class="btn btn-primary" >Lista de alumnos</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

<div>
    <div class="wave"></div>
    <div class="wave"></div>
    <div class="wave"></div>
</div>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="js/admnTaller.js"></script>
</body>
</html>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (request.getSession().getAttribute("rol") != "instructor") {
        response.sendRedirect("home");
    }
%>
