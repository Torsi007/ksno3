<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<html>
    <head>
        <title>kitesurfing.no - kite kurs på jæren</title>
        <link rel="stylesheet" type="text/css" href="css/default.css" />
        <link rel="stylesheet" type="text/css" href="css/courseJaren.css" />
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
                                    <t:dataList value="#{CoursesSummer_Backing.courses}" var="course">
                                        <tr>
                                            <td style="width:146px"><h:outputText value="#{course.startDate} - #{course.endDate}"/></td>
                                            <td style="width:6px">|</td>
                                            <td style="width:106px"><h:outputText value="#{course.name}"/></td>
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
                            <p>Kursene vil holdes på en av strendene på Nord Jæren. Eksakt hvilken strand som benyttes vil avhenge av vindretning, og vil derfor variere fra gang til gang. Aktuelle strender er: Solastranden - Orrestranden - Hellestø - Brusand.</p>
                            <h1>Pris</h1>
                            <h2>Nybegynnerkurs</h2>
                            <ul type="square">
                                <li>1 Person : 1900 NOK</li>
                            </ul>
                            <h2>Neopren</h2>
                            <ul type="square">
                                <li>Våtdrakt/sko: 300 NOK</li>
                            </ul>
                            <h2>Teambuilding / Spesialer</h2>
                            <p>Teambuilding / Spesialer koster fra 5000 NOK avhengig av tidsramme og innhold.</p>
                            <h2>Rabatter</h2>
                            <p>Grupperabatt - hver 6 mann er gratis!:</p>
                            <p>Klarer du å samle en gjeng på 6 mann betaler dere altså for 5 deltagere. Det samme påløper for 12. og 18 mann...</p>
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

