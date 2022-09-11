
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!-- custom js link -->
<script src="./assets/js/script-main.js"></script>

<!-- ionicon link -->
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>




<%
if (request.getSession().getAttribute("success") != null) {%>
<script type="text/javascript">
	toastr.success("<%=request.getSession().getAttribute("success")%>",{
	    timeOut: 300,
	    fadeOut: 300,
	    onHidden: function () {
	        <%request.getSession().removeAttribute("success");%>
	      }
	  });
</script>
<%
}
if (request.getSession().getAttribute("error") != null) {
%>
<script type="text/javascript">
	toastr.error("<%=request.getSession().getAttribute("error")%>",{
	    timeOut: 300,
	    fadeOut: 300,
	    onHidden: function () {
	        <%request.getSession().removeAttribute("error");%>
	      }
	  });
</script>
<%
}
%>