<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

        <title>kitesurfing.no - kite kurs på jæren</title>
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/default.css" />
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/skinned-select.css"/>
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/courseJaren.css" />
        <script type="text/javascript" src="${request.contextPath}/resources/js/default.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                if(window.top.setStyle){
                    window.top.setStyle("default");
                }
                $('a[name=modal]').click(function(e) {
                    e.preventDefault();
                    var url = $(this).attr('href');
                    //window.parent.$('a[name=modal]').click();
                    window.parent.openModalVideo(url);
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

                $(".aboutCourse a").click(function(event){
                    $(".aboutCourse").each(function (i) {
                        $(this).css("display","block");
                    });
                     $(this).parent().css("display","none");
                     event.preventDefault();
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
                                <h1>Kurs</h1>
                                <table class="courseList">
                                    <t:dataList value="#{CoursesSummer_Backing.courses}" var="course">
                                        <tr>
                                            <td style="width:260px">
                                                <h:outputLink value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLCourseSummer}#{course.prettyPrintId}">
                                                    <h:outputText value="#{course.startDate}"><f:converter converterId="DateConverterPtrnddMMM"/></h:outputText> - <h:outputText value="#{course.endDate}"><f:converter converterId="DateConverterPtrnddMMM"/></h:outputText> - <h:outputText value="#{course.name}"/>
                                                </h:outputLink>
                                                 <h:inputHidden value="#{course.startDate}"><f:convertDateTime pattern="yyyy"/></h:inputHidden>
                                            </td>
                                            <td>
                                                <h:outputLink value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLCourseSummer}#{course.prettyPrintId}" styleClass="button">
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
                            <div class="aboutCourse">
                                <h1>Hva er et nybegynnerkurs?</h1>
                                Målet vårt er at du som deltager skal sitte igjen med erfaring og kunnskap nok til å kunne gå ut å kite på egenhånd på snø eller vann etter et nybegynnerkurs.
                                Vi lærer deg de grunnleggende tingene, som sikkerhet, vurdering av spots, vær og vind, launching, landing og kraft kontroll. I løpet av et kurs tilstreber vi å gi alle one-on-one assistanse i de mer avanserte øvelsene.
                                <a href="blank" >Hva er "fra snø til vann" kurs</a>
                            </div>
                            <div style="display:none" class="aboutCourse">
                                <h1>Hva er et "fra snø til vann" kurs</h1>
                                Etter mange forespørsler har vi lansert et videregående kurs, perfekt for deg som har vært på vinterkurs og ønsker å prøve deg på vann. Kurset passer også deg som gått kurs på vann tidligere, men som trenger litt repitisjon og hjelp til å komme videre. Hovedmålet vårt er å få deg opp på brettet! Klarer vi det, jobber vi videre med å ta høyde, jibbing og kanskje til og med hopping.
                                <a href="blank" >Hva er et nybegynnerkurs</a>
                            </div>
                        </td>
                    </tr>
                </table>
                <table class="bottomSection">
                    <tr>
                        <td class="leftSection">
                            <div>
                                <h1>Hvem kan delta</h1>
                                <p>Kitesurfing er spennende og morsomt, og kombinerer elementer fra flere ulike vann- og snøsporter. Dette gjør det til en sport med mange muligheter, og det finnes garantert noe som tiltaler deg!</p>
                                <p>Til tross for at kitesurfing kan være en ekstremsport er det også en sport som er mulig å utøve av nesten alle! Det spiller ikke så stor rolle om du er 13, 20 eller 65 år og du trenger ikke å være sterk! Normal fysikk og viljen å lære er det viktigste! Det er en aktivitet der du velger selv på hvilken måte du vil utøve sporten, ekstremt eller rolig.</p>
                                <p>Å lære kiting er imidlertid både vanskelig og risikabelt dersom man prøver å lære på egen hånd! Av den grunn bør alle som har lyst til å begynne ta et kurs! Først og fremst med tanke på sikkerhet, men også for raskere progresjon. Er du under 16 år, må du ha med godkjennelse fra foreldre for å kunne delta. Rekomendert aldersgrense på kurs er 13 år, for yngre deltakere anbefaller vi å ta timer med egen instruktør.</p>
                                <h1>Kurstilbudene</h1>
                                <p>Vi tilbyr følgende kurs</p>
                                <a href="#nybegynnerkurs">Nybegynnerkurs, 2-3 dager</a>
                                <a href="#personal">Leksjoner med egen instruktør, for 1-6 personer</a>
                                <a href="#spesialer">Teambuilding/spesialer, etter eget ønske</a>
                                <h2><a name="nybegynnerkurs">Nybegynnerkurs</a></h2>
                                <p>Kurset har som mål å gjøre deg til en selvstendig kiter, slik at du kan klare deg alene på sjøen/fjellet med ditt eget utstyr. Kursene er praktisk lagt opp med mye drageflyging og moro, men det legges allikevel stor vekt på sikkerhet. Dersom vindforholdene tillater det, håper vi å kunne få alle opp på brettene i løpet av kurset.</p>
                                <p>Hovedtema på kurset vil være:</p>
                                <ul type="square">
                                    <li>Navigering av kite</li>
                                    <li>Forståelse av kitens flyområde og kraftsone</li>
                                    <li>Sikkerhet</li>
                                    <li>"Launching" og landing av kiten</li>
                                    <li>Rigging/nedrigging</li>
                                    <li>Kiteboarding på egenhånd</li>
                                    <li>Vurdering av forhold og kitespot</li>
                                    <li>Valg av utstyr</li>
                                </ul>
				<p>Pris: 2200 kr (2 dager, inkludert utstyr)</p>
				<h3>Vindgaranti...</h3>
				<p>Vi i Kitesurfing.no er opptatt av at kursdeltakerne skal være fornøyde og føle at de får valuta for pengene. Dersom værgudene skulle være vanskelige og det blir vanskelig å gjennomføre kurset på en tilfredstillende måte, er vi fleksible nok til å tilby dere plass på et annet kurs gratis! Vi regner med å kunne gjennomføre kurset dersom det er minimum 4 timer med nok vind for å fly kitene.</p>
				<h3>En ekstra dag...</h3>
				<p>Hvis det er intresse er det mulig å utvide kurset med en 3dje dag. Du skal ha all nødvendig ballast etter et 2 dagers nybegynnerkurs! Men erfaring viser at mange får stort utbytte av en ekstra dag for finpussing av ferdighetene man har tilegnet seg. Høres dette interessant ut? Husk å sjekke av i påmeldingsskjemaet, det gjør det enklere for oss å planlegge opplegget. Bindene påmelding til mandagen (og betaling) avtales med instruktøren i løpet av helgen dersom det ser ut til å bli bra forhold!</p>
                                <h2><a name="personal">Leksjoner med egen instruktør</a></h2>
                                <p>På egne leksjoner har du selv mulighet å velge hvor fokus skal ligge. Vil du ha det samme opplegg som på et nybegynnerkurs men ha instruktør før deg selv og når du selv ønsker? Vil du ha videregående kurs eller hjelp å komme igang på vann etter å ha prøvd på snø?</p>
				<p>Privat-timene har som mål å gi all fokus til deg og når du ønsker det. Vi er veldig fleksible og kan gå ut når forholdene er som best sånn at du får maksimalt ut av timene dine. Leksjonene  er praktisk lagt opp med nesten utelukkende øving i vannet, med forklarende teori underveis.</p>
                                <p>Priser for leksjoner med egen instruktør, inkludert utstyr:</p>
                                <ul type="square">
                                    <li>1 person; 450 kr pr time</li>
                                    <li>2 personer; 350 kr pr time</li>
                                    <li>3-6 personer; 250 kr pr time</li>
                                </ul>
                               	<h2><a name="spesialer">Teambuilding / Spesialer</a></h2>
                                <p>Er dere en gjeng som vil finne på noe morsomt sammen? Vi lager et spesialtilpasset opplegg i samarbeid med dere! Som regel blir det opplegg med mer action og med mindre fokus på forståelse sammenlignet med nybegynnerkurs, men fortsatt med stor vekt på sikkerhet. </p>
				<p>Vi kan "underholde" 18 personer av gangen (6 pers pr instruktør), men opplegget kan også kombineres med bølgesurfing eller rett og slett sys inn i et rulleringsopplegg dersom gruppen er for stor for å la alle kite samtidig.</p>
                                <p>Opplegget vil fokusere på:</p>
                                <ul type="square">
                                    <li>Mestring - opplevelsen av å lære noe nytt</li>
                                    <li>Opplevelse - å styre en kite og føle på kreftene</li>
                                    <li>Samarbeid - vi jobber i par og må stole på hverandre</li>
                                    <li>Sikkerhet</li>
                                    <li>Forsøke seg på brett</li>
                                </ul>
				<p>Pris: Etter avtale</p>
                                <h1>Lokasjon</h1>
                                <p>Kursene vil normalt sett holdes på en av strendene på Nord Jæren. Eksakt hvilken strand som benyttes vil avhenge av vindretning, og vil derfor variere fra gang til gang. Aktuelle strender er: Solastranden - Orrestranden - Hellestø - Brusand.</p>
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
                                <h1>Påmelding</h1>
                                <f:verbatim rendered="#{CoursesSummer_Backing.haveUpcomingActiveCourses}">
                                <p>Lyst til å bli med? Velg kurs og gå til påmeldingssiden her:</p>
                                <table id="signOnBottom">
                                    <tr>
                                        <td>
                                            <div class="my-skinnable-select">
                                                <t:selectOneMenu id="courses" binding="#{CoursesSummer_Backing.coursesSelect}" >
                                                    <f:selectItems value="#{CoursesSummer_Backing.coursesSelectItems}"/>
                                                </t:selectOneMenu>
                                            </div>
                                        </td>
                                        <td>
                                            <h:outputLink value="SignUpSummer.jsp" styleClass="button">
                                                <h:outputText value="Velg"/>
                                            </h:outputLink>
                                        </td>
                                    </tr>
                                </table>
                                </f:verbatim>
                                <f:verbatim rendered="#{!CoursesSummer_Backing.haveUpcomingActiveCourses}">
                                <p>Vi har desverre ikke satt opp våre sommerkurs ennå.</p>
                                </f:verbatim>
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
                                                <f:param name="href" value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLArticlesAndVideos}#{ApplicationBean1.prettyURLArticle}#{article.prettyPrintId}" />
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


