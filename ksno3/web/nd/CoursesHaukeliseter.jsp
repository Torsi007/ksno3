<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<html>
    <head>
        <title>kitesurfing.no - kite kurs på jæren</title>
        <link rel="stylesheet" type="text/css" href="css/default.css" />
        <link rel="stylesheet" type="text/css" href="css/coursesHaukeliseter.css" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/default.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                window.top.setStyle("default");
            });
        </script>
    </head>
    <body>
        <f:view>
            <h:form>
                <table class="middleSection">
                    <tr>
                        <td class="leftSection" >
                            <div>
                                <h1>Kurs</h1>
                                <table class="courseList">
                                    <t:dataList value="#{CoursesWinter_Backing.courses}" var="course">
                                        <tr>
                                            <td style="width:146px"><h:outputText value="#{course.startDate} - #{course.endDate}"/></td>
                                            <td style="width:6px">|</td>
                                            <td style="width:106px"><h:outputText value="#{course.name}"/></td>
                                            <td>
                                                <h:outputLink value="CourseHaukeliseter.jsp" styleClass="button">
                                                    <f:param name="id" value="#{course.id}"/>
                                                    <h:outputText value="#{course.availableSeats}"/>
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
                        <td>
                            <div>
                            <h1>Hvem kan delta</h1>
                            <p>Kitesurfing er spennende og morsomt, og kombinerer elementer fra flere ulike vannsporter.Det beste fra wakeboard, surfing og windsurfing er satt sammen til en sport full av action og utfordringer.Alle som har lyst til å begynne bør ta et kurs. Først og fremst med tanke på sikkerhet, men også for å lære grunnleggende teknikk, noe som igjen gir grunnlag for raskere progresjon.Er du under 16 år, må du ha med godkjennelse fra foreldre for å kunne delta.</p>
                            <h1>Kurstilbudene</h1>
                            <h2>2 dagers kurs</h2>
                            <p>Kurset har som mål å gjøre deg til en selvstendig kitesurfer, slik at du kan klare deg alene på sjøen/fjellet med ditt nyanskaffede utstyr. Kursene er praktisk lagt opp med mye drageflyging og moro, men det legges allikevel stor vekt på sikkerhet. Dersom vindforholdene tillater det, håper vi å kunne få alle opp på brettene i løpet av kurset.</p>
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
                            <h2>Teambuilding / Spesialer</h2>
                            <p>Vi lager et opplegg som er spesialtilpasset dine ønsker. Utgangspunktet er en fire-timers basis der vi fokuserer på action og morro, istedet for detaljer og teori. Vi kan også ordne kombinasjoner med hundekjøring, toppturer eller andre aktiviteter.						Varighet og lokasjon kan dere være med å påvirke. Ta kontakt for nærmere info.</p>
                            <h1>Lokasjon</h1>
                            <p>Oppmøte og utgangspunkt for kurset vil være på <a href="http://www.haukeliseter.no/" target="_blank">Haukeliseter fjellstue</a>. Eksakt lokasjon vil avhenge av vindretning, og vil derfor variere fra gang til gang.</p>
                            <h1>Pris</h1>
                            <h2>2 dagers kurs</h2>
                            <p>Kun kurs</p>
                            <ul type="square">
                                <li>1 Person : 1900 NOK</li>
                                <li>1 Person, DNT medlem : 1800 NOK</li>
                            </ul>
                            <p>Kurs og overnatting - lavbudsjett</p>
                            <ul type="square">
                                <li>1 Person, DNT medlem, under 26 : 2515 NOK</li>
                                <li>1 Person, DNT medlem, voksen : 2690 NOK</li>
                                <li>1 Person : 2890 NOK</li>
                            </ul>
                            <p>Følgende inngår: Overnatting to netter på <a href="http://www.haukeliseter.no/" target="_blank">Haukeliseter fjellstue</a> i delt stabbursrom. Felles toalett, dusj og kjøkken i nabobygg. Treretters middag på lørdag, og villmarkspa på kvelden. <br>Tillegg frokost og niste for to dager, kr 330.</p>
                            <p>Kurs og overnatting - Fullpensjon og Fjellrom</p>
                            <ul type="square">
                                <li>1 Person, DNT medlem : 3500 NOK</li>
                                <li>1 Person : 3700 NOK</li>
                            </ul>
                            <p>Følgende inngår: Overnatting to netter på <a href="http://www.haukeliseter.no/" target="_blank">Haukeliseter fjellstue</a> i fjellrom med bad og tolett på rommet. Frokost lørdag og søndag, niste og treretters middag på lørdag, og villmarkspa på kvelden.</p>
                            <h2>Teambuilding / Spesialer</h2>
                            <p>Teambuilding / Spesialer koster fra 5000 NOK avhengig av tidsramme og innhold.</p>
                            <h2>Rabatter</h2>
                            <p>Grupperabatt:</p>
                            <ul type="square">
                                <li>4-6 pers: 150/pers
                                </li>
                                <li>7-10 pers: 300/pers</li>
                            </ul>
                            <p>Vi gir også gode priser til studenter, vernepliktige og medlemmer i de kiteklubbene vi samarbeider med.<br>Kontakt oss for avtale!</p>
                            <h1>Kundegaranti</h1>
                            <p>Vi i Kitesurfing.no er opptatt av at kursdeltakerne skal være fornøyde og føle at de får valuta for pengene.					Dersom værgudene skulle være vanskelige og det blir vanskelig å gjennomføre kurset på en tilfredstillende måte,					er vi fleksible nok til å finne en løsning dere som kunder er tilfreds med.					Alle deltakere får muligheten til å gå gjennom alt innholdet i et helt kurs.</p>
                            <h1>Praktisk</h1>
                            <p>Vi stiller med:</p>
                            <ul type="square">
                                <li>Drager</li>
                                <li>Trapeser</li>
                                <li>Hjelmer</li>
                            </ul>
                            <p>
                                Dere bør ta med:
                            </p>
                            <ul type="square">
                                <li>Solfaktor</li>
                                <li>Godt med klær</li>
                                <li>Snøbriller</li>
                                <li>Ski og eller snowboard</li>
                                <li>Gamasjer</li>
                            </ul>
                            <p>Den første praktiske leksjonen vil foregå uten ski/brett. Vi øver på å navigere dragen stående på bena. Vi anbefaler de av dere som kjører alpint eller telemark til å ta med et par høye varme støvler (i tillegg til skistøvlene), da det er lettere å bevege seg i disse. Dere som kjører snowboard kan benytte snowboard støvlene.					Hvis du er en av dem som mestrer både ski og snowboard anbefaler vi deg å benytte skiene først da dette vil gi raskest progresjon. Men ta gjerne med begge deler på kurset.					En god stor varm dunjakke er genialt å kunne ta på seg i pausene mellom de praktiske leksjonene. Om du er medlem av <a href="http://www.turistforeningen.no/" target="_blank">DNT</a> eller en annen organisasjon som gir deg rett til rabatt, må du fremvise medlemskort eller lignende identifikasjon ved fremmøte lørdag.					<br>					Om du overnatter på lavbudsjett på fjellstuen må ta ta med eget sengetøy.</p>
                            <h1>Spørsmål?</h1>
                            <p>Har du noen spørsmål så send mail til <a href="mailto:info@kitesurfing.no">info@kitesurfing.no</a> eller ring oss.</p>
                            <p>Vi kan sette opp ettermiddager med kurs om det er nok interesse. Det er og mulig å booke andre datoer for kurs til vennegjenger eller bedrifter som har spesielle ønsker. Send oss en mail eller ting.</p>
                            </div>
                        </td>
                    </tr>
                </table>
            </h:form>
        </f:view>
    </body>
</html>

