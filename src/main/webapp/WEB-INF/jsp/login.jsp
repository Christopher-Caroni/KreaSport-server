<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/css/jquery.growl.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.auth0.com/js/lock/10.16/lock.min.js"></script>
    <script src="/js/jquery.growl.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <script type="text/javascript">
        $(function () {
            var error = ${error};
            if (error) {
                $.growl.error({message: "Please log in"});
            } else {
                $.growl({title: "Welcome!", message: "Please log in"});
            }
        });
        $(function () {
            var lock = new Auth0Lock('${clientId}', '${clientDomain}', {
                auth: {
                    redirectUrl: '${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}${loginCallback}',
                    responseType: 'code',
                    params: {
                        state: '${state}',
                        // Learn about scopes: https://auth0.com/docs/scopes
                        scope: 'openid roles user_id name nickname email picture'
                    }
                }
            });
            setTimeout(function () {
                lock.show();
            }, 1500);
        });
    </script>
</div>
</body>
</html>
