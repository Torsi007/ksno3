<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>


        <title>kitesurfing.no - kitekurs</title>
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/default.css" />
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/skinned-select.css"/>
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/coursesHaukeliseter.css" />
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/jquery.jscrollpane.css" />
        <script type="text/javascript" src="${request.contextPath}/resources/js/default.js"></script>
        <script type="text/javascript" src="${request.contextPath}/resources/js/jquery.mousewheel.js"></script>
        <script type="text/javascript" src="${request.contextPath}/resources/js/jquery.jscrollpane.js"></script>

        <script type="text/javascript">

            $(document).ready(function(){

                $('#coursesContainer').jScrollPane();
                if(window.top.setStyle){
                    window.top.setStyle("default");
                }

                $('a[name=modalVid]').click(function(e) {
                    e.preventDefault();
                    var url = $(this).attr('href');
                    //window.parent.$('a[name=modal]').click();
                    window.parent.openModalVideo(url);
                });
                $('a[name=modalImg]').click(function(e) {
                    e.preventDefault();
                    var url = $(this).attr('href');
                    //window.parent.$('a[name=modal]').click();
                    var flashDivs = $(".flash");

                    window.parent.openModalImageOnUrl(url, 100,200, flashDivs);
                });

                $('#signOnBottom a').click(function(e) {
                    e.preventDefault();
                    var url = $(this).attr('href') + '?id=' +  $('#signOnBottom select').attr('value');
                    window.location = url;
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
        <script type="text/javascript" src="resources/js/jquery.skinned-select.js"></script>
    </head>
    <jsp:include page="GoogleAnalytics.jsp" ></jsp:include>
    <body>
        <f:view>
            <h:form>
            <jsp:include page="Menu.jsp" >
                <jsp:param name="fromMain" value="false"/>
            </jsp:include>
                <table class="middleSection">
                    <tr>
                        <td class="leftSection" >
                            <div>
                                <h1>Nybegynnerkurs</h1>
                                <div style="height:200px; width:280px; overflow:auto" id="coursesContainer" class="scroll-pane">
                                    <table class="courseList">
                                        <t:dataList value="#{CoursesWinter_Backing.courses}" var="course">
                                            <tr>
                                                <td style="width:140px">
                                                    <h:outputLink value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLCourseWinter}#{course.prettyPrintId}">
                                                        <h:outputText value="#{course.startDate}"><f:converter converterId="DateConverterPtrnddMMM"/></h:outputText> - <h:outputText value="#{course.endDate}"><f:converter converterId="DateConverterPtrnddMMM"/></h:outputText><h:outputText value="#{course.maxSize <= course.numberOfParticipants ? ' - Fullt' : ''}"/>
                                                    </h:outputLink>
                                                     <h:inputHidden value="#{course.startDate}"><f:convertDateTime pattern="yyyy"/></h:inputHidden>
                                                </td>
                                                <td>
                                                    <h:outputLink value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLCourseWinter}#{course.prettyPrintId}" styleClass="button" rendered="#{course.maxSize <= course.numberOfParticipants ? 'false' : 'true'}">
                                                        <h:outputText value="Go"/>
                                                    </h:outputLink>
                                                </td>
                                            </tr>
                                        </t:dataList>
  						  <tr><td colspan="2">&nbsp;</td></tr>
                                    </table>
                                </div>
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
                            <p>Kitesurfing er spennende, morsomt og kombinerer elementer fra flere ulike vann- og snøsporter. Dette gjør det til en sport med mange muligheter, og det finnes garantert noe som tiltaler deg!</p>
				    <p>Det kreves ingen forkunnskaper for å delta på kitekurs!</p>
                            <p>Til tross for at kitesurfing kan være en ekstremsport er det også en sport som er mulig å utøve av nesten alle! Det spiller faktisk ingen rolle om du er 13, 20 eller 65 år og du trenger ikke å være sterk! Normal fysikk og vilje til å lære er det viktigste! Det er en aktivitet der du velger selv på hvilken måte du vil utøve sporten, ekstremt eller rolig.</p>
                            <p>Å lære kiting er imidlertid både vanskelig og risikabelt dersom man prøver å lære på egen hånd. Av den grunn bør alle som har lyst til å begynne ta et kurs! Først og fremst med tanke på sikkerhet, men også for raskere progresjon. Er du under 16 år, må du ha med godkjennelse fra foreldre for å kunne delta. Anbefalt aldersgrense på våre kurs er 13 år, yngre deltakere anbefaller vi heller å ta timer med egen instruktør.</p>
                            <h1>Nybegynnerkurs</h1>
                            <p>Kurset har som mål å gjøre deg til en selvstendig kiter, slik at du kan klare deg alene på sjøen/fjellet med ditt eget utstyr. Våre kurs er praktisk lagt opp med mye drageflyging og moro, men det legges allikevel stor vekt på sikkerhet. Vi håper vi kan få alle til å kite med ski/brett i løpet av kurset, men her spiller selvfølgelig vindforhold og individuell progresjon inn.</p>
                            <p>Hovedtema på kurset vil være:</p>
                            <ul type="square">
                                <li>Navigering av kite</li>
					  <li>Å stå på ski/brett med kite</li>
                                <li>Forståelse av kitens flyområder og kraftsoner</li>
                                <li>Sikkerhet</li>
                                <li>"Launching" og landing av kiten</li>
                                <li>Rigging/nedrigging</li>
                                <li>Snøkiting på egenhånd</li>
                                <li>Vurdering av forhold og kitespot</li>
                                <li>Valg av utstyr</li>
                            </ul>
                            <p>Dersom dere vil ha et spesialkurs kan vi og lage et opplegg der vi fokuserer mer på action og morro, og midre på detaljer og teori. Vi kan også ordne kombinasjoner med hundekjøring, toppturer eller andre aktiviteter. Varighet og lokasjon på spesialkursene kan dere være med å påvirke.</p>
                            <h2>Vindgaranti...</h2>
                            <p>Vi i Kitesurfing.no er opptatt av at du som kursdeltaker skal være fornøyd og føle at du får valuta for pengene. Dersom værgudene skulle være vanskelige og det blir vanskelig å gjennomføre kurset på en tilfredstillende måte, får du plass på et annet kurs gratis! Vi regner med å kunne gjennomføre kurset dersom det er minimum 4 timer med nok vind for å fly kitene.</p>
                            <h1>Lokasjon</h1>
                            <p>Våre kurs holdes på kitespottene i nærheten av <a href="http://www.haukeliseter.no/" target="_blank">Haukeliseter fjellstue</a>. Vi må noen ganger kjøre for å finne vind, så vær forberedt på at vi flytter oss noen kilometer fra fjellstuen!</p>
                            <h1>Praktisk</h1>
                            <p>Vi stiller med:</p>
                            <ul type="square">
                                <li>Drager</li>
                                <li>Trapeser</li>
                                <li>Noen hjelmer for utlån</li>
                            </ul>
                            <p>
                                Dere bør ta med:
                            </p>
                            <ul type="square">
					  <li>Snøbriller/goggles</li>
                                <li>Hjelm</li>
                                <li>Godt med klær, inkludert varm jakke i pausene, ekstra votter og gamasjer! Vi er ute i snøen hele dagen! </li>
                                <li>Ski/snowboard. (Ja, det er lurt å ta med staver også! Kan du både ski og brett anbefaler vi ski i starten. Vi frarader å bruke fjellski.)</li>
                                <li>Solfaktor</li>
                                <li>Termos</li>
				        <li>Transportmiddel ? hvis du ikke har kan du som regel sitte på med noen</li>
				        <li>Topptursutstyr (feller/transciever/sekk...), hvis du har det. (Dersom det ikke er vind hele dagen er det fine muligheter for en liten tur!)</li>
                                <li>Badeklær / undertøy for bruk i stampen.</li>
                                <li>For skikjørere med stive plastsko: Alternativ, varm støvel som er lettere å bevege seg i før vi begynner med ski på beina.</li>
                                <li>Eget sengetøy / sovepose hvis du bor på stabbur eller selvstellsrom. Du kan og leie i resepsjonen.</li>
                            </ul>
                            <h1>Pris</h1>
                            <p>Pris for kun kurs 2150 kr (2 dager, inkludert utstyr, kost og losji ikke inkludert)</p>
                            <p>Det finnes forskjellige prisalternativer for kost og losji:<br/>
					Billigst mulig med overnatting i stabbur eller på sovesal, kurs og 3-retters middag lørdags kveld - fra kr 2895,-<br/>
					Overnatting i fjellrom, kurs og fullpensjon - fra kr 3745,-
				    </p>
				    <p>Våre kurs blir fort utsolgt, så vent ikke for lenge med å melde deg på.</p>
                            <h1>Spørsmål?</h1>
                            <p>For spørsmål om påmelding/booking, kontakt Haukeliseter; <a href="mailto:info@haukeliseter.no">info@haukeliseter.no</a> eller ring på tlf 35062777</p>
                            <p>Har du spørsmål om kurset/kiting, send mail til <a href="mailto:info@kitesurfing.no">info@kitesurfing.no</a> eller ring oss.</p>
                            <p>Vi kan sette opp ettermiddager med kurs om det er nok interesse. Det er og mulig å booke andre datoer for kurs til vennegjenger eller bedrifter som har spesielle ønsker. Send oss en mail eller ring!</p>
                            <h1>Påmelding</h1>
                            <f:verbatim rendered="#{CoursesWinter_Backing.haveUpcomingActiveCourses}">
                            <p>Lyst til å bli med? Velg kurs og gå til påmeldingssiden her:</p>
                            <table id="signOnBottom">
                                <tr>
                                    <td>
                                        <div class="my-skinnable-select">
                                            <t:selectOneMenu id="courses" binding="#{CoursesWinter_Backing.coursesSelect}" >
                                                <f:selectItems value="#{CoursesWinter_Backing.coursesSelectItems}"/>
                                            </t:selectOneMenu>
                                        </div>
                                    </td>
                                    <td>
                                        <h:outputLink value="CourseHaukeliseter.jsp" styleClass="button">
                                            <h:outputText value="Velg"/>
                                        </h:outputLink>
                                    </td>
                                </tr>
                            </table>
                            </f:verbatim>
                            <f:verbatim rendered="#{!CoursesWinter_Backing.haveUpcomingActiveCourses}">
                            <p>Vi har desverre ikke satt opp våre vinterkurs ennå.</p>
                            </f:verbatim>
                            </div>
                        </td>
                        <td class="rightSection">
                            <h1 >Video</h1>
                            <p>Se v&aring;r promoteringsvideo hvor vi presenterer v&aring;rt vinteropplegg p&aring; Haukeliser.</p>
                            <div class="flash"><object width="340" height="191"  ><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=1374480&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=c9ff23&amp;fullscreen=1" /><embed src="http://vimeo.com/moogaloop.swf?clip_id=1374480&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=c9ff23&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="340" height="191"></embed></object></div>

                            <h1>Webkamera</h1>
                            <p>Utsikten fra fjellstua akuratt nå</p>
                            <a name="modalImg" href="http://www.ormerod.no/wp-content/uploads/2010/01/haukeli1.jpg">
                              <img style="width:340" src="http://www.ormerod.no/wp-content/uploads/2010/01/haukeli1.jpg" alt="Klikk på bildet for større versjon" title="Klikk på bildet for større versjon" />
                            </a>
                            <h1>Les om tidligere vinterkurs</h1>
                            <table class="articleList">
                                <t:dataList value="#{CoursesWinter_Backing.courseArticles}" var="article">
                                    <tr>
                                        <td class="date"><span>
                                                <h:outputText value="#{article.createdDate}">
                                                    <f:convertDateTime dateStyle="short" pattern="dd.MM.yy"/>
                                                </h:outputText>
                                            </span></td>
                                        <td class="separator">|</td>
                                        <td>
                                            <t:htmlTag value="a">
                                                <f:param name="href" value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLArticlesAndVideos}#{ApplicationBean1.prettyURLArticle}#{article.prettyPrintId}" />
                                                <h:outputText value="#{article.name}"/>
                                            </t:htmlTag>
                                        </td>
                                    </tr>
                                </t:dataList>
                            </table>
                            <h1>Video fra tidligere vinterkurs</h1>
                            <table class="videoList">
                                <t:dataList value="#{CoursesWinter_Backing.courseVideos}" var="video">
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
                                                <f:param name="name" value="modalVid" />
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

