<jsp:include page="../Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
        <title>kitesurfing.no - video</title>
        <script type="text/javascript" src="../resources/js/jquery.js"></script>
        <script src="../resources/js/logic.js" type="text/javascript"></script>
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
                if(val != undefined && val != ""){
                    domElemForm.action = val + "?nexturl=http://www.kitesurfing.no/ksno3/faces/secureA/VideoCreate.jsp";
                    this.parent.document.getElementById("youtubeToken").value = domElemYouTubeUploadToken.value;
                    domElemForm.submit();
                }

            }

            function validatespecial(){
                var formElem = document.getElementById("text");
                var validated = validate(formElem);
                if(validated){
                    validated = this.parent.document.getElementById("youtubefile").value != undefined && this.parent.document.getElementById("youtubefile").value != "";
                    if(!validated){
                        this.parent.document.getElementById("youtubefile").style.background = "orange";
                        alert("The selected field is mandatory");
                    }
                }
                return validated;
            }

            function copyValue(){
                this.parent.document.getElementById("youtubefile2").value = document.getElementById("youtubefile1").value;
            }

        </script>
        <f:view>
            <h:form id="text" onsubmit="return validatespecial()">
                <table>
                    <tr>
                        <td>Name</td>
                        <td required="true">
                            <t:inputText id="it1" binding="#{VideoCreate_Backing.name}" />
                        </td>
                        <td/>
                    </tr>
                   <tr>
                       <td style="width:1">Category</td>
                       <td style="width:1" required="true">
                           <t:selectOneMenu binding="#{VideoCreate_Backing.slctCategory}">
                               <f:selectItems value="#{VideoCreate_Backing.categorySelectItems}"/>
                           </t:selectOneMenu>
                       </td>
                    </tr>
                    <tr>
                        <td colspan="3">Descripion</td>
                    </tr>
                    <tr>
                        <td required="true" colspan="3">
                            <t:inputTextarea id="description" binding="#{VideoCreate_Backing.description}" rows="4" style="width: 100%"/>
                        </td>
                    </tr>
                </table>
                <t:inputHidden id="youTubeUploadURL" binding="#{VideoCreate_Backing.youTubeUploadURL}" />
                <t:inputHidden id="youTubeUploadToken" binding="#{VideoCreate_Backing.youTubeUploadToken}" />
                <h:commandButton value="Start upload" action="#{VideoCreate_Backing.createVideoMeta}" />
                <t:outputText binding="#{VideoCreate_Backing.errorMsg}"/>
            </h:form>
            <h:form>
                <h:commandButton immediate="true" value="Cancel" action="cancel" />
            </h:form>
        </f:view>
    </body>
<jsp:include page="../Ending.jsp" ></jsp:include>
