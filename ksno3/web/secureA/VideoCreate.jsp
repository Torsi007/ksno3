<%-- 
    Document   : CreateVideo
    Created on : 16.sep.2008, 18:59:01
    Author     : halsnehauge
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload video</title>
        <script type="text/javascript" src="../resources/js/jquery.js"></script>
        <script src="../resources/js/logic.js" type="text/javascript"></script>
        <title>Kitesurfing.no</title>
    </head>
    <body>
        <form id="uploadYouTubeForm" action="" method ="post" enctype="multipart/form-data">
            <h1>Upload a video from your computer</h1>
            <table>
                <tr>
                    <td>Select file to upload</td>
                    <td required="true">
                        <input id="youtubefile" type="file" name="file"/>
                    </td>
                </tr>
            </table>
            <input id="youtubeToken" type="hidden" name="token" value="token_value"/>
            
        </form>
        <iframe frameborder="none" style="width:100%; height: 400; border:none" src="VideoMetaCreate.jsp" id="content"></iframe>
           <f:view>
            <h:form id="hjh">
                <t:inputText id="vidId" value="#{VideoCreate_Backing.id}" />
            </h:form>
           </f:view>
    </body>
</html>
