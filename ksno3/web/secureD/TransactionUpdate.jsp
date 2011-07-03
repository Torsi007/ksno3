<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   

<title>kitesurfing.no - oppdater transaksjon</title>
<script src="${request.contextPath}/resources/js/logic.js" type="text/javascript"></script>        
</head>
<body>
    <f:view>
        <h:form enctype="multipart/form-data" onsubmit="validate_local()">
            <table>
                <tr>
                    <td>Kommentar</td>
                    <td required="true">
                        <t:inputText id="it1" required="true" value="#{TransactionModify.comment}">
                        </t:inputText>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>Beløp</td>
                    <td required="true">
                        <t:inputText id="it11" required="true" value="#{TransactionModify.amount}">
                        </t:inputText>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>Kategori</td>
                    <td>
                        <t:selectOneMenu value="#{TransactionModify.category}" >
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
                    <td>Kunde</td>
                    <td>
                        <t:selectOneMenu value="#{TransactionUpdate_Backing.customerId}">
                            <f:selectItems value="#{TransactionUpdate_Backing.customers}"/>
                        </t:selectOneMenu>
                    </td>
                    <td/>
                </tr>
                <tr>
                    <td>Dato</td>
                    <td required="true">
                        <t:inputText id="startDate" value="#{TransactionModify.date}">
                            <f:converter converterId="CalendarConverter"/>
                        </t:inputText>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <t:graphicImage url="#{TransactionModify.image.name}"/>
                    </td>
                </tr>
                <tr>
                    <td nowrap>Endre...</td>
                    <td><t:inputFileUpload id="attachmentUpload" value="#{TransactionUpdate_Backing.upAttachment}" size="20" /></td>
                    <td><t:outputText binding="#{TransactionUpdate_Backing.upAttachmentResult}"/></td>
                </tr>
                <tr>
                    <td colspan="3" style="color:red; font-weight: bolder"><t:outputText binding="#{TransactionUpdate_Backing.errorMsg}"/></td>
                </tr>
            </table>
            <h:commandButton value="Lagre" action="#{TransactionUpdate_Backing.update}" />
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="Cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
