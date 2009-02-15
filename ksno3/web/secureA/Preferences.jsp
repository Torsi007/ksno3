<%-- 
    Document   : Preferences
    Created on : 08.des.2008, 22:30:16
    Author     : tor.hauge
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function validate(){
                var domElemPw1 = document.getElementById('preferences:pw1'); 
                var domElemPw2 = document.getElementById('preferences:pw2');  
                var returnval = true;
                if(domElemPw1.value != undefined && domElemPw1.value != ""){
                   if(domElemPw1.value.length > 5){
                        if(domElemPw1.value != domElemPw2.value){
                            returnval = false;
                            alert("Passordene du har angitt stemmer ikke overrens, legg til verider på nytt");
                            domElemPw1.value = domElemPw2.value = "";
                            domElemPw1.focus();                            
                        }
                   }else{
                       returnval = false;
                       alert("Passordene du angir må være lengre enn 5 bokstaver");
                        domElemPw1.value = domElemPw2.value = "";
                        domElemPw1.focus();                       
                   }
                    

                }
                return returnval;
            }
        </script>
    </head>
    <body>
        <f:view>
            <h:form id="preferences" onsubmit="return validate()">
                <h2>Innstillinger</h2>
                <h3>Felles mail</h3>
                <table>
                    <tr>
                        <td colspan="2">Kitesurfing.no ønsker ikke å plage deg med unødvendig spam og er derfor restriktive hva angår utsendelse av mails. Normalt vil vi sende to felles mail i året, en mail på høsten hvor vi gir deg tilbud på brukt kiter, og en nyhetsmail tidlig på nyåret. Om du ikke ønsker å motta slik mail fra oss kan du skru av dette nedenfor.</td>
                    </tr>
                    <tr>
                        <td style="width:300" nowrap>Ja jeg ønsker å motta mails fra kitesurfing.no</td><td style="width:100%;" align="left"><t:selectBooleanCheckbox value="#{Preferences_Backing.user.allowMail}"/></td>
                    </tr>                    
                </table>
                <h3>Endre Passord</h3>
                <table>
                    <tr>
                        <td>Gammelt passord</td><td><t:outputText value="#{Preferences_Backing.user.passWord}"></t:outputText></td>
                    </tr>                    
                    <tr>
                        <td>Nytt passord</td><td><t:inputSecret id="pw1" binding="#{Preferences_Backing.inpPw1}"/></td>
                    </tr>
                    <tr>
                        <td>Gjenta passord</td><td><t:inputSecret id="pw2"/></td>
                    </tr>                   
                </table>
                <%--<t:inputText id="test" value="#{Preferences_Backing.test}"/>   --%>
                <t:commandButton action="#{Preferences_Backing.update}" value="Lagre"/>
                <t:outputText binding="#{Preferences_Backing.errorMsg}"/>
            </h:form>
            <h:form>
                  <h:commandButton immediate="true" value="Avbryt" action="cancel" /> 
            </h:form>            
            
        </f:view>
    </body>
</html>
