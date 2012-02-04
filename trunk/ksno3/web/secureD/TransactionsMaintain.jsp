<jsp:include page="../Heading.jsp" ></jsp:include>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>
<link type="text/css" href="${request.contextPath}/resources/css/jquery-ui-theme/jquery-ui.custom.css" rel="stylesheet" />
<link type="text/css" href="${request.contextPath}/resources/css/admin.css" rel="stylesheet" />
<script src="${request.contextPath}/resources/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${request.contextPath}/resources/js/jquery.dataTables.js" type="text/javascript"></script>
<script type="text/javascript" src="${request.contextPath}/resources/js/jquery-ui.custom.js"></script>

<script type="text/javascript" charset="utf-8" src="${request.contextPath}/resources/js/ZeroClipboard.js"></script>
<script type="text/javascript" charset="utf-8" src="${request.contextPath}/resources/js/TableTools.js"></script>



<title>kitesurfing.no - vedlikehold transaksjoner</title>
<script type="text/javascript">
        var oTable;
    $(document).ready(function(){
        var searchTerm = ($.cookie("transactFilter") == null || $.cookie("transactFilter") == undefined)?"2012-":$.cookie("transactFilter");
        $("#dtTransactions").attr("border", 0).attr("cellpadding",0).attr("cellspacing",0);
                oTable = $('#dtTransactions').dataTable({
                "bJQueryUI": true,
                "bPaginate": false,
                "oSearch": {"sSearch": searchTerm},
                "aoColumnDefs": [
                    { "bSortable": false, "aTargets": [ 5 ] }
                ],
                "sDom": 'T<"clear">lfrtip',
                "oTableTools": {
			"sSwfPath": "${request.contextPath}/resources/utils/copy_cvs_xls_pdf.swf"
		},
                "fnDrawCallback": function() {storeSearchTerm();}

        });
    });

    function storeSearchTerm(){
        try{
            $.cookie("transactFilter", $("#dtTransactions_filter > input").val());
        }catch(err){
        }
    }

    function toStartPage(){
        var currentLocation = window.location.href;
        var rootLocation = currentLocation.substring(0,currentLocation.indexOf("/faces/"));
        window.location = rootLocation;
    }

    function openInvoice(url){
        var s = url.replace(/\/s\d{3}/,"");
        window.open(s);
    }
        
</script>
</head>
<body>
    <f:view>
        <h:form>
            <t:dataTable id="dtTransactions" styleClass="display" forceId="true"  value="#{TransactionsMaintain_Backing.transactions}" binding="#{TransactionsMaintain_Backing.data}" var="item" first="0" width="100%">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Id" />
                    </f:facet>
                    <t:outputText value="#{item.id}"></t:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Transaksjons Dato" />
                    </f:facet>
                    <t:outputText value="#{item.date}"><f:converter converterId="CalendarConverter"/></t:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Eier" />
                    </f:facet>
                    <h:outputText value="#{item.owner.firstName} #{item.owner.lastName}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Kategori" />
                    </f:facet>
                    <h:outputText value="#{item.category}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Beløp" />
                    </f:facet>
                    <h:outputText value="#{item.amount}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Kommentar" />
                    </f:facet>
                    <h:outputText value="#{item.comment}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <f:verbatim escape="false">&nbsp;</f:verbatim>
                    </f:facet>
                    <t:htmlTag value="table" styleClass="iconContainer">
                        <t:htmlTag value="tr">
                            <t:htmlTag value="td" rendered="#{item.image.url != Empty}">
                                <t:commandLink  title="Invoice" onclick='openInvoice("#{item.image.name}"); return false;'>
                                    <span class="ui-icon ui-icon-document"></span>
                                </t:commandLink>
                            </t:htmlTag>
                            <t:htmlTag value="td">
                                <t:commandLink action="#{TransactionsMaintain_Backing.selectEditTransaction}" title="Endre">
                                    <span class="ui-icon ui-icon-circle-arrow-e"></span>
                                </t:commandLink>
                            </t:htmlTag>
                            <t:htmlTag value="td">
                                <t:commandLink  action="#{TransactionsMaintain_Backing.transactionDelete}" title="Slett" onclick="return confirm('Er du sikker på du vil slette transaksjonen?'); return false;">
                                    <span class="ui-icon ui-icon-trash"></span>
                                </t:commandLink>
                            </t:htmlTag>
                        </t:htmlTag>
                    </t:htmlTag>
                </h:column>

            </t:dataTable>
            <h:commandButton value="Ny transaksjon" action="transactionCreate"/>
            <t:outputText styleClass="errorMsg" binding="#{TransactionsMaintain_Backing.errorMsg}"/>
        </h:form>
        <h:form>
            <h:commandButton immediate="true" value="Avbryt" action="cancel" />
        </h:form>
    </f:view>
</body>
<jsp:include page="../Ending.jsp" ></jsp:include>
