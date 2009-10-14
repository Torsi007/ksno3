<jsp:include page="../nd/Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   
        <title>kitesurfing.no - Faktura</title>
    </head>
    <body class="invoice" style="margin: 0 0 0 25">
        <f:view>
            <h:form>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr style="height:165">
                        <td>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr style="height:20">
                                    <td/>
                                    <td rowspan="5"><img src="../resources/img/logos/ksno_2.gif"/></td>
                                </tr>
                                <tr>
                                    <td class="large"style="width:350">
                                        <h:outputText value="#{TransactionModify.owner.companyName}"/>
                                    </td>
                                    <td/>
                                </tr>
                                <tr>
                                    <td>Organization Number: <h:outputText value="#{TransactionModify.owner.companyNumber}"/></td>
                                </tr>
                                <tr>
                                    <td><h:outputText value="#{TransactionModify.owner.streetName} #{TransactionModify.owner.streetNumber}"/><br/><h:outputText value="#{TransactionModify.owner.zipCode}"/>&nbsp;<h:outputText value="#{TransactionModify.owner .city}"/></td>
                                </tr>
                                <tr style="height:20">
                                    <td/>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height:115">
                        <td>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td><h:outputText value="#{TransactionModify.customer.companyName}"/></td>
                                </tr>
                                <tr>
                                    <td>Attn:</td>
                                </tr>
                                <tr>
                                    <td><h:outputText value="#{TransactionModify.customer.firstName}"/>&nbsp;<h:outputText value="#{TransactionModify.customer.lastName}"/></td>
                                </tr>
                                <tr>
                                    <td><h:outputText value="#{TransactionModify.customer.streetName} #{TransactionModify.customer.streetNumber}"/></td>
                                </tr>
                                <tr>
                                    <td><h:outputText value="#{TransactionModify.customer.zipCode}"/>&nbsp;<h:outputText value="#{TransactionModify.customer.city}"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height:90">
                        <td class="large" style="text-decoration:underline"><h:outputText value="#{TransactionModify.customer.firstName}"/>&nbsp;<h:outputText value="#{TransactionModify.customer.lastName}"/></td>
                    </tr>
                    <tr style="height:135">
                        <td>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td nowrap="false" width="420"><div style"width:400"><h:outputText value="#{TransactionModify.comment}"/></div></td>
                                    <td><b>Kr.&nbsp;<h:outputText value="#{TransactionModify.amount}"/>,-</b></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height:135">
                        <td>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td><h:outputText value="#{TransactionModify.owner.firstName}"/>&nbsp;<h:outputText value="#{TransactionModify.owner.lastName}"/></td>
                                </tr>
                                <tr>
                                    <td>Instruktør</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr style="height:50">
                                    <td width="250"></td>
                                    <td width="125"><h:outputText value="#{TransactionModify.amount}"/></td>
                                    <td width="290"></td>
                                </tr>
                                <tr style="height:130">
                                    <td></td>
                                    <td></td>
                                    <td style="text-align:right;" valign="top"><br/>
                                        <h:outputText value="#{TransactionModify.date}">
                                            <f:converter converterId="CalendarConverter"/>
                                        </h:outputText>
                                    </td>
                                </tr>
                                <tr style="height:145">
                                    <td valign="top">
                                        <table cellpadding="0" cellspacing="0" border="0" style="margin-top:15">
                                            <tr>
                                                <td><h:outputText value="#{TransactionModify.customer.companyName}"/></td>
                                            </tr>
                                            <tr>
                                                <td>Attn:&nbsp;<h:outputText value="#{TransactionModify.customer.firstName}"/>&nbsp;<h:outputText value="#{TransactionModify.customer.lastName}"/></td>
                                            </tr>
                                            <tr>
                                                <td><h:outputText value="#{TransactionModify.customer.streetName} #{TransactionModify.customer.streetNumber}"/></td>
                                            </tr>
                                            <tr>
                                                <td><h:outputText value="#{TransactionModify.customer.zipCode}"/>&nbsp;<h:outputText value="#{TransactionModify.customer.city}"/></td>
                                            </tr>                                    
                                        </table>
                                    </td>
                                    <td></td>
                                    <td valign="top">
                                        <table cellpadding="0" cellspacing="0" border="0" style="margin-top:15">
                                            <tr>
                                                <td><h:outputText value="#{TransactionModify.owner.companyName}"/></td>
                                            </tr>
                                            <tr>
                                                <td><h:outputText value="#{TransactionModify.owner.streetName} #{TransactionModify.owner.streetNumber}"/></td>
                                            </tr>
                                            <tr>
                                                <td><h:outputText value="#{TransactionModify.owner.zipCode}"/>&nbsp;<h:outputText value="#{TransactionModify.owner.city}"/></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td style="height:40" valign="bottom"><h:outputText value="#{TransactionModify.amount}"/></td>
                                    <td valign="bottom">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h:outputText value="#{TransactionModify.owner.accountNumber}"/></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </h:form>
        </f:view>
    </body>
<jsp:include page="../nd/Ending.jsp" ></jsp:include>






