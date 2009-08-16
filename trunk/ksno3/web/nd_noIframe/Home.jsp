<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<f:view>
    <h:form>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#btnLearnMore").click(function(event){
                    setContent("aboutUs.html", "aboutUs");
                });
                $("td.rightSection div a").click(function(){
                    setContent(this.getAttribute("href"), "article1");
                    return false;
                });
                $("div.expandedNews a").click(function(){
                    setContent(this.getAttribute("href"), "article1");
                    return false;
                });
                $("div.expandedNews h1").click(function(){
                    setContent(this.getAttribute("href"), "article1");
                    return false;
                });
                $("table.newsList a").click(function(){
                    setContent(this.getAttribute("href"), "article1");
                    return false;
                });

             });
        </script>
        <table class="middleSection">
            <tr>
                <td class="leftSection" >
                    <div>
                        <font style="font-size:36px; line-height:35px; margin-bottom:20px">Hi we're Kitesurfing.no</font>
                        <font style="font-size:25px; line-height: 25px;">We do kite<br/>courses in J&aelig;ren and Haukelister</font>
                        <table class="button" id="btnLearnMore">
                            <tr>
                                <td class="left"></td>
                                <td>Learn more</td>
                                <td class="right"></td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td class="middleSection"></td>
                <td class="rightSection">
                    <div>
                        <t:dataList value="#{Current_Backing.headlines}" var="headline">
                            <t:htmlTag value="h1" rendered="#{headline.sameAsPrevCat != true}">
                                <h:outputText value="#{headline.category.name}"/>
                            </t:htmlTag>
                            <t:htmlTag value="a">
                                <f:param name="href" value="../#{Current_Backing.article1Url}?id=#{headline.id}" />
                                <h:outputText value="#{headline.name}" escape="false"/>
                            </t:htmlTag>
                        </t:dataList>
                    </div>
                </td>
            </tr>
        </table>
        <table class="bottomSection">
            <tr>
                <td class="leftSection" rowspan="2">
                    <h1>Videos</h1>
                    <table class="videoList">
                        <tr>
                            <td><img src="nd_vid1.jpg"/></td>
                            <td>
                                <h1>Video</h1>
                                <span>Perfect day at Sele</span>
                                <a href="http://www.vg.no">Watch [5min]</a>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="nd_vid1.jpg"/></td>
                            <td>
                                <h1>Vi</h1>
                                <span>Per</span>
                                <a href="http://www.vg.no">Watc</a>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="middleSection" rowspan="2">
                    <h1>Latest News</h1>
                    <div class="expandedNews">
                        <t:dataList value="#{Current_Backing.firstThreeArticles}" var="article">
                            <t:htmlTag value="h1">
                                <f:param name="href" value="../#{Current_Backing.article1Url}?id=#{article.id}" />
                                <h:outputText value="#{article.name}"/>
                            </t:htmlTag>
                            <h:outputText value="#{article.createdDate}"/> | <h:outputText value="#{article.name}" escape="false"/>
                            <t:htmlTag value="a">
                                <f:param name="href" value="../#{Current_Backing.article1Url}?id=#{article.id}" />
                                <h:outputText value="Read More -&gt;" escape="false"/>
                            </t:htmlTag>
                        </t:dataList>
                    </div>
                    <table class="newsList">
                        <t:dataList value="#{Current_Backing.articlesFromFour}" var="article">
                            <tr>
                                <td class="date"><span><h:outputText value="#{article.createdDate}"/></span></td>
                                <td class="separator">|</td>
                                <td>
                                    <t:htmlTag value="a">
                                        <f:param name="href" value="../#{Current_Backing.article1Url}?id=#{article.id}" />
                                        <h:outputText value="#{article.name}"/>
                                    </t:htmlTag>
                                </td>
                            </tr>
                        </t:dataList>
                    </table>
                </td>
                <td class="rightSection">
                    <h1>Activities</h1>
                    <div class="courseList">
                        <h1>Course J&aelig;ren</h1>
                        <table>
                            <tr>
                                <td style="width:86px">20 - 21 aug 2009</td>
                                <td style="width:6px">|</td>
                                <td style="width:106px">Beginners Course</td>
                                <td><a class="button" href="http://www.vg.no">Go</a></td>
                            </tr>
                            <tr>
                                <td>19 - 20 sep 2009</td>
                                <td>|</td>
                                <td>Beginners Course</td>
                                <td><a class="button" href="http://www.vg.no">Go</a></td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="rightSection" style="height:1px">
                    <div class="weLike">
                        <h1>We like</h1>
                        <img src="urge.jpg" alt=""/>
                    </div>
                </td>
            </tr>
        </table>
    </h:form>
</f:view>
