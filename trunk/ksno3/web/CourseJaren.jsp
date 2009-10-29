<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

        <title>kitesurfing.no - kite kurs på jæren</title>
        <link rel="stylesheet" type="text/css" href="resources/css/default.css" />
        <link rel="stylesheet" type="text/css" href="resources/css/courseJaren.css" />
        <script type="text/javascript" src="resources/js/default.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                window.top.setStyle("default");
                $('a[name=modal]').click(function(e) {
                    e.preventDefault();
                    var url = $(this).attr('href');
                    //window.parent.$('a[name=modal]').click();
                    window.parent.openModalVideo(url);
                });

                var year = "2000";
                $(".courseList input").each(function (i) {
                    var currYear = this.value;
                    if(currYear != year){
                        $(this).parent().parent().before("<tr><td colspan=2><b>"+currYear+"</b></td></tr>");
                    }
                    year = currYear;

                });
            });
        </script>
    </head>
    <jsp:include page="GoogleAnalytics.jsp" ></jsp:include>
    <body>
        <f:view>
            <h:form>
            <div class="topMenu">
                <table>
                    <tr>
                        <td><a href="Main.jsp?content=Home.jsp"><img src="resources/img/logos/logo.jpg" alt="kitesurfing.no logo"/></a></td>
                    </tr>
                    <tr>
                        <td class="main">
                            <table id="mainMenu">
                                <tr>
                                    <td style="width:58px;"><a href="Main.jsp?content=Home.jsp">Hjem</a></td>
                                    <td style="width:80px"><a href="Main.jsp?content=Articles.jsp" >Publisert</a></td>
                                    <td style="width:98px"><a style="font-weight:bolder" href="Main.jsp?content=CourseJaren.jsp"  >Sommerkurs</a></td>
                                    <td style="width:86px"><a href="Main.jsp?content=CoursesHaukeliseter.jsp" >Vinterkurs</a></td>
                                    <td style="width:86px"><a href="Main.jsp?content=aboutUs.jsp" >Om oss</a></td>
                                </tr>
                            </table>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
                <table class="middleSection">
                    <tr>
                        <td class="leftSection" >
                            <div>
                                <h1>Kurs</h1>
                                <table class="courseList">
                                    <t:dataList value="#{CoursesSummer_Backing.courses}" var="course">
                                        <tr>
                                            <td style="width:120px">
                                                <h:outputLink value="SignUpSummer.jsp">
                                                    <f:param name="id" value="#{course.id}"/>
                                                    <h:outputText value="#{course.startDate}"><f:convertDateTime pattern="dd MMM"/></h:outputText> - <h:outputText value="#{course.endDate}"><f:convertDateTime pattern="dd MMM"/></h:outputText>
                                                </h:outputLink>
                                                    <h:inputHidden value="#{course.startDate}"><f:convertDateTime pattern="yyyy"/></h:inputHidden>
                                            </td>
                                            <td>
                                                <h:outputLink value="SignUpSummer.jsp" styleClass="button">
                                                    <f:param name="id" value="#{course.id}"/>
                                                    <h:outputText value="Go"/>
                                                </h:outputLink>
                                            </td>
                                        </tr>
                                    </t:dataList>
                                </table>
                            </div>
                        </td>
                        <td class="middleSection"></td>
                        <td class="rightSection">
                            <div>
                                <h1>Hva er et nybegynnerkurs?</h1>
                                Målet vårt er at du som deltager skal sitte igjen med erfaring og kunnskap nok til å kunne gå ut å kite på egenhånd på snø eller vann etter et nybegynnerkurs.
                                Vi lærer deg de grunnleggende tingene, som sikkerhet, vurdering av spots, vær og vind, launching, landing og kraft kontroll. I løpet av et kurs tilstreber vi å gi alle one-on-one assistanse i de mer avanserte øvelsene.
                            </div>
                        </td>
                    </tr>
                </table>
                <table class="bottomSection">
                    <tr>
                        <td class="leftSection">
                            <div>
                                <h1>Hvem kan delta</h1>
                                <p>Kitesurfing er spennende og morsomt, og kombinerer elementer fra flere ulike vann- og snøsporter. Dette gjør det til en sport med mange muligheter, og det finnes garantert noe som tiltaler deg! Med kiten kan du gi deg ut på alt fra rolige, lange skiturer på fjellet, til å kite i store bølger med et surfebrett. Til tross for at kitesurfing kan være en ekstremsport er det også en sport som er mulig å utøve av nesten alle! Det spiller faktisk ingen rolle om du er 10, 20 eller 65 år og du trenger ikke å være stark! Det er en riktig familieaktivitet, der alle kan utøve sporten på sin måte ? ekstremt eller rolig. Men å lære kiting er både vanskelig og forenet med stor risiko dersom man prøver å lære på egen hånd! Av den grunn bør alle som har lyst til å begynne ta et kurs! Først og fremst med tanke på sikkerhet, men også for  raskere progresjon. Er du under 16 år, må du ha med godkjennelse fra foreldre for å kunne delta.</p>
                                <h1>Kurstilbudene</h1>
                                <h2>2 dagers kurs</h2>
                                <p>Kurset har som mål å gjøre deg til en selvstendig kiter, slik at du kan klare deg alene på sjøen/fjellet med ditt eget utstyr. Kursene er praktisk lagt opp med mye drageflyging og moro, men det legges allikevel stor vekt på sikkerhet. Dersom vindforholdene tillater det, håper vi å kunne få alle opp på brettene i løpet av kurset.</p>
                                <p>Hovedtema på kurset vil være:</p>
                                <ul type="square">
                                    <li>Forståelse av kitens flyområde og kraftsone</li>
                                    <li>Linedisiplin</li>
                                    <li>Sikkerhet</li>
                                    <li>Rigging/nedrigging</li>
                                    <li>"Launching" og landing av kiten</li>
                                    <li>Navigering av kite</li>
                                    <li>Kiteboarding/skiing på egenhånd</li>
                                    <li>Valg av utstyr</li>
                                </ul>
                                <h1>Lokasjon</h1>
                                <p>Kursene vil normalt sett holdes på en av strendene på Nord Jæren. Eksakt hvilken strand som benyttes vil avhenge av vindretning, og vil derfor variere fra gang til gang. Aktuelle strender er: Solastranden - Orrestranden - Hellestø - Brusand.</p>
                                <h1>Pris</h1>
                                <h2>Nybegynnerkurs</h2>
                                <ul type="square">
                                    <li>1 Person : 1900 NOK</li>
                                </ul>
                                <h2>Neopren</h2>
                                <ul type="square">
                                    <li>Våtdrakt/sko: 200 NOK</li>
                                </ul>
                                <h2>Teambuilding / Spesialer</h2>
                                <p>Teambuilding / Spesialer koster fra 5000 NOK avhengig av tidsramme og innhold.</p>
                                <h2>Rabatter</h2>
                                <p>Grupperabatt - hver 6 mann er gratis!:</p>
                                <p>Klarer du å samle en gjeng på 6 mann betaler dere altså for 5 deltagere. Det samme påløper for 12. og 18. mann...</p>
                                <p>Vi gir også gode priser til studenter, vernepliktige og medlemmer i de kiteklubbene vi samarbeider med.<br>Kontakt oss for avtale!</p>
                                <h1>Vindgaranti</h1>
                                <p>Vi i Kitesurfing.no er opptatt av at kursdeltakerne skal være fornøyde og føle at de får valuta for pengene. Dersom værgudene skulle være vanskelige og det blir vanskelig å gjennomføre kurset på en tilfredstillende måte, er vi fleksible nok til å tilby dere plass på et annet kurs gratis! Vi regner med å kunne gjennomføre kurset dersom det er minimum 4 timer med nok vind for å fly kitene.</p>
                                <h1>Praktisk</h1>
                                <p>Vi stiller med:</p>
                                <ul type="square">
                                    <li>Drager</li>
                                    <li>Trapeser</li>
                                    <li>Brett</li>
                                    <li>Hjelmer og redningsvester</li>
                                    <li>Våtdrakter til utleie</li>
                                </ul>
                                <p>
                                    Dere bør ta med:
                                </p>
                                <ul type="square">
                                    <li>Solfaktor og solbriller</li>
                                    <li>Godt med klær</li>
                                    <li>Niste for hele dagen</li>
                                    <li>Transportmiddel til/fra stranda</li>
                                </ul>
                                <p>Om du er medlem av en organisasjon som gir deg rett til rabatt, må du fremvise medlemskort eller lignende identifikasjon ved fremmøte.</p>
                                <h1>Spørsmål?</h1>
                                <p>Har du noen spørsmål så send mail til <a href="mailto:info@kitesurfing.no">info@kitesurfing.no</a> eller ring oss.</p>
                                <p>Vi kan sette opp ettermiddager med kurs om det er nok interesse. Det er og mulig å booke andre datoer for kurs til vennegjenger eller bedrifter som har spesielle ønsker. Send oss en mail eller ring.</p>
                            </div>
                        </td>
                        <td class="rightSection">
                            <h1>Les om tidligere sommerkurs</h1>
                            <table class="articleList">
                                <t:dataList value="#{CoursesSummer_Backing.courseArticles}" var="article">
                                    <tr>
                                        <td class="date"><span>
                                                <h:outputText value="#{article.createdDate}">
                                                    <f:convertDateTime dateStyle="short" pattern="dd.MM.yy"/>
                                                </h:outputText>
                                            </span></td>
                                        <td class="separator">|</td>
                                        <td>
                                            <t:htmlTag value="a">
                                                <f:param name="href" value="#{Current_Backing.articleUrl}?id=#{article.id}" />
                                                <h:outputText value="#{article.name}"/>
                                            </t:htmlTag>
                                        </td>
                                    </tr>
                                </t:dataList>
                            </table>
                            <h1>Video av tidligere sommerkurs</h1>
                            <table class="videoList">
                                <t:dataList value="#{CoursesSummer_Backing.courseVideos}" var="video">
                                    <tr>
                                        <td>
                                            <t:htmlTag value="img">
                                                <f:param name="src" value="#{video.thumbnail}" />
                                            </t:htmlTag>
                                        </td>
                                        <td>
                                            <h1>Video</h1>
                                            <t:htmlTag value="span">
                                                <h:outputText value="#{video.name}" />
                                            </t:htmlTag>
                                            <t:htmlTag value="a">
                                                <f:param name="name" value="modal" />
                                                <f:param name="href" value="#{video.url}" />
                                                <h:outputText value="Vis [#{video.duration}]" />
                                            </t:htmlTag>
                                        </td>
                                    </tr>
                                </t:dataList>
                            </table>
                        </td>
                    </tr>
                </table>
            </h:form>
        </f:view>
    </body>
<jsp:include page="Ending.jsp" ></jsp:include>


