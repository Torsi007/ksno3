<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>   
        <title>kitesurfing.no - påmelding sommerkurs</title>
        <link rel="stylesheet" type="text/css" href="resources/css/default.css" />
        <link rel="stylesheet" type="text/css" href="resources/css/signUpSummerForm.css" />
        <link rel="stylesheet" type="text/css" href="resources/css/skinned-select.css"/>
        <script type="text/javascript" src="resources/js/default.js"></script>
        <script src="resources/js/logic.js" type="text/javascript"></script>

        <script src="resources/js/logic.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                setHiddenFieldsFromRequestParams();
            });

            function setHiddenFieldsFromRequestParams(){
                if(this.location.search != undefined && this.location.search.indexOf("?")>-1 ){
                    var cid = this.location.search.split('=')[1];
                    var courseSelector = document.getElementById("signup:courses");

                    for(var i = 0; i < courseSelector.length; i++){
                        var option = courseSelector.options[i];
                        if(option.value == cid){
                            courseSelector.selectedIndex = i;
                            break;
                        }

                    }
                }
                //coursesChangeHandler();
             
            }
            
            function coursesChangeHandler(){
                var domElemSelect = document.getElementById("signup:courses");
                var selectedValue = domElemSelect.options[domElemSelect.selectedIndex].value;
                var strAwailableSeats = document.getElementById("signup:courseFreeSeats").innerHTML;
                if(strAwailableSeats != undefined){
                    var courseAvailableSeatsEntries = strAwailableSeats.split("~");
                    for(var i = 0; i<courseAvailableSeatsEntries.length; i++){
                        var courseAvailableSeatsEntry = courseAvailableSeatsEntries[i];
                        var courseId = courseAvailableSeatsEntry.split(":")[0];
                        if(courseId == selectedValue){
                            var awailSeats = courseAvailableSeatsEntry.split(":")[1];
                            if(parseInt(awailSeats)> 0){
                                document.getElementById("awailSeatsInfo").innerHTML  = awailSeats + " ledige plasser";    
                            }else{
                                document.getElementById("awailSeatsInfo").innerHTML  = "Dette kurset er fullt. Om du ønsker kan du sette deg på reservelisten (fortsett påmeldingen), vi vil da kontakte deg om noen skulle melde seg av. Et annet alternativ er å velge et annet kurs.";
                            }
                            
                            break;
                        }
                    }
                    
                }
                
            }
                                   
            
        </script>
        <script type="text/javascript" src="resources/js/jquery.skinned-select.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#courseSelect div').css("display","none");
                $('#txtSelectedCourse').html($('#courseSelect select :selected').text());
                $("#courseSelectActivate a").click(function(e) {
                    e.preventDefault();
                    $('#courseSelect div').css("display","block");
                    $('#txtSelectedCourse').css("display","none");
                });
            });
        </script>
    </head>
    <jsp:include page="GoogleAnalytics.jsp" ></jsp:include>
    <body>
        <f:view>
            <h:form id="signup" onsubmit="return validate()">
                <table style="width:1px;">
                    <tr>
                        <td id="courseSelect" style="height:40px">
                            <span>Kurs</span>
                            <div class="my-skinnable-select">
                                <t:selectOneMenu id="courses" binding="#{SignUpSummer_Backing.coursesSelect}" >
                                    <f:selectItems value="#{SignUpSummer_Backing.coursesSelectItems}"/>
                                </t:selectOneMenu>
                            </div>
                            <span id="txtSelectedCourse"><t:outputText style="display:none" id="courseFreeSeats" value="#{SignUpWinter_Backing.courseAwailableSeats}"/></span>
                        </td>
                        <td id="courseSelectActivate" style="padding-top:14px">
                            <t:htmlTag value="a" styleClass="button">
                                <f:param name="href" value="../nd/dummy.html" />
                                <h:outputText value="Endre" escape="false"/>
                            </t:htmlTag>
                        </td>
                    </tr>
                    <tr>		
                        <td required="true" format="email" colspan="2">
                            <span>Email</span>
                            <t:inputText binding="#{SignUpSummer_Backing.email}" style="width:100%"/>
                        </td>	
                    </tr>	
                    <tr>		
                        <td required="true">
                            <span>Fornavn</span>		
                            <t:inputText binding="#{SignUpSummer_Backing.firstName}"/>
                        </td>	
                        <td required="true">
                            <span>Etternavn</span>                            
                            <t:inputText binding="#{SignUpSummer_Backing.lastName}"/>
                        </td>                        
                    </tr>	
                    <tr>		
                        <td required="true" format="phone">
                            <span>Telefon</span>
                            <t:inputText binding="#{SignUpSummer_Backing.phone}"/>
                        </td>
                        <td/>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span>Ved leie av neopren vennligst angi følgende størrelser:</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>Våtdrakt størrelse</span>
                            <div class="my-skinnable-select">
                                <t:selectOneMenu  required="true" binding="#{SignUpSummer_Backing.wetSuitSize}" >
                                    <f:selectItem itemLabel="-" itemValue="empty"/>
                                    <f:selectItem itemLabel="XXL" itemValue="XXL"/>
                                    <f:selectItem itemLabel="XL" itemValue="XL"/>
                                    <f:selectItem itemLabel="L" itemValue="L"/>
                                    <f:selectItem itemLabel="M" itemValue="M"/>
                                    <f:selectItem itemLabel="S" itemValue="S"/>
                                    <f:selectItem itemLabel="XS" itemValue="XS"/>
                                </t:selectOneMenu>
                            </div>
                        </td>
                        <td>
                            <span>Sko størrelse</span>
                            <div class="my-skinnable-select">
                                <t:selectOneMenu  required="true" binding="#{SignUpSummer_Backing.shoeSize}" >
                                    <f:selectItem itemLabel="-" itemValue="empty"/>
                                    <f:selectItem itemLabel="45" itemValue="45"/>
                                    <f:selectItem itemLabel="44" itemValue="44"/>
                                    <f:selectItem itemLabel="43" itemValue="43"/>
                                    <f:selectItem itemLabel="42" itemValue="42"/>
                                    <f:selectItem itemLabel="41" itemValue="41"/>
                                    <f:selectItem itemLabel="40" itemValue="40"/>
                                    <f:selectItem itemLabel="39" itemValue="39"/>
                                    <f:selectItem itemLabel="38" itemValue="38"/>
                                    <f:selectItem itemLabel="37" itemValue="37"/>
                                    <f:selectItem itemLabel="36" itemValue="36"/>
                                    <f:selectItem itemLabel="35" itemValue="35"/>
                                </t:selectOneMenu>
                            </div>
                        </td>	
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a href="#thirdDay" class="fakecheck" id="test">Er interessert i å delta 3. dag (ikke bindende)</a>
                            <t:selectBooleanCheckbox id="thirdDay" forceId="true" style="display:none" binding="#{SignUpSummer_Backing.thirdDay}"/>
                        </td>
                    </tr>
                     <tr>		
                        <td colspan="2">
                            <span>Kommentar</span>
                            <t:inputTextarea  style="width:100%" rows="3" binding="#{SignUpSummer_Backing.comment}"/>
                        </td>	
                    </tr>                  
                    <tr>		
                        <td required="true" colspan="2">
                            <span  id="awailSeatsInfo"/>
                        </td>	
                    </tr>                     
                    <tr style="display:none">		
                        <td colspan="2" valign="bottom">
                            <h:commandButton id="sbm" value="Meld meg på!" action="#{SignUpSummer_Backing.signOn}" />
                        </td>	
                     </tr>                    
                </table>  
            </h:form>
            <table style="padding:0; margin:0; border-collapse: collapse;">
                <tr>
                    <td>
                        <jsp:include page="Button.jsp" >
                            <jsp:param name="title" value="Meld meg på" />
                            <jsp:param name="link" value="javascript:document.getElementById('signup:sbm').click()"/>
                            <jsp:param name="width" value="306"/>
                        </jsp:include>
                    </td>
                </tr>
            </table>
            <t:outputText styleClass="errorMsg" binding="#{SignUpSummer_Backing.errorMsg}"/>
        </f:view>       
    </body>
<jsp:include page="Ending.jsp" ></jsp:include>

