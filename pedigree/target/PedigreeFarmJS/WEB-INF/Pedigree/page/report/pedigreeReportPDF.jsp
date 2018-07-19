<%@ page  contentType="application/pdf"%>
<%@ page  trimDirectiveWhitespaces="true"%>
<%@ page  import="net.sf.jasperreports.engine.JRDataSource"%>
<%@ page  import="net.sf.jasperreports.engine.JasperReport"%>
<%@ page  import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@ page  import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@ page  import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@ page  import="net.sf.jasperreports.engine.JasperPrint"%>
<%@ page  import="net.sf.jasperreports.engine.data.*"%>
<%@ page  import="java.io.*"%>
<%@ page  import="java.util.*"%>

<%
try{
	//List<Map<String, ?>> dataSource = (List<Map<String, ?>>) request.getAttribute("reportslist");

	
	String jrxmlFile = session.getServletContext().getRealPath("/WEB-INF/Pedigree/page/report/report.jrxml");
	Map<String, Object> parameters = new HashMap<String, Object>();

	InputStream input = new FileInputStream(new File(jrxmlFile));
	JasperReport jasperReport = JasperCompileManager.compileReport(input);
	
	HashMap parameterMap = new HashMap();
	/* start วัวตัวที่เลือก*/
	parameterMap.put("sexCattle", request.getAttribute("sex_cattle"));
	parameterMap.put("img",session.getServletContext().getRealPath("/WEB-INF/Pedigree/page/report/img/pedigreeFarmJS01.jpg"));
	parameterMap.put("cowNoCattle", request.getAttribute("cowNo_cattle"));
	parameterMap.put("pedigreeNo", request.getAttribute("pedigree_no"));
	parameterMap.put("colorCattle", request.getAttribute("color_cattle"));
	parameterMap.put("herdNoCattle", request.getAttribute("herd_no"));
	parameterMap.put("ownerShipCattle", request.getAttribute("owner_ship"));
	parameterMap.put("breederCattle", request.getAttribute("breeder"));
	parameterMap.put("ownerCattle", request.getAttribute("owner"));
	parameterMap.put("registerDate", request.getAttribute("register_date"));
	parameterMap.put("birthDate", request.getAttribute("birth_date"));
	/* start พ่อวัวรุ่น 1 SIRE or BULL*/
	parameterMap.put("F_V1_cowNo", request.getAttribute("F_V1_cowNo"));
	parameterMap.put("F_V1_herdNo", request.getAttribute("F_V1_herdNo"));
	parameterMap.put("F_V1_pedigreeNo", request.getAttribute("F_V1_pedigreeNo"));
	/* start แม่วัวรุ่น 1 DAM or COW*/
	parameterMap.put("M_V1_cowNo", request.getAttribute("M_V1_cowNo"));
	parameterMap.put("M_V1_herdNo", request.getAttribute("M_V1_herdNo"));
	parameterMap.put("M_V1_pedigreeNo", request.getAttribute("M_V1_pedigreeNo"));
	/* start พ่อวัวรุ่น 2 ฝังพ่อ SIRE in BULL*/
	parameterMap.put("FF_V2_cowNo", request.getAttribute("FF_V2_cowNo"));
	parameterMap.put("FF_V2_herdNo", request.getAttribute("FF_V2_herdNo"));
	parameterMap.put("FF_V2_pedigreeNo", request.getAttribute("FF_V2_pedigreeNo"));
	/* start พ่อวัวรุ่น 2 ฝังแม่ DAM in BULL*/
	parameterMap.put("FM_V2_cowNo", request.getAttribute("FM_V2_cowNo"));
	parameterMap.put("FM_V2_herdNo", request.getAttribute("FM_V2_herdNo"));
	parameterMap.put("FM_V2_pedigreeNo", request.getAttribute("FM_V2_pedigreeNo"));
	/* start แม่วัวรุ่น 2 ฝังพ่อ SIRE in COW*/
	parameterMap.put("MF_V2_cowNo", request.getAttribute("MF_V2_cowNo"));
	parameterMap.put("MF_V2_herdNo", request.getAttribute("MF_V2_herdNo"));
	parameterMap.put("MF_V2_pedigreeNo", request.getAttribute("MF_V2_pedigreeNo"));
	/* start แม่วัวรุ่น 2 ฝังแม่ DAM in COW */
	parameterMap.put("MM_V2_cowNo", request.getAttribute("MM_V2_cowNo"));
	parameterMap.put("MM_V2_herdNo", request.getAttribute("MM_V2_herdNo"));
	parameterMap.put("MM_V2_pedigreeNo", request.getAttribute("MM_V2_pedigreeNo"));
	/* start  พ่อวัวรุ่น 3 ฝังพ่อ ของ พ่อ SIRE in BULL */
	parameterMap.put("FFF_V3_cowNo", request.getAttribute("FFF_V3_cowNo"));
	parameterMap.put("FFF_V3_herdNo", request.getAttribute("FFF_V3_herdNo"));
	parameterMap.put("FFF_V3_pedigreeNo", request.getAttribute("FFF_V3_pedigreeNo"));
	/* start  พ่อวัวรุ่น 3 ฝังแม่ ของ พ่อ DAM in BULL */
	parameterMap.put("FFM_V3_cowNo", request.getAttribute("FFM_V3_cowNo"));
	parameterMap.put("FFM_V3_herdNo", request.getAttribute("FFM_V3_herdNo"));
	parameterMap.put("FFM_V3_pedigreeNo", request.getAttribute("FFM_V3_pedigreeNo"));
	/* start  พ่อวัวรุ่น 3 ฝังพ่อ ของ แม่ ของ พ่อ DAM in BULL */
	parameterMap.put("FMF_V3_cowNo", request.getAttribute("FMF_V3_cowNo"));
	parameterMap.put("FMF_V3_herdNo", request.getAttribute("FMF_V3_herdNo"));
	parameterMap.put("FMF_V3_pedigreeNo", request.getAttribute("FMF_V3_pedigreeNo"));
	/* start  พ่อวัวรุ่น 3 ฝังพ่อ ของ แม่ ของ แม่ DAM in BULL */
	parameterMap.put("FMM_V3_cowNo", request.getAttribute("FMM_V3_cowNo"));
	parameterMap.put("FMM_V3_herdNo", request.getAttribute("FMM_V3_herdNo"));
	parameterMap.put("FMM_V3_pedigreeNo", request.getAttribute("FMM_V3_pedigreeNo"));
	/* start  แม่วัวรุ่น 3 ฝังแม่ ของ แม่ ของ แม่ DAM in COW */
	parameterMap.put("MMM_V3_cowNo", request.getAttribute("MMM_V3_cowNo"));
	parameterMap.put("MMM_V3_herdNo", request.getAttribute("MMM_V3_herdNo"));
	parameterMap.put("MMM_V3_pedigreeNo", request.getAttribute("MMM_V3_pedigreeNo"));
	/* start  แม่วัวรุ่น 3 ฝังแม่ ของ แม่ ของ พ่อ DAM in COW */
	parameterMap.put("MMF_V3_cowNo", request.getAttribute("MMF_V3_cowNo"));
	parameterMap.put("MMF_V3_herdNo", request.getAttribute("MMF_V3_herdNo"));
	parameterMap.put("MMF_V3_pedigreeNo", request.getAttribute("MMF_V3_pedigreeNo"));
	/* start  แม่วัวรุ่น 3 ฝังแม่ ของ พ่อ ของ แม่ DAM in COW */
	parameterMap.put("MFM_V3_cowNo", request.getAttribute("MFM_V3_cowNo"));
	parameterMap.put("MFM_V3_herdNo", request.getAttribute("MFM_V3_herdNo"));
	parameterMap.put("MFM_V3_pedigreeNo", request.getAttribute("MFM_V3_pedigreeNo"));
	/* start  แม่วัวรุ่น 3 ฝังแม่ ของ พ่อ ของ พ่อ DAM in COW */
	parameterMap.put("MFF_V3_cowNo", request.getAttribute("MFF_V3_cowNo"));
	parameterMap.put("MFF_V3_herdNo", request.getAttribute("MFF_V3_herdNo"));
	parameterMap.put("MFF_V3_pedigreeNo", request.getAttribute("MFF_V3_pedigreeNo"));
	
	JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,parameterMap/* ,jrDataSource */);
	JasperExportManager.exportReportToPdfStream(jasperPrint,response.getOutputStream());
	response.getOutputStream().flush();
	response.getOutputStream().close();
	
}catch(IOException e){
	e.printStackTrace();
}
%>




