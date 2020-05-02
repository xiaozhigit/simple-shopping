<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{@errorTitle}} :: Rimtay Error Manager</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family:'Courier New', Courier, monospace;
            font-size: 18px;

        }
        #container {
            padding: 5px;
            margin: 15px;
            border: 1px solid #e0060a;
            border-radius: 5px;
            box-sizing:border-box;
            -webkit-box-sizing:border-box;
            -moz-box-sizing:border-box;
        }

        h1 {
            color: #e0060a;
            border-bottom: 1px solid #000000;
            margin-bottom: 25px;
            margin-top:5px;
            /* font-size: 2.5vw; */
            font-size: 2.5em;
        }

        #container > #sign{
            color: #e0060a;
            /* font-size: 1.5vw; */
            font-size: 1.5em;
            text-align: right;
        }

        #container > #details{
            /* font-size: 0.75vw; */
            font-size: 0.75em;
        }
        #container > #details > span{
            color: #e0060a;
        }

        a {
          color: #e0060a;
          text-decoration: none;  
        }

    </style>
</head>
<body>
    <div id="container">
        <h1>{{@errorTitle}}</h1>
        <p><strong>Message:</strong> {{@errorMessage}}</p>
        <p>If you need help. Please don't hesitate to contact with us!</p>
        <p>Our Support Page: <a href="https://support.rimtay.com/">support.rimtay.com</a></p>
        <p id="details">REALM: <span>{{@REALM}}</span> TIMESTAMP: <span>{{date("d/m/Y H:i:s")}}</span> IP: <span>{{@IP}}</span> BROWSER: <span>{{@AGENT}}</span></p>
        <p id="sign">Rimtay Software</p>
    </div>
</body>
</html>