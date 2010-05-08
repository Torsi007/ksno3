<jsp:include page="Heading.jsp" ></jsp:include>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>


        <title>kitesurfing.no - kitekurs</title>
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/default.css" />
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/skinned-select.css"/>
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/coursesHaukeliseter.css" />
        <script type="text/javascript" src="${request.contextPath}/resources/js/default.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
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
                                <table class="courseList">
                                    <t:dataList value="#{CoursesWinter_Backing.courses}" var="course">
                                        <tr>
                                            <td style="width:120px">
                                                <h:outputLink value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLCourseWinter}#{course.prettyPrintId}">
                                                    <h:outputText value="#{course.startDate}"><f:converter converterId="DateConverterPtrnddMMM"/></h:outputText> - <h:outputText value="#{course.endDate}"><f:converter converterId="DateConverterPtrnddMMM"/></h:outputText>
                                                </h:outputLink>
                                                 <h:inputHidden value="#{course.startDate}"><f:convertDateTime pattern="yyyy"/></h:inputHidden>
                                            </td>
                                            <td>
                                                <h:outputLink value="#{ApplicationBean1.contextPath}#{ApplicationBean1.prettyURLCourseWinter}#{course.prettyPrintId}" styleClass="button">
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
                            <h1>Hva er kiting og for hvem?</h1>
                            <p>Kitesurfing er spennende, morsomt og en sport med mange muligheter. Det finnes garantert noe som tiltaler deg! Med kiten kan du gjøre alt fra å gi deg ut på alt fra rolige, lange skiturer på fjellet til å surfe på sjøen om sommeren.</p>
                            <p>Til tross for at kitesurfing kan være en ekstremsport er det også en sport som er mulig å utøve av nesten alle. Det spiller faktisk ingen rolle om du er 10, 20 eller 65 år og du trenger ikke å være særlig sterk! Det er en riktig familieaktivitet, der alle kan utøve sporten på sin måte, ekstremt eller rolig.</p>
                            <p>Å lære kiting er imidlertid både vanskelig og forenet med risiko dersom man prøver å lære på egen hånd. Av den grunn bør alle som har lyst til å begynne ta et kurs! Først og fremst med tanke på sikkerhet, men også for raskere progresjon. Du trenger ingen forkunnskaper for å gå et kurs!</p>
                            <h1>Kurstilbudene</h1>
                            <p>Vi tilbyr 2-dagers nybegynnerkurs som er åpne for alle og spesial-kurs for grupper og bedrifter.</p>
                            <p>Hovedtema på kurset vil være:</p>
                            <ul type="square">
                                <li>Forståelse av kitens flyområder og kraftsoner</li>
                                <li>Linedisiplin</li>
                                <li>Sikkerhet</li>
                                <li>Rigging/nedrigging</li>
                                <li>"Launching" og landing av kiten</li>
                                <li>Navigering av kite</li>
                                <li>Kiteboarding/skiing på egenhånd</li>
                                <li>Valg av utstyr</li>
                            </ul>
                            <p>Dersom dere vil ha et spesialkurs kan vi og lage et opplegg der vi fokuserer mer på action og morro, og midre på detaljer og teori. Vi kan også ordne kombinasjoner med hundekjøring, toppturer eller andre aktiviteter. Varighet og lokasjon på spesialkursene kan dere være med å påvirke.</p>
                            <h1>Lokasjon</h1>
                            <p>Oppmøte og utgangspunkt for kurset vil være på <a href="http://www.haukeliseter.no/" target="_blank">Haukeliseter fjellstue</a>. Eksakt lokasjon vil avhenge av vindretning, og vil derfor variere fra gang til gang.</p>
                            <h1>Pris</h1>
                            <h2>2 dagers kurs</h2>
                            <p>Kun kurs</p>
                            <ul type="square">
                                <li>1 Person : 1950 kr</li>
                            </ul>
                            <h2>Pakkepris med kost og losji</h2>
                            <p>Prisen varierer beroende på hva du ønsker for losji og mat. Vi har valgt å lage to forskjellige priseksempel for å tilgodese alle lommebøker.
                                <br/>
                                Et rimelig alternativ, med losji på stabbur, for deg som vil ha enkel losji og som trenger penger til kiteutstyr. Inkludert er del i stabbursrom to netter med tilgang til kjøkken, treretterts middag og villmarkspa lørdags kveld, samt kitekurs og lån av utstyr hele helgen.
                                <br/>
                                "Fullpensjon og fjellrom" er for de som vil ha litt mer luksus. Da er det inkludert treretters middag lørdags kveld samt frokost og niste for to dager. Boendet er i fjellrom, to netter, med dusj, toalett og oppredde senger. Kitekurs og lån av utstyr hele helgen er selvfølgelig og inkludert. 
                            </p>
                            <h2>Kitekurs, middag og losji på stabbur</h2>
                            <ul type="square">
                                <li>DNT medlem, under 26 : 2515 kr</li>
                                <li>DNT medlem, voksen : 2690 kr</li>
                                <li>Ikke medlem : 2890 kr</li>
                            </ul>
                            <h2>Kitekurs "Fullpensjon og Fjellrom"</h2>
                            <ul type="square">
                                <li>DNT medlem, voksen : 3500 kr</li>
                                <li>Ikke medlem : 3700 kr</li>
                            </ul>
                            <h1>Vindgaranti</h1>
                            <p>Vi i Kitesurfing.no er opptatt av at kursdeltakerne skal være fornøyde og føle at de får valuta for pengene. Dersom værgudene skulle være vanskelige og det blir vanskelig å gjennomføre kurset på en tilfredstillende måte, er vi fleksible nok til å tilby dere plass på et annet kurs gratis! Vi regner med å kunne gjennomføre kurset dersom det er minimum 4 timer med nok vind for å fly kitene.
                                <br/>
                                Dere må fortsatt betale for kost og losji dersom dere bor på Haukeliseter
                            </p>
                            <h1>Praktisk</h1>
                            <p>Vi stiller med:</p>
                            <ul type="square">
                                <li>Drager</li>
                                <li>Trapeser</li>
                                <li>Ekstra hjelmer for de som ikke har egen</li>
                            </ul>
                            <p>
                                Dere bør ta med:
                            </p>
                            <ul type="square">
                                <li>Godt med klær, inkludert varm jakke i pausene, ekstra votter og gamasjer! Vi er ute i snøen hele dagen! </li>
                                <li>Alpin-ski eller snowboard. (Kan du begge anbefaler vi ski i starten. Vi frarader å bruke fjellski.)</li>
                                <li>Solfaktor</li>
                                <li>Hjelm og snøbriller</li>
                                <li>Termos</li>
                                <li>Badeklær / undertøy for bruk i stampen.</li>
                                <li>For skikjørere med stive plastsko: Alternativ, varm støvel som er lettere å bevege seg i før vi begynner med ski på beina.</li>
                                <li>Eget sengetøy / sovepose hvis du bor på stabbur eller selvstellsrom. Du kan og leie i resepsjonen.</li>
                            </ul>
                            <h1>Spørsmål?</h1>
                            <p>Har du noen spørsmål så send mail til <a href="mailto:info@kitesurfing.no">info@kitesurfing.no</a> eller ring oss.</p>
                            <p>For spørsmål angående overnatting, mat og losji, ring <a href="http://www.haukeliseter.no/" target="_blank">Haukeliseter</a> på tlf 35062777 eller send mail til <a href="mailto:info@haukeliseter.no">info@haukeliseter.no</a></p>
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
                            <a name="modalImg" href="http://haukeliseter.no/share/img/webkamera/haukeliseter.jpg">
                              <img style="width:340" src="http://haukeliseter.no/share/img/webkamera/haukeliseter.jpg" alt="Klikk på bildet for større versjon" title="Klikk på bildet for større versjon" />
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

