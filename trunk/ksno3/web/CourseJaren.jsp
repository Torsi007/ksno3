<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

        <title>kitesurfing.no - kite kurs p� j�ren</title>
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
                                M�let v�rt er at du som deltager skal sitte igjen med erfaring og kunnskap nok til � kunne g� ut � kite p� egenh�nd p� sn� eller vann etter et nybegynnerkurs.
                                Vi l�rer deg de grunnleggende tingene, som sikkerhet, vurdering av spots, v�r og vind, launching, landing og kraft kontroll. I l�pet av et kurs tilstreber vi � gi alle one-on-one assistanse i de mer avanserte �velsene.
                                <a href="blank" >Hva er "fra sn� til vann" kurs</a>
                            </div>
                            <div style="display:none" class="aboutCourse">
                                <h1>Hva er et "fra sn� til vann" kurs</h1>
                                Etter mange foresp�rsler har vi lansert et videreg�ende kurs, perfekt for deg som har v�rt p� vinterkurs og �nsker � pr�ve deg p� vann. Kurset passer ogs� deg som g�tt kurs p� vann tidligere, men som trenger litt repitisjon og hjelp til � komme videre. Hovedm�let v�rt er � f� deg opp p� brettet! Klarer vi det, jobber vi videre med � ta h�yde, jibbing og kanskje til og med hopping.
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
                                <p>Kitesurfing er spennende og morsomt, og kombinerer elementer fra flere ulike vann- og sn�sporter. Dette gj�r det til en sport med mange muligheter, og det finnes garantert noe som tiltaler deg!</p>
                                <p>Til tross for at kitesurfing kan v�re en ekstremsport er det ogs� en sport som er mulig � ut�ve av nesten alle! Det spiller ikke s� stor rolle om du er 13, 20 eller 65 �r og du trenger ikke � v�re sterk! Normal fysikk og viljen � l�re er det viktigste! Det er en aktivitet der du velger selv p� hvilken m�te du vil ut�ve sporten, ekstremt eller rolig.</p>
                                <p>� l�re kiting er imidlertid b�de vanskelig og risikabelt dersom man pr�ver � l�re p� egen h�nd! Av den grunn b�r alle som har lyst til � begynne ta et kurs! F�rst og fremst med tanke p� sikkerhet, men ogs� for raskere progresjon. Er du under 16 �r, m� du ha med godkjennelse fra foreldre for � kunne delta. Rekomendert aldersgrense p� kurs er 13 �r, for yngre deltakere anbefaller vi � ta timer med egen instrukt�r.</p>
                                <h1>Kurstilbudene</h1>
                                <p>Vi tilbyr f�lgende kurs</p>
                                <a href="#nybegynnerkurs">Nybegynnerkurs, 2-3 dager</a>
                                <a href="#personal">Leksjoner med egen instrukt�r, for 1-6 personer</a>
                                <a href="#spesialer">Teambuilding/spesialer, etter eget �nske</a>
                                <h2><a name="nybegynnerkurs">Nybegynnerkurs</a></h2>
                                <p>Kurset har som m�l � gj�re deg til en selvstendig kiter, slik at du kan klare deg alene p� sj�en/fjellet med ditt eget utstyr. Kursene er praktisk lagt opp med mye drageflyging og moro, men det legges allikevel stor vekt p� sikkerhet. Dersom vindforholdene tillater det, h�per vi � kunne f� alle opp p� brettene i l�pet av kurset.</p>
                                <p>Hovedtema p� kurset vil v�re:</p>
                                <ul type="square">
                                    <li>Navigering av kite</li>
                                    <li>Forst�else av kitens flyomr�de og kraftsone</li>
                                    <li>Sikkerhet</li>
                                    <li>"Launching" og landing av kiten</li>
                                    <li>Rigging/nedrigging</li>
                                    <li>Kiteboarding p� egenh�nd</li>
                                    <li>Vurdering av forhold og kitespot</li>
                                    <li>Valg av utstyr</li>
                                </ul>
				<p>Pris: 2200 kr (2 dager, inkludert utstyr)</p>
				<h3>Vindgaranti...</h3>
				<p>Vi i Kitesurfing.no er opptatt av at kursdeltakerne skal v�re forn�yde og f�le at de f�r valuta for pengene. Dersom v�rgudene skulle v�re vanskelige og det blir vanskelig � gjennomf�re kurset p� en tilfredstillende m�te, er vi fleksible nok til � tilby dere plass p� et annet kurs gratis! Vi regner med � kunne gjennomf�re kurset dersom det er minimum 4 timer med nok vind for � fly kitene.</p>
				<h3>En ekstra dag...</h3>
				<p>Hvis det er intresse er det mulig � utvide kurset med en 3dje dag. Du skal ha all n�dvendig ballast etter et 2 dagers nybegynnerkurs! Men erfaring viser at mange f�r stort utbytte av en ekstra dag for finpussing av ferdighetene man har tilegnet seg. H�res dette interessant ut? Husk � sjekke av i p�meldingsskjemaet, det gj�r det enklere for oss � planlegge opplegget. Bindene p�melding til mandagen (og betaling) avtales med instrukt�ren i l�pet av helgen dersom det ser ut til � bli bra forhold!</p>
                                <h2><a name="personal">Leksjoner med egen instrukt�r</a></h2>
                                <p>P� egne leksjoner har du selv mulighet � velge hvor fokus skal ligge. Vil du ha det samme opplegg som p� et nybegynnerkurs men ha instrukt�r f�r deg selv og n�r du selv �nsker? Vil du ha videreg�ende kurs eller hjelp � komme igang p� vann etter � ha pr�vd p� sn�?</p>
				<p>Privat-timene har som m�l � gi all fokus til deg og n�r du �nsker det. Vi er veldig fleksible og kan g� ut n�r forholdene er som best s�nn at du f�r maksimalt ut av timene dine. Leksjonene  er praktisk lagt opp med nesten utelukkende �ving i vannet, med forklarende teori underveis.</p>
                                <p>Priser for leksjoner med egen instrukt�r, inkludert utstyr:</p>
                                <ul type="square">
                                    <li>1 person; 450 kr pr time</li>
                                    <li>2 personer; 350 kr pr time</li>
                                    <li>3-6 personer; 250 kr pr time</li>
                                </ul>
                               	<h2><a name="spesialer">Teambuilding / Spesialer</a></h2>
                                <p>Er dere en gjeng som vil finne p� noe morsomt sammen? Vi lager et spesialtilpasset opplegg i samarbeid med dere! Som regel blir det opplegg med mer action og med mindre fokus p� forst�else sammenlignet med nybegynnerkurs, men fortsatt med stor vekt p� sikkerhet. </p>
				<p>Vi kan "underholde" 18 personer av gangen (6 pers pr instrukt�r), men opplegget kan ogs� kombineres med b�lgesurfing eller rett og slett sys inn i et rulleringsopplegg dersom gruppen er for stor for � la alle kite samtidig.</p>
                                <p>Opplegget vil fokusere p�:</p>
                                <ul type="square">
                                    <li>Mestring - opplevelsen av � l�re noe nytt</li>
                                    <li>Opplevelse - � styre en kite og f�le p� kreftene</li>
                                    <li>Samarbeid - vi jobber i par og m� stole p� hverandre</li>
                                    <li>Sikkerhet</li>
                                    <li>Fors�ke seg p� brett</li>
                                </ul>
				<p>Pris: Etter avtale</p>
                                <h1>Lokasjon</h1>
                                <p>Kursene vil normalt sett holdes p� en av strendene p� Nord J�ren. Eksakt hvilken strand som benyttes vil avhenge av vindretning, og vil derfor variere fra gang til gang. Aktuelle strender er: Solastranden - Orrestranden - Hellest� - Brusand.</p>
                                <h1>Praktisk</h1>
                                <p>Vi stiller med:</p>
                                <ul type="square">
                                    <li>Drager</li>
                                    <li>Trapeser</li>
                                    <li>Brett</li>
                                    <li>Hjelmer og redningsvester</li>
                                    <li>V�tdrakter til utleie</li>
                                </ul>
                                <p>
                                    Dere b�r ta med:
                                </p>
                                <ul type="square">
                                    <li>Solfaktor og solbriller</li>
                                    <li>Godt med kl�r</li>
                                    <li>Niste for hele dagen</li>
                                    <li>Transportmiddel til/fra stranda</li>
                                </ul>
                                <h1>P�melding</h1>
                                <f:verbatim rendered="#{CoursesSummer_Backing.haveUpcomingActiveCourses}">
                                <p>Lyst til � bli med? Velg kurs og g� til p�meldingssiden her:</p>
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
                                <p>Vi har desverre ikke satt opp v�re sommerkurs enn�.</p>
                                </f:verbatim>
                                <h1>Sp�rsm�l?</h1>
                                <p>Har du noen sp�rsm�l s� send mail til <a href="mailto:info@kitesurfing.no">info@kitesurfing.no</a> eller ring oss.</p>
                                <p>Vi kan sette opp ettermiddager med kurs om det er nok interesse. Det er og mulig � booke andre datoer for kurs til vennegjenger eller bedrifter som har spesielle �nsker. Send oss en mail eller ring.</p>
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


