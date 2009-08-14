<%-- 
    Document   : CreateArticle
    Created on : 16.sep.2008, 18:59:01
    Author     : halsnehauge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload video</title>
        <script type="text/javascript" src="../resources/js/jquery.js"></script>
        <title>Kitesurfing.no</title>

    </head>
    <body>
        <form id="uploadYouTubeForm" action="" method ="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>File</td>
                    <td required="true">
                        <input id="youtubefile" type="file" name="file"/>
                    </td>
                </tr>
            </table>
            <input id="youtubeToken" type="hidden" name="token" value="token_value"/>
        </form>
        <iframe style="height:50%; width:100%" src="VideoCreate_1.jsp" id="content"></iframe>
    </body>
</html>
