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

        <script type="text/javascript">
            $(document).ready(function(){
                populate();

            });

            function populate(){
                var domElemYouTubeUploadURL = document.getElementById("text:youTubeUploadURL");
                var domElemYouTubeUploadToken = document.getElementById("text:youTubeUploadToken");
                var domElemForm = this.parent.document.getElementById("uploadYouTubeForm");
                var val = domElemYouTubeUploadURL.value;
                alert(val);
                if(val != undefined && val != ""){
                    domElemForm.action = val + "?nexturl=http://localhost:8084/ksno3/faces/secureA/VideoCreate.jsp";
                    this.parent.document.getElementById("youtubeToken").value = domElemYouTubeUploadToken.value;
                    domElemForm.submit();
                }

            }

            //$(document).ready(function(){
            //    $("#content").load("home.html");
            //    $("td.main a").click(function(){
            //        setContent(this.getAttribute("href"));
            //        return false;
            //   });
            //});

            function copyValue(){
                alert("youtubefile2");
                debugger;
                this.parent.document.getElementById("youtubefile2").value = document.getElementById("youtubefile1").value;
                alert(document.getElementById("youtubefile1").value);

            }
            //function setContent(url){
            //    $("#content").load(url);
            //}

        </script>
        <f:view>
            <h:form id="text">
                <h1>Upload video</h1>
                <table>
                    <tr>
                        <td>Name</td>
                        <td required="true">
                            <t:inputText id="it1" binding="#{VideoCreate_Backing.name}" />
                        </td>
                        <td/>
                    </tr>
                    <tr>
                        <td colspan="3">Descripion</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <t:inputTextarea id="description" binding="#{VideoCreate_Backing.description}" rows="4" style="width: 100%"/>
                        </td>
                    </tr>
                </table>
                <t:inputHidden id="youTubeUploadURL" binding="#{VideoCreate_Backing.youTubeUploadURL}" />
                <t:inputHidden id="youTubeUploadToken" binding="#{VideoCreate_Backing.youTubeUploadToken}" />
                <t:inputHidden id="video_id" value="#{VideoCreate_Backing.id}" />
                <h:commandButton value="Continue" action="#{VideoCreate_Backing.createVideoMeta}" />
                <t:outputText binding="#{VideoCreate_Backing.errorMsg}"/>
            </h:form>
            <h:form>
                <h:commandButton immediate="true" value="Cancel" action="cancel" />
            </h:form>
        </f:view>
    </body>
</html>