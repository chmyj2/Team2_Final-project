/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.63
 * Generated at: 2022-09-02 10:54:52 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views._2Team.t2login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class joinOK_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<!-- login Css 2 -->\r\n");
      out.write("	<link href=\"resources/t2_css/t2JoinCss.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("		<div class=\"t2joinOKText\">\r\n");
      out.write("			<div class=\"t2JoinOK-In-Text\">\r\n");
      out.write("			<img class=\"t2joinOkImg\" src=\"resources/t2_img/logo2.jpg\"><br><br>\r\n");
      out.write("			<span style=\"font-size: 30px;\">성공적으로 회원가입이 되었습니다.</span><br> \r\n");
      out.write("			<span>저희 \"산책가자\" 사이트에 회원이 되어주셔서 감사합니다.</span><br>\r\n");
      out.write("			<br> <span>펫 등록 하시겠습니까?</span><br>\r\n");
      out.write("			<br> <a href=\"petRegistration\" class=\"myPetPage-txt2\">펫 등록하러 가기</a> &nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("			&nbsp; <a href=\"team2Main\" class=\"myPetPage-txt2\">Home</a>\r\n");
      out.write("			</div>\r\n");
      out.write("			<img src=\"resources/t2_img/말풍선.png\" class=\"t2JoinOkDog\">\r\n");
      out.write("			<span class=\"t2JoinOKDogTalk\">멍멍(반가워)</span>\r\n");
      out.write("		</div>\r\n");
      out.write("		\r\n");
      out.write("		<div class=\"🐕\">\r\n");
      out.write("  <div class=\"torso\">\r\n");
      out.write("    <div class=\"fur\">\r\n");
      out.write("      <div class=\"spot\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"neck\">\r\n");
      out.write("      <div class=\"fur\"></div>\r\n");
      out.write("      <div class=\"head\">\r\n");
      out.write("        <div class=\"fur\">\r\n");
      out.write("          <div class=\"snout\"></div>          \r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"ears\">\r\n");
      out.write("          <div class=\"ear\">\r\n");
      out.write("            <div class=\"fur\"></div>\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"ear\">\r\n");
      out.write("            <div class=\"fur\"></div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"eye\"></div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"collar\">\r\n");
      out.write("        \r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"legs\">\r\n");
      out.write("      <div class=\"leg\">\r\n");
      out.write("        <div class=\"fur\"></div>\r\n");
      out.write("        <div class=\"leg-inner\">\r\n");
      out.write("          <div class=\"fur\"></div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"leg\">\r\n");
      out.write("        <div class=\"fur\"></div>\r\n");
      out.write("        <div class=\"leg-inner\">\r\n");
      out.write("          <div class=\"fur\"></div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"leg\">\r\n");
      out.write("        <div class=\"fur\"></div>\r\n");
      out.write("        <div class=\"leg-inner\">\r\n");
      out.write("          <div class=\"fur\"></div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"leg\">\r\n");
      out.write("        <div class=\"fur\"></div>\r\n");
      out.write("        <div class=\"leg-inner\">\r\n");
      out.write("          <div class=\"fur\"></div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"tail\">\r\n");
      out.write("      <div class=\"tail\">\r\n");
      out.write("        <div class=\"tail\">\r\n");
      out.write("          <div class=\"tail -end\">\r\n");
      out.write("            <div class=\"tail\">\r\n");
      out.write("              <div class=\"tail\">\r\n");
      out.write("                <div class=\"tail\">\r\n");
      out.write("                  <div class=\"tail\"></div>\r\n");
      out.write("                </div>\r\n");
      out.write("              </div>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
