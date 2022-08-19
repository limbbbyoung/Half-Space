<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Styles -->
<link rel="stylesheet" type="text/css" href="/resources/baisc/basic.css">
<!-- 글씨체 -->
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<sec:authentication property="principal" var="prin"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./header.jsp" flush="true" />
	<jsp:include page="./sidebar.jsp" flush="true" />

	${league}
	${roundOf16}
			
	<br/><br/><br/><br/><br/>
<table>
  <tbody><tr>

    <td>
      <div style="width:190px">
      <table>
        <tbody><tr>
          <td class="ac" style="height:490px;">
            <table style="margin:0 auto; border-collapse:collapse; height:480px; width:190px" cellspacing="0" cellpadding="0" border="0">
              <colgroup>
                <col style="width:80px">
              </colgroup>

              <tbody><tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">1</td> 

                      <td class="ac ba" nowrap="">1조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">2</td> 

                      <td class="ac ba" nowrap="">2조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">3</td> 

                      <td class="ac ba" nowrap="">15조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">4</td> 

                      <td class="ac ba" nowrap="">16조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">5</td> 

                      <td class="ac ba" nowrap="">9조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">6</td> 

                      <td class="ac ba" nowrap="">10조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">7</td> 

                      <td class="ac ba" nowrap="">7조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">8</td> 

                      <td class="ac ba" nowrap="">8조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">9</td> 

                      <td class="ac ba" nowrap="">5조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">10</td> 

                      <td class="ac ba" nowrap="">6조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">11</td> 

                      <td class="ac ba" nowrap="">11조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">12</td> 

                      <td class="ac ba" nowrap="">12조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">13</td> 

                      <td class="ac ba" nowrap="">13조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">14</td> 

                      <td class="ac ba" nowrap="">14조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">15</td> 

                      <td class="ac ba" nowrap="">3조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">16</td> 

                      <td class="ac ba" nowrap="">4조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

            </tbody></table>
          </td>
        </tr>
      </tbody></table>
      </div>
    </td>

    <td>
      <div style="width:30pxpx">
      <table style="border-collapse:collapse" cellspacing="0" cellpadding="0" border="0">
        <tbody><tr>
          <td class="ac" style="height:490px;">
            <table style="margin:0 auto; border-collapse:collapse; height:480px; width:30pxpx" cellspacing="0" cellpadding="0" border="0">
              <colgroup>
                <col style="width:30px">
              </colgroup>

              <tbody><tr>

                <td class="ac"><div class="bt br bb" style="display:inline-block; width:30px; height:60px">&nbsp;</div></td>

              </tr>

              <tr>

                <td class="ac"><div class="bt br bb" style="display:inline-block; width:30px; height:60px">&nbsp;</div></td>

              </tr>

              <tr>

                <td class="ac"><div class="bt br bb" style="display:inline-block; width:30px; height:60px">&nbsp;</div></td>

              </tr>

              <tr>

                <td class="ac"><div class="bt br bb" style="display:inline-block; width:30px; height:60px">&nbsp;</div></td>

              </tr>

            </tbody></table>
          </td>
        </tr>
      </tbody></table>
      </div>
    </td>

    <td>
      <div style="width:30pxpx">
      <table style="border-collapse:collapse" cellspacing="0" cellpadding="0" border="0">
        <tbody><tr>
          <td class="ac" style="height:490px;">
            <table style="margin:0 auto; border-collapse:collapse; height:480px; width:30pxpx" cellspacing="0" cellpadding="0" border="0">
              <colgroup>
                <col style="width:30px">
              </colgroup>

              <tbody><tr>

                <td class="ac"><div class="bt br bb" style="display:inline-block; width:30px; height:120px">&nbsp;</div></td>

              </tr>

              <tr>

                <td class="ac"><div class="bt br bb" style="display:inline-block; width:30px; height:120px">&nbsp;</div></td>

              </tr>

            </tbody></table>
          </td>
        </tr>
      </tbody></table>
      </div>
    </td>

    <td>
      <div style="width:30pxpx">
      <table style="border-collapse:collapse" cellspacing="0" cellpadding="0" border="0">
        <tbody><tr>
          <td class="ac" style="height:490px;">
            <table style="margin:0 auto; border-collapse:collapse; height:480px; width:30pxpx" cellspacing="0" cellpadding="0" border="0">
              <colgroup>
                <col style="width:30px">
              </colgroup>

              <tbody><tr>

                <td class="ac"><div class="bt br bb" style="display:inline-block; width:30px; height:240px">&nbsp;</div></td>

              </tr>

            </tbody></table>
          </td>
        </tr>
      </tbody></table>
      </div>
    </td>

    <td>
      <div style="width:30pxpx">
      <table style="border-collapse:collapse" cellspacing="0" cellpadding="0" border="0">
        <tbody><tr>
          <td class="ac" style="height:490px;">
            <table style="margin:0 auto; border-collapse:collapse; height:480px; width:30pxpx" cellspacing="0" cellpadding="0" border="0">
              <colgroup>
                <col style="width:30px">
              </colgroup>

            </table>
          </td>
        </tr>
      </tbody></table>
      </div>
    </td>

    <td class="ac" style="width:30px"><div class="bt" style="display:inline-block; width:30px; height:1px">&nbsp;</div></td>

    <td>
      <div style="width:30pxpx">
      <table style="border-collapse:collapse" cellspacing="0" cellpadding="0" border="0">
        <tbody><tr>
          <td class="ac" style="height:490px;">
            <table style="margin:0 auto; border-collapse:collapse; height:480px; width:30pxpx" cellspacing="0" cellpadding="0" border="0">
              <colgroup>
                <col style="width:30px">
              </colgroup>

            </table>
          </td>
        </tr>
      </tbody></table>
      </div>
    </td>

    <td>
      <div style="width:30pxpx">
      <table style="border-collapse:collapse" cellspacing="0" cellpadding="0" border="0">
        <tbody><tr>
          <td class="ac" style="height:490px;">
            <table style="margin:0 auto; border-collapse:collapse; height:480px; width:30pxpx" cellspacing="0" cellpadding="0" border="0">
              <colgroup>
                <col style="width:30px">
              </colgroup>

              <tbody><tr>

                <td class="ac"><div class="bt bb bl" style="display:inline-block; width:30px; height:240px">&nbsp;</div></td>

              </tr>

            </tbody></table>
          </td>
        </tr>
      </tbody></table>
      </div>
    </td>

    <td>
      <div style="width:30pxpx">
      <table style="border-collapse:collapse" cellspacing="0" cellpadding="0" border="0">
        <tbody><tr>
          <td class="ac" style="height:490px;">
            <table style="margin:0 auto; border-collapse:collapse; height:480px; width:30pxpx" cellspacing="0" cellpadding="0" border="0">
              <colgroup>
                <col style="width:30px">
              </colgroup>

              <tbody><tr>

                <td class="ac"><div class="bt bb bl" style="display:inline-block; width:30px; height:120px">&nbsp;</div></td>

              </tr>

              <tr>

                <td class="ac"><div class="bt bb bl" style="display:inline-block; width:30px; height:120px">&nbsp;</div></td>

              </tr>

            </tbody></table>
          </td>
        </tr>
      </tbody></table>
      </div>
    </td>

    <td>
      <div style="width:30pxpx">
      <table style="border-collapse:collapse" cellspacing="0" cellpadding="0" border="0">
        <tbody><tr>
          <td class="ac" style="height:490px;">
            <table style="margin:0 auto; border-collapse:collapse; height:480px; width:30pxpx" cellspacing="0" cellpadding="0" border="0">
              <colgroup>
                <col style="width:30px">
              </colgroup>

              <tbody><tr>

                <td class="ac"><div class="bt bb bl" style="display:inline-block; width:30px; height:60px">&nbsp;</div></td>

              </tr>

              <tr>

                <td class="ac"><div class="bt bb bl" style="display:inline-block; width:30px; height:60px">&nbsp;</div></td>

              </tr>

              <tr>

                <td class="ac"><div class="bt bb bl" style="display:inline-block; width:30px; height:60px">&nbsp;</div></td>

              </tr>

              <tr>

                <td class="ac"><div class="bt bb bl" style="display:inline-block; width:30px; height:60px">&nbsp;</div></td>

              </tr>

            </tbody></table>
          </td>
        </tr>
      </tbody></table>
      </div>
    </td>

    <td>
      <div style="width:190px">
      <table style="border-collapse:collapse" cellspacing="0" cellpadding="0" border="0">
        <tbody><tr>
          <td class="ac" style="height:490px;">
            <table style="margin:0 auto; border-collapse:collapse; height:480px; width:190px" cellspacing="0" cellpadding="0" border="0">
              <colgroup>
                <col style="width:80px">
              </colgroup>

              <tbody><tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">17</td> 

                      <td class="ac ba" nowrap="">3조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">18</td> 

                      <td class="ac ba" nowrap="">4조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">19</td> 

                      <td class="ac ba" nowrap="">13조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">20</td> 

                      <td class="ac ba" nowrap="">14조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">21</td> 

                      <td class="ac ba" nowrap="">11조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">22</td> 

                      <td class="ac ba" nowrap="">12조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">23</td> 

                      <td class="ac ba" nowrap="">5조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">24</td> 

                      <td class="ac ba" nowrap="">6조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">25</td> 

                      <td class="ac ba" nowrap="">7조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">26</td> 

                      <td class="ac ba" nowrap="">8조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">27</td> 

                      <td class="ac ba" nowrap="">9조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">28</td> 

                      <td class="ac ba" nowrap="">10조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">29</td> 

                      <td class="ac ba" nowrap="">15조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">30</td> 

                      <td class="ac ba" nowrap="">16조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

              <tr>

                <td class="ac">
                  <table style="border-collapse:collapse; width:100%; height:90%" cellspacing="0" cellpadding="0" border="0">
                    <colgroup>
                      <col style="width:40px">
                      <col style="width:90px">
                      <col style="width:220px">
                    </colgroup>
                    <tbody><tr>
                      <td class="ac ba ft" nowrap="">31</td> 

                      <td class="ac ba" nowrap="">1조 2위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr><tr>
                      <td class="ac ba ft" nowrap="">32</td> 

                      <td class="ac ba" nowrap="">2조 1위</td> 
                      <td class="ac ba" nowrap="">&nbsp;</td>

                    </tr>
                  </tbody></table>
                </td>

              </tr>

            </tbody></table>
          </td>
        </tr>
      </tbody></table>
      </div>
    </td>

  </tr>
</tbody></table>	


	<jsp:include page="./footer.jsp" flush="true" />

</body>


	<!-- sidebar 기능-->
	<script src="/resources/basic/sideBar.js"></script>
</html>