<%-- 
    Document   : SignUp
    Created on : 07.okt.2008, 20:01:44
    Author     : halsnehauge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<html>
    <head>
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="resources/css/style.css"/>            
        <script> 	
            function signup() 
            {
                if ( validateInput() ) {
                    document.getElementById("signupForm").submit();		
                }	
            } 	
        
            function validateInput() {
                if ( !checkField("firstName", "First Name") )
                    return false;
                else if ( !checkField("lastName", "Last Name") )
                    return false;		
                else if ( !checkField("email", "Email") )			
                    return false;		
                else if ( !checkEmail("email", "Email") )			
                    return false;		
                else			
                    return true;	
            } 	
        
            function checkField(fieldId, outputName) {		
                var element = document.getElementById(fieldId);		
                if (element.value == "") {
                    alert("The field '" + outputName + "' cannot be blank.");
                    element.focus();
                    return false;		
                } else {
                    return true;		
                }	
            } 	
        
            function checkEmail(fieldId, outputName) {
                var element = document.getElementById(fieldId);
                var returnString = true;
                if (element.value.indexOf("@") == -1) {
                    returnString = false;		
                } else if (element.value.indexOf("\'") != -1) {
                    returnString = false;		
                } else if (element.value.indexOf("\"") != -1) {
                    returnString = false;
                }
                if (!returnString) {
                    alert("The value in field '" + outputName + "' is invalid.");
                    element.focus();
                }		
                return returnString;
            }
        </script>
        
    </head>
    <body class="signup">
        <form name="signupForm" id="signupForm" method="post" action="insertstudent.jsp">
            <table>	
                <tr>		
                    <td>Fornavn</td>		
                    <td colspan="2">
                        <input type="text" name="firstName" id="firstName"/>
                    </td>	
                </tr>	
                <tr>		
                    <td>Etternavn</td>		
                    <td colspan="2">
                        <input type="text" name="lastName" id="lastName"/>
                    </td>	
                </tr>	
                <tr>		
                    <td>Adresse</td>		
                    <td colspan="2">
                        <input type="text" name="address" id="address" />
                    </td>	
                </tr>	
                <tr>		
                    <td>Telefon</td>		
                    <td colspan="2">
                        <input type="text" name="phone" id="phone" />
                    </td>	
                </tr>	
                <tr>		
                    <td>Mobil</td>		
                    <td colspan="2">
                        <input type="text" name="mobile" id="mobile" />
                    </td>	
                </tr>	
                <tr>		
                    <td>Email</td>		
                    <td colspan="2">
                        <input type="text" name="email" id="email" />
                    </td>	
                </tr>	
                <tr>		
                    <td colspan="3">
                        <input type="hidden" name="height" id="height" />
                    </td>	
                </tr>	
                <tr>		
                    <td>Vekt</td>		
                    <td colspan="2">
                        <input type="text" name="weight" id="weight" />
                    </td>	
                </tr>	
                <tr>		
                    <td colspan="3">
                        <input type="hidden" name="shoesize" id="shoesize" />
                    </td>	
                </tr>	
                <tr>		
                    <td>Kursdato</td>		
                    <td colspan="2">			
                        <select name="courseId" id="courseId">
                            <option value="84"  >						02.01.2009					</option>										
                            <!--					<option value="84"  >						01.02.2009					</option>					-->														
                            <option value="85"  >						16.01.2009					</option>										
                            <!--					<option value="85"  >						01.16.2009					</option>					-->														
                            <option value="86"  >						06.02.2009					</option>										
                            <!--					<option value="86"  >						02.06.2009					</option>					-->														
                            <option value="87"  >						20.02.2009					</option>										
                            <!--					<option value="87"  >						02.20.2009					</option>					-->														
                            <option value="88"  >						06.03.2009					</option>										
                            <!--					<option value="88"  >						03.06.2009					</option>					-->														
                            <option value="89"  >						20.03.2009					</option>										
                        <!--					<option value="89"  >						03.20.2009					</option>					-->							</select>		
                    </td>	
                </tr>	
                <tr>		
                    <td>Kurstype</td>		
                    <td colspan="2">			
                        <select name="courseType" id="courseType">				
                            <option>2-dagers kurs</option>				
                            <option>Introduksjonskurs</option>			
                        </select>		
                    </td>	
                </tr>	
                <tr>		
                    <td>Jeg ønsker info om kurs på</td>		
                    <td>			
                        <select name="language" id="language">				
                            <option value="NO" selected>Norsk</option>				
                            <option value="EN" >Engelsk</option>			
                        </select>		
                    </td>		
                    <td>
                        <input style="width: 96" type="button" onclick="signup()" value="Submit"/>
                    </td>	
                </tr>	
                <tr>		
                    <td colspan="3">			
                        <select name="wetty" id="wetty" style="width:50;display:none">				
                            <option>Ja</option>				
                            <option>Nei</option>			
                        </select>		
                    </td>	
                </tr>
            </table>
        </form>
    </body>
</html>
