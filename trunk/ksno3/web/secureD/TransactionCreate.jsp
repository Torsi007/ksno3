<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

<title>kitesurfing.no - opprett transaksjon</title>
<script src="${request.contextPath}/resources/js/logic.js" type="text/javascript"></script>
<script type="text/javascript">
        
    function validate_local(){
        var textarea = tinyMCE.get(event.srcElement.id + ':myTextArea');
        if ( (textarea.getContent()=="") || (textarea.getContent()==null) ) {
            alert("Felt kan ikke være tomt");
            textarea.focus();
            return false;
        }else{
            return validate();
        }
    }

</script>               
</head>
<body>
    <f:view>
        <h:form enctype="multipart/form-data" onsubmit="return validate_local()">
            <h1>Ny transakjson</h1>
            <p>Du er i ferd med å opprette en ny transakjson!</p>
            <table>
                <tr>
                    <td>Kommentar</td>
                    <td required="true">
                        <t:inputText id="it1" required="true" binding="#{TransactionCreate_Backing.comment}">
                        </t:inputText>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>Beløp</td>
                    <td required="true">
                        <t:inputText id="it11" required="true" binding="#{TransactionCreate_Backing.amount}">
                        </t:inputText>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>Kategori</td>
                    <td>
                        <t:selectOneMenu binding="#{TransactionCreate_Backing.category}" >
                            <f:selectItem itemLabel="Annet" itemValue="other"/>
                            <f:selectItem itemLabel="Internett" itemValue="internet"/>
                            <f:selectItem itemLabel="Kurs" itemValue="course"/>
                            <f:selectItem itemLabel="Reise" itemValue="travel"/>
                            <f:selectItem itemLabel="Salg" itemValue="sale"/>
                            <f:selectItem itemLabel="Utstyr" itemValue="gear"/>
                        </t:selectOneMenu>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Dato</td>
                    <td required="true">
                        <t:inputText id="startDate" binding="#{TransactionCreate_Backing.date}">
                            <f:converter converterId="CalendarConverter"/>
                        </t:inputText>
                    </td>
                    <td>Format: yyyy-MM-dd</td>
                </tr>
                <tr>
                    <td>Kunde</td>
                    <td>
                        <t:selectOneMenu binding="#{TransactionCreate_Backing.customerSelect}">
                            <f:selectItems value="#{TransactionCreate_Backing.customers}"/>
                        </t:selectOneMenu>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td nowrap>Attachment</td>
                    <td required="true"><t:inputFileUpload id="attachmentUpload" required="true" value="#{TransactionCreate_Backing.upAttachment}" size="20" /></td>
                    <td><t:outputText binding="#{TransactionCreate_Backing.upAttachmentResult}"/></td>
                </tr>
                <tr>
                    <td colspan="3" style="color:red; font-weight: bolder"><t:outputText binding="#{TransactionCreate_Backing.errorMsg}"/></td>
                </tr>
            </table>
            <h:commandButton value="Gå videre" action="#{TransactionCreate_Backing.createTransaction}" />
        </h:form>
        <h:form>
            <h:commandButton value="Avbryt" action="Cancel" immediate="true" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
