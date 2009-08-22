<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>



<%--
    This file is an entry point for JavaServer Faces application.
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="resources/js/logic.js" type="text/javascript"></script>
        <script src="resources/js/layout.js" type="text/javascript"></script>            
        <link rel="stylesheet" type="text/css" href="resources/css/style.css"/>        
        <title>Kitesurfing.no</title>
    </head>
    <body style="background-image : url(resources/img/components/backgrounds/header.jpg); overflow:hidden" >
        <f:view>
            <table cellspacing="0" cellpadding="0" class="fullstretch outer">        
                <tr><td colspan="100" style="height: 67"/></tr>
                <tr style="height: 1"><td colspan="100" class="heading"  style="text-indent: 160">Instruction and Training</td></tr>		
                <tr cellspacing="0" cellpadding="0">	
                    <td style="height: 100%">
                        <style type="text/css">.loginLink {cursor:hand;}</style>
                        <table cellspacing="0" cellpadding="0" class="menu" id="menu">   
                            <tr style="height: 1">        
                                <td><img src="resources/img/components/backgrounds/menu_top.gif"/></td>    
                            </tr>    
                            <tr>		
                                <td class="menu" style="background-image: url(resources/img/components/backgrounds/menu_stretch.gif);">			
                                    <table cellpadding="0" cellspacing="0" class="mainMenuElements" xmlns:fo="http://www.w3.org/1999/XSL/Format">
                                        <tr><td id="menu1" name="menu1" onclick="changeMainMenu('1')"><a href="faces/Current.jsp" target="contentFrame">:: Aktuelt</a></td></tr>
                                        <tr><td id="menu2" name="menu2" onclick="changeMainMenu('2')"><a href="about_us.jsp" target="contentFrame">:: Om Oss</a></td></tr>
                                        <tr><td id="menu3" name="menu3" onclick="changeMainMenu('3')"><a href="faces/courses_west.jsp" target="contentFrame">:: Kurs - Jæren</a><input id="anchors3" name="anchors3" type="hidden" value="&lt;a href='faces/courses_west.jsp#who' target='contentFrame' class='anchorElement'&gt;HVEM&lt;/a&gt;&lt;a href='faces/courses_west.jsp#what' target='contentFrame' class='anchorElement'&gt;HVA&lt;/a&gt;&lt;a href='faces/courses_west.jsp#where' target='contentFrame' class='anchorElement'&gt;HVOR&lt;/a&gt;&lt;a href='faces/courses_west.jsp#price' target='contentFrame' class='anchorElement'&gt;PRIS&lt;/a&gt;&lt;a href='faces/courses_west.jsp#accom' target='contentFrame' class='anchorElement'&gt;OVERNATTING&lt;/a&gt;&lt;a href='faces/courses_west.jsp#guarantee' target='contentFrame' class='anchorElement'&gt;GARANTI&lt;/a&gt;&lt;a href='faces/courses_west.jsp#practical' target='contentFrame' class='anchorElement'&gt;PRAKTISK&lt;/a&gt;&lt;a href='faces/courses_west.jsp#questions' target='contentFrame' class='anchorElement'&gt;SPØRSMÅL&lt;/a&gt;&lt;a href='faces/courses_west.jsp#when' target='contentFrame' class='anchorElement'&gt;NÅR&lt;/a&gt;&lt;a href='faces/SignUpSummer.jsp?id=-1' target='contentFrame' class='anchorElement'&gt;PÅMELDING&lt;/a&gt;"/></td></tr>
                                        <tr><td id="menu4" name="menu4" onclick="changeMainMenu('4')"><a href="faces/courses_winter.jsp" target="contentFrame">:: Kurs - Haukeli</a><input id="anchors4" name="anchors4" type="hidden" value="&lt;a href='faces/courses_winter.jsp#who' target='contentFrame' class='anchorElement'&gt;HVEM&lt;/a&gt;&lt;a href='faces/courses_winter.jsp#what' target='contentFrame' class='anchorElement'&gt;HVA&lt;/a&gt;&lt;a href='faces/courses_winter.jsp#where' target='contentFrame' class='anchorElement'&gt;HVOR&lt;/a&gt;&lt;a href='faces/courses_winter.jsp#price' target='contentFrame' class='anchorElement'&gt;PRIS&lt;/a&gt;&lt;a href='faces/courses_winter.jsp#accom' target='contentFrame' class='anchorElement'&gt;OVERNATTING&lt;/a&gt;&lt;a href='faces/courses_winter.jsp#guarantee' target='contentFrame' class='anchorElement'&gt;GARANTI&lt;/a&gt;&lt;a href='faces/courses_winter.jsp#practical' target='contentFrame' class='anchorElement'&gt;PRAKTISK&lt;/a&gt;&lt;a href='faces/courses_winter.jsp#questions' target='contentFrame' class='anchorElement'&gt;SPØRSMÅL&lt;/a&gt;&lt;a href='faces/courses_winter.jsp#when' target='contentFrame' class='anchorElement'&gt;NÅR&lt;/a&gt;&lt;a href='faces/SignUpWinter.jsp?id=-1' target='contentFrame' class='anchorElement'&gt;PÅMELDING&lt;/a&gt;"/></td></tr>
                                        <tr><td id="menu5" name="menu5"><a href="faces/secureA/AdminMain.jsp" target="_blank">:: Log in</a><a style="display:none" href="faces/AllArticles.jsp" target="contentFrame">All articles</a></td></tr>
                                    </table> 		
                                </td>    
                            </tr>    
                            <tr style="height:1;" xmlns:fo="http://www.w3.org/1999/XSL/Format">
                                <td class="sponsor" style="background-image: url(resources/img/components/backgrounds/menu_stretch.gif)">Sponsorer:
                                    <img id="sponsor" onclick="window.open('http://www.urge.no')" src="resources/img/logos/150x50/urge.gif"/>
                                    <script type="text/javascript">
                                        var sponsorSlides = new slideProjector(document.getElementById("sponsor"),'sponsorSlides.run()'); 
                                        sponsorSlides.loadPictures('resources/img/logos/150x50/urge.gif','resources/img/logos/150x50/neilpryde.gif','resources/img/logos/150x50/goya.gif','resources/img/logos/150x50/cabrinha.gif');sponsorSlides.loadLinks('http://www.urge.no','http://www.neilpryde.com','http://www.goya.no','http://www.cabrinhakites.com'); sponsorSlides.run();
                                    </script>
                                </td>
                            </tr>     
                            <tr><td class="empty" valign="bottom" style="background-image: url(resources/img/components/backgrounds/menu_stretch.gif)"><script src="http://www.gmodules.com/ig/ifr?url=http://www.google.com/ig/modules/translatemypage.xml&up_source_language=no&w=160&h=60&title=&border=&output=js"></script></td></tr>    
                            <tr><td style="height: 1"><img src="resources/img/components/backgrounds/menu_bottom.gif"/></td>    
                            </tr>
                        </table>
                        <input type="hidden" name="menuId" id="menuId" value="1"></input>
                        <input type="hidden" name="subMenuId" id="subMenuId" value="0"/>            
                        <input type="hidden" name="contentPage" id="contentPage" value="/current.jsp"/>                                    
                    </td>			
                    <td class="contentContainer" >				
                        <table class="fullstretch" cellspacing="0" cellpadding="0" >					
                            <tr>						
                                <td>							
                                    <table  cellspacing="0" cellpadding="0" id="contentTable"  class="fullstretch">								
                                        <tr>									
                                            <td style="height: 1" class="heading" id="contentHeading" name="contentHeading">&nbsp;</td>								
                                        </tr>                				
                                        <tr style="height: 5;">									
                                            <td>
                                            </td>								
                                        </tr>								
                                        <tr>									
                                            <td valign="top" align="left" style="vertical-align: top;" id="iframeTD">										
                                                <iframe id="contentFrame" name="contentFrame" src="faces/Current.jsp" scrolling="auto"  class="fullstretch" frameborder="0" style="margin-left: 8"></iframe>
                                            </td>								
                                        </tr>							
                                    </table>						
                                </td>					
                            </tr>				
                        </table>			
                    </td>		
                </tr>    
                <tr style="height: 10;">            
                    <td colspan="100">                       
                        <table cellspacing="0" cellpadding="0" class="footer" width="100%">	
                            <tr>        
                                <td align="center">            
                                    <span >Ta gjerne kontakt med oss! Telefon: 47753527 E-post: <a href="mailto:info@kitesurfing.no">info@kitesurfing.no</a>            
                                    </span>        
                                </td>        
                            </tr>
                        </table> 
                    </td>        
                </tr>   
            </table> 
        </f:view>
    </body>
</html>





