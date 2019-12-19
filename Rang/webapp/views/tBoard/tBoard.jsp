<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>너랑 나랑 게시판</title>
    <c:import url="../common/commonUtil.jsp"/>
<style>


<%--	--%>
<%--#notify_identity  {--%>
<%--  display:inline-block;--%>
<%--  margin-right:4px;--%>
<%--  max-width:400px;--%>
<%--  white-space: nowrap;--%>
<%--  padding:3px 20px;--%>
<%--  color:gray;--%>
<%--  border-bottom:1px solid #d2d2d2;--%>
<%--  @media (max-width: 768px) {--%>
<%--    color:lightgray;--%>
<%--    border-bottom:none;--%>
<%--  }--%>
<%--}--%>


<%--div[ui-view]{--%>
<%--  height:-webkit-calc(100% - 48px);--%>
<%--  height:-moz-calc(100% - 48px);--%>
<%--  height:calc(100% - 48px);--%>
<%--  clear:both;--%>
<%--  margin-top:49px;--%>

<%--  div[ng-show]{--%>
<%--    height:100%;--%>

<%--    .col{--%>
<%--      border:none;--%>
<%--      height:100%;--%>
<%--      overflow-y:auto;--%>
<%--      background-color:#fff;--%>
<%--    }--%>
<%--    .accounts-container.col{--%>
<%--      overflow:auto;--%>
<%--      background-color:#ececec;--%>
<%--    }--%>
<%--  }--%>
<%--}--%>

<%--#wrapper {--%>
<%--  padding-left: 0;--%>
<%--  -webkit-transition: all 0.5s ease;--%>
<%--  -moz-transition: all 0.5s ease;--%>
<%--  -o-transition: all 0.5s ease;--%>
<%--  transition: all 0.5s ease;--%>
<%--}--%>

<%--#wrapper.toggled {--%>
<%--  //padding-left: 220px;--%>
<%--}--%>

<%--.search-bar{--%>
<%--  height:40px;--%>
<%--  background-color:#ececec ;--%>
<%--  padding:8px 0;--%>
<%--  .search-group .form-control{--%>
<%--    width:50%;--%>
<%--  }--%>
<%--}--%>


<%--#sidebar-wrapper::-webkit-scrollbar {--%>
<%--  //display: none;--%>
<%--}--%>

<%--#wrapper.toggled #sidebar-wrapper {--%>
<%--  margin-left: 0px;--%>
<%--  padding:15px;--%>
<%--  left:0;--%>
<%--}--%>

<%--#page-content-wrapper {--%>
<%--  padding:20px 0;--%>
<%--  height:500px;--%>
<%--  margin:100px;--%>


<%--}--%>

<%--#wrapper.toggled #page-content-wrapper {--%>
<%--  position: absolute;--%>

<%--}--%>
<%--#contextMenu {--%>
<%--  position: fixed;--%>
<%--  z-index: 3;--%>
<%--   #primaryMenu{--%>
<%--    width: 71px;--%>
<%--    height:100%;--%>
<%--    text-align: center;--%>
<%--     padding:1em .2em;--%>
<%--     margin-left:-75px;--%>
<%--    position: fixed;--%>
<%--    background-color: #106aae;--%>
<%--    -webkit-transition: all 0.5s ease;--%>
<%--    -moz-transition: all 0.5s ease;--%>
<%--    -o-transition: all 0.5s ease;--%>
<%--    transition: all 0.5s ease;--%>
<%--    ul {--%>
<%--      margin: 0;--%>
<%--      padding: 0;--%>
<%--    }--%>
<%--    li {--%>
<%--      margin-bottom: 1em;--%>
<%--      list-style: none;--%>
<%--      a {--%>
<%--        margin-bottom: 10px;--%>
<%--        color: white;--%>
<%--        span {--%>
<%--          display: block;--%>
<%--          font-size: 0.8em;--%>
<%--          &.glyphicon {--%>
<%--            font-size: 1.8em;--%>
<%--          }--%>
<%--        }--%>
<%--        &:hover {--%>
<%--          color: dodgerblue;--%>
<%--          text-decoration: none !important;--%>
<%--          &.glyphicon {--%>
<%--            text-decoration: none !important;--%>
<%--          }--%>
<%--        }--%>
<%--      }--%>
<%--    }--%>
<%--     #moreActions {--%>
<%--       position:relative;--%>
<%--       #secondary_menu{--%>
<%--         padding: 5px;--%>
<%--         width:100%;--%>
<%--         position:absolute;--%>
<%--         left:71px;--%>
<%--         top:0;--%>
<%--         text-align: center;--%>
<%--         background-color: #106aae;--%>
<%--         visibility:hidden;--%>
<%--       }--%>
<%--       .toggled + #secondary_menu{--%>
<%--         visibility:visible;--%>
<%--         width:10em;--%>
<%--       }--%>
<%--     }--%>
<%--  }--%>
<%--}--%>
<%--#contextMenu.toggled #primaryMenu {--%>
<%--  margin-left: 0;--%>
<%--}--%>
<%--.filterBar {--%>
<%--  background-color: orange;--%>
<%--  height: 5px;--%>
<%--}--%>

<%--.table-container{--%>
<%--  width:100%;--%>
<%--  //margin-top:50px;--%>
<%--  margin-left:0;--%>
<%--  overflow:auto;--%>
<%--  height:500px;--%>
<%--  -webkit-transition: all 0.5s ease;--%>
<%--  -moz-transition: all 0.5s ease;--%>
<%--  -o-transition: all 0.5s ease;--%>
<%--  transition: all 0.5s ease;--%>
<%--  span{--%>
<%--    .glyphicon{--%>
<%--      font-size:2em;--%>
<%--    }--%>
<%--  }--%>

<%--}--%>
<%--.moveLeft {--%>
<%--  margin-left: 72px;--%>
<%--}--%>


<%--.select-container {--%>
<%--  :after{--%>
<%--    border: 2px solid rgba(0, 0, 0, .54);--%>
<%--  }--%>

<%--  .none-selected:before{--%>
<%--    content:'\e98d'--%>
<%--  }--%>
<%--  .some-selected:before{--%>
<%--    content:'\e98f'--%>

<%--  }--%>
<%--  .page-selected{--%>

<%--    &:before{--%>
<%--      content:'\e6b5'--%>
<%--    }--%>

<%--  }--%>
<%--  .all-selected{--%>
<%--    &:before{--%>
<%--     content:'\e901'--%>
<%--    }--%>
<%--  }--%>

<%--}--%>
<%--.table-fixed {--%>
<%--  min-width:100%;--%>
<%--  background-color: #f3f3f3;--%>
<%--  tbody {--%>
<%--    height:500px;--%>
<%--    overflow-y: auto;--%>
<%--    width: 100%;--%>
<%--  }--%>
<%--  thead, tbody, tr, td, th {--%>
<%--    display: block;--%>

<%--  }--%>
<%--  tbody {--%>
<%--    tr {--%>
<%--      cursor: pointer;--%>
<%--      &:after {--%>
<%--        content: ' ';--%>
<%--        display: block;--%>
<%--        visibility: hidden;--%>
<%--        clear: both;--%>
<%--      }--%>
<%--    }--%>
<%--    td {--%>
<%--      float: left;--%>
<%--      width: 10%;--%>
<%--      text-align:left;--%>
<%--      &:first-child{--%>
<%--        text-align:center;--%>
<%--      }--%>
<%--    }--%>

<%--  }--%>
<%--  thead {--%>
<%--    tr {--%>
<%--      height:50px;--%>
<%--      th {--%>
<%--        float: left;--%>
<%--        width: 10%;--%>
<%--        height:100%;--%>
<%--        &:first-child{--%>
<%--          text-align:center;--%>
<%--        }--%>
<%--      }--%>
<%--    }--%>
<%--  }--%>

<%--}--%>


<%--  .selectedTickBox {--%>
<%--    border: 1px solid #000000;--%>
<%--    width: 16px;--%>
<%--    height: 16px;--%>
<%--  }--%>
<%--  .selectorDiscription {--%>
<%--    font-size: xx-small;--%>
<%--    margin-top: 2px;--%>
<%--  }--%>

</style>
</head>
<body style="background-color: #F5F8FA">
<c:import url="../common/nav.jsp"/>

<section>







<div id="wrapper">

<div id="page-content-wrapper">
<div class="row">
<div class="col-sm-3 m-b-s">
</div>

<div class="col-sm-1 ">
	<a class="btn pull-right" data-toggle="offcanvas"><span
	class="glyphicon glyphicon-funnel"></span></a>
</div>
<div class="col-sm-4">
	<div class="input-group search-group">
		<select  class="selectpicker form-control">
			<option>번호</option>
			<option>제목</option>
			<option>글쓴이</option>
		</select>
	<input type="text" class="form-control" aria-label="...">
<span class="input-group-btn">
	<button class="btn btn-outline-warning" type="button">검색</button>
</span>
	</div><!-- /input-group -->
</div>

<c:if test="${!empty member}">
	<div class="col" align="right">
		<button type="button" class="btn btn-outline-warning"
		onclick="location.href='${pageContext.request.contextPath}/views/tBoard/tBoardInsert.jsp'">게시글 작성</button>
	</div>
  
</c:if>          
 	</div>
 
<div class="row table-area">
	<table  class="table table-fixed table-striped table-hover">
		<thead class="header">
			<tr>
				<th> 
					<span class="ng-scope">
						<div class="select-container"></div>
					</span>
				</th>
	<!-- start 헤드타이틀 -->
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>작성일</th>
		<th>모집인원</th>
		<th>장소</th>
		<th>조회수</th>
	<!-- end 헤드타이틀 -->

			</tr>
		</thead>

<tbody id="listtable">
	<c:forEach var="tBoard" items="${TbList}" >
	<tr>
			<input id="tbno" type="hidden" value="${tBoard.tbno}">
				<td>
			<span></span>
				</td>

<span>
	<!-- start tBoard List -->
		<td>${tBoard.tbno }</td> 
		<td>${tBoard.tbTitle}</td>
		<td>${tBoard.writer}</td>
		<td>${tBoard.tbdate }</td>
		<td>${tBoard.totalmember + 1}/${tBoard.maxmember}</td>
		<td>${tBoard.place }</td>
		<td>${tBoard.tbcount}</td>
	<!-- end tBoard List -->
</span>

		</tr>
	</c:forEach>                                  
</tbody>
	</table> 
</div>
</div>
</div>

<br />
<br />
<br />

        
        
    
    
    
            


 


<%-- 페이지처리 구현하기 --%>
      
<div class="pagingArea" align="center">
	<c:url var="selectList" value="selectList.tb"/>
<div class="buttonDetail">
<!-- 처음 페이지 버튼 -->
<button onclick="location.href='${selectList }?currentPage=1'" class="btn btn-outline-warning">
	&lt;&lt;
</button>


	<!-- 이전페이지 -->
	<c:if test="${pi.currentPage le 1 }">
		<button disabled class="btn btn-outline-warning">&lt;</button >
	</c:if>

	<c:if test="${pi.currentPage gt 1 }">
		<button onclick="location.href='${selectList }?currentPage=${pi.currentPage - 1 }'" class="btn btn-outline-warning">
			&lt;
		</button>
	</c:if>

		<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	
			<c:if test="${p eq pi.currentPage}">
				<button disabled class="btn btn-outline"> ${p}</button>
			</c:if>
	
			<c:if test="${p ne pi.currentPage }">
				<button onclick="location.href='${selectList}?currentPage=${p }'" class="btn btn-outline-warning">
					${p}
				</button>
			</c:if>
			
		</c:forEach>

<!-- 다음페이즈 -->
	<c:if test="${pi.currentPage ge pi.maxPage }">
		<button disabled class="btn btn-outline-warning">&gt;</button>
	</c:if>
	<c:if test="${pi.currentPage lt pi.maxPage }">
		<button onclick="location.href='${selectList }?currentPage=${pi.currentPage + 1 }'" class="btn btn-outline-warning">
			&gt;
		</button>
	</c:if>


	<!-- 마지막 페이지 버튼 -->
	<button onclick="location.href='${selectList }?currentPage=${pi.maxPage }'" class="btn btn-outline-warning">
		&gt;&gt;
	</button>	
</div>
</div>



<script>
	/* 실행 함수 */
      $(function(){
          $("#listtable tr").click(function(){
        	  var tbno = $(this).find("#tbno").val();
        	  	location.href="${pageContext.request.contextPath}/selectOne.tb?tbno=" + tbno;
          });
       });
      
    function defaultImg(obj){
        $(obj).attr('src','/rang/resources/images/Rangicon.png');
    }
    
</script>
</section>
<c:import url="../common/footer.jsp"/>

<!-- 스크롤 관련 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/scroll.js"></script>


</body>

