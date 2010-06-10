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
            <div class="topMenu" style="display:none">
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
                                <p>Kitesurfing er spennende og morsomt, og kombinerer elementer fra flere ulike vann- og sn�sporter. Dette gj�r det til en sport med mange muligheter, og det finnes garantert noe som tiltaler deg! Mulighetene er mange! Kanskje er du den litt forsiktige typen som �nsker � bruke kiten til naturopplevelser i form av rolige lange skiturer p� fjellet. Om du er litt t�ffere foretrekker du kanskje heller en freestyle �kt med stor fart og ekstreme hopp, eller hva med � kite for � ri store b�lger med et surfebrett?</p>
                                <p>Til tross for at kitesurfing kan v�re en ekstremsport er det ogs� en sport som er mulig � ut�ve av nesten alle! Det spiller faktisk ingen rolle om du er 10, 20 eller 65 �r og du trenger ikke � v�re sterk! Det er en riktig familieaktivitet, der alle kan ut�ve sporten p� sin m�te ekstremt eller rolig.</p>
                                <p>� l�re kiting er imidlertid b�de vanskelig og risikabelt dersom man pr�ver � l�re p� egen h�nd! Av den grunn b�r alle som har lyst til � begynne ta et kurs! F�rst og fremst med tanke p� sikkerhet, men ogs� for  raskere progresjon. Er du under 16 �r, m� du ha med godkjennelse fra foreldre for � kunne delta.</p>
                                <h1>Kurstilbudene</h1>
                                <p>Vi tilbyr f�lgende kurs</p>
                                <a href="#nybegynnerkurs">Nybegynnerkurs, 2-3 dager</a>
                                <a href="#sn�tilvann">"Fra sn� til vann", 2-3 dager</a>
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
                                <h2><a name="sn�tilvann">"Fra sn� til vann"</a></h2>
                                <p>Kurset har som m�l � gj�re deg som allerede kan navigere en kite til en selvstendig vannkiter. Kursene er praktisk lagt opp med nesten utelukkende �ving i vannet, men fortsatt med stor vekt p� sikkerhet og hvordan man gj�r ting p� riktig m�te. Vi h�per � kunne f� alle til � kunne kj�re p� brettene i l�pet av kurset.</p>
                                <p>Hovedtema p� kurset vil v�re:</p>
                                <ul type="square">
                                    <li>Vannstart - � komme seg opp p� brettet</li>
                                    <li>Bodydraging for � f� tak i mistet brett</li>
                                    <li>Hvordan holde h�yde mot vinden</li>
                                    <li>"Launching" og landing av kiten p� stranda</li>
                                    <li>Sikkerhet ved kiting p� vann</li>
                                    <li>Repetisjon av grunnleggende ting for de som trenger det</li>
                                    <li>Jibbing - teknikker for � snu p� vann</li>
                                    <li>Hoppteknikk - for de som kommer s� langt</li>
                                    <li>Vurdering av forhold og kitespo</li>
                                    <li>Litt om utstyr for vannkiting</li>
                                </ul>
                                <h2><a name="spesialer">Teambuilding / Spesialer</a></h2>
                                <p>Vi lager et spesialtilpasset opplegg i samarbeid med dere! Vi pleier � lage opplegg som med mer action og med mindre fokus p� forst�else, men fortsatt med stor vekt p� at ting skjer p� en sikker m�te! Vi kan "underholde" 18 personer av gangen, men opplegget kan ogs� kombineres med hundespannskj�ring/skitur (vinter), b�lgesurfing (sommer), eller rett og slett sys inn i et rulleringsopplegg dersom gruppen er for stor for � la alle kite samtidig.</p>
                                <p>Opplegget vil fokusere p�:</p>
                                <ul type="square">
                                    <li>Mestring - opplevelsen av � l�re noe nytt</li>
                                    <li>Opplevelse - � styre en kite og f�le p� kreftene</li>
                                    <li>Samarbeid - vi jobber i par og m� stole p� hverandre</li>
                                    <li>Sikkerhet</li>
                                    <li>Fors�ke seg p� brett</li>
                                </ul>
                                <h1>Lokasjon</h1>
                                <p>Kursene vil normalt sett holdes p� en av strendene p� Nord J�ren. Eksakt hvilken strand som benyttes vil avhenge av vindretning, og vil derfor variere fra gang til gang. Aktuelle strender er: Solastranden - Orrestranden - Hellest� - Brusand.</p>
                                <h1>Pris</h1>
                                <h2>Nybegynnerkurs</h2>
                                <ul type="square">
                                    <li>1 Person : 1900 NOK</li>
                                </ul>
                                <p>Det er mulig � melde seg p� en 3dje dag, mandagen. Du skal ha all n�dvendig ballast etter et 2 dagers nybegynnerkurs! Men erfaring viser at mange f�r stort utbytte av en ekstra dag for finpussing av ferdighetene man har tilegnet seg. H�res dette interessant ut? Husk � sjekke av i p�meldingsskjemaet, det gj�r det enklere for oss � planlegge opplegget. Bindene p�melding til mandagen (og betaling) avtales med instrukt�ren i l�pet av helgen dersom det ser ut til � bli bra forhold! Prisen er 800,-/person inkludert utstyr. Minimum 2 deltakere.</p>
                                <h2>Neopren</h2>
                                <ul type="square">
                                    <li>V�tdrakt/sko: 250 NOK</li>
                                </ul>
                                <h2>Teambuilding / Spesialer</h2>
                                <p>Teambuilding / Spesialer koster fra 5000 NOK avhengig av tidsramme og innhold.</p>
                                <h2>Rabatter</h2>
                                <p>Grupperabatt - hver 6 mann er gratis!:</p>
                                <p>Klarer du � samle en gjeng p� 6 mann betaler dere alts� for 5 deltagere. Det samme p�l�per for 12. og 18. mann...</p>
                                <h1>Vindgaranti</h1>
                                <p>Vi i Kitesurfing.no er opptatt av at kursdeltakerne skal v�re forn�yde og f�le at de f�r valuta for pengene. Dersom v�rgudene skulle v�re vanskelige og det blir vanskelig � gjennomf�re kurset p� en tilfredstillende m�te, er vi fleksible nok til � tilby dere plass p� et annet kurs gratis! Vi regner med � kunne gjennomf�re kurset dersom det er minimum 4 timer med nok vind for � fly kitene. Vindgarantien er gyldig p� nybegynnerkursene og �fra sn� til vann� kursene.</p>
                                <p>Da vi trenger litt mer vind for �fra sn� til vann� kursene (5-6m/s), for � virkelig komme oss opp p� brettet, m� vi v�re mer kritiske med valg av kursdager. Av den grunn kan det v�re at vi ser allerede p� forh�nd at kurset m� flytte til annet dato. Vi ber dere � ha forst�else for dette, vi gj�r v�rt beste for � gi dere beste mulige forhold for � l�re.</p>                                
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


