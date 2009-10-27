<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

<title>kitesurfing.no - opprett artikkel</title>
<script src="../resources/js/tiny_mce/tiny_mce.js" type="text/javascript"></script>
<script type="text/javascript">
    tinyMCE.init({
        // General options
        mode : "textareas",
        theme : "advanced",
        plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
        height: "100%",

        // Theme options
        theme_advanced_buttons1 : "bold,formatselect,|,sub,sup,|,charmap,|,fullscreen",
        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview",
        theme_advanced_buttons3 : "",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_statusbar_location : "bottom",
        theme_advanced_resizing : true,

        // Example content CSS (should be your site CSS)
        content_css : "../resources/css/articleUpdate.css",

        // Drop lists for link/image/media/template dialogs
        external_link_list_url : "lists/link_list.js",
        external_image_list_url : "lists/image_list.js",

        // Replace values for the template plugin
        template_replace_values : {
            username : "Some User",
            staffid : "991234"
        }

    });

    $(document).ready(function(){
        /*$("a").click(function(event){
     alert("As you can see, the link no longer took you to jquery.com");
     event.preventDefault();
   });*/
        setTimeout("doIt()",1000)
    });

    var attempts = 0;

    function doIt(){
        attempts++;

        if(tinyMCE.activeEditor != undefined && attempts < 10){
            if(tinyMCE.activeEditor.getContent() == ''){
                tinyMCE.activeEditor.setContent("<table><tr><td class='left'></td><td class='right'></td></tr></table>");
            }
        }else{
            setTimeout("doIt()",100)
        }
            
    }

</script>       
</head>
<body>
    <f:view>
        <h:form id="ca">
            <table height="100%" width="100%">
                <tr style="height:1"><td><h1>Oppdater artikkel</h1></td></tr>
                <tr><td style="height:100%;width:100%">
                        <t:inputTextarea binding="#{ArticleUpdate_Backing.body}" value="#{ArticleModify.body}" id="myTextArea" style="width: 100%; height:100%" />
                    </td></tr>
                <tr style="height:1"><td>
                        <h:commandButton value="Legg til flere bilder" action="#{ArticleUpdate_Backing.goToArticleImagesUpdate}"/>
                        <h:commandButton value="Endre intro" action="#{ArticleUpdate_Backing.goToArticleMasterUpdate}"/>                
                        <h:commandButton value="Fullfør" action="#{ArticleUpdate_Backing.saveArticle}" />   
                        <t:outputText binding="#{ArticleUpdate_Backing.errorMsg}"/>
                    </td></tr>                    
            </table>
            <div id="imagelist" style="display:none">
                <t:dataList value="#{ArticleModify.images}" var="img">
                    <t:graphicImage url="#{img.name}" height="80" onclick="selectImage('#{img.name}')" style="cursor:hand"/>
                </t:dataList>
            </div>
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>



