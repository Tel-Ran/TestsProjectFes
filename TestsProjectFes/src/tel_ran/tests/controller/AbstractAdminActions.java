package tel_ran.tests.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.bridge.IMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tel_ran.tests.services.common.ICommonData;
import tel_ran.tests.services.common.IPublicStrings;
import tel_ran.tests.services.interfaces.ICommonAdminService;
import tel_ran.tests.strings.IMessages;

public abstract class AbstractAdminActions {	
	
	public static StringBuffer autoGeneratedHTMLFormText;
	public static  StringBuffer autoGeneratedInformationTextHTML;
	
	public static final String RESULT = "result"; 
	
	
	ICommonAdminService adminService;
	
	
	public AbstractAdminActions(){
		autoGeneratedHTMLFormText = new StringBuffer();
		autoGeneratedInformationTextHTML = new StringBuffer();			
	}
	
	// --------------- CREATE QUESTIONS. AUTO ------------------------------------------------------ //
	
	/**
	 * CREATE questions by auto generation
	 * @param category = list of metaCategories
	 * @param nQuestions = total number of questions to create
	 * @param levelOfDifficulty = list of dif.Level 
	 * @param model
	 * @param path - path to result-page (may be different for sub-classes)	 * 
	 */
	public String moduleForBuildingQuestions(String category, String nQuestions, Model model, String path) {		
		int nQuest = Integer.parseInt(nQuestions);

		boolean actionRes = false;
		try {
			int levelOfDifficulty = 5;
			actionRes = adminService.moduleForBuildingQuestions(category, null, levelOfDifficulty , nQuest);
		} catch (Exception e) {
			System.out.println("catch call maintenanceaction from FES moduleForBuildingQuestions");//----------------------------------------------------sysout
			//e.printStackTrace();
		}
		
		//TEXT:
		// your request to build ... questions made
		// your request to build ... questions failed
		StringBuilder result = new StringBuilder("<br><p class='informationTextP'>");
		result.append(IMessages.YOUR_REQUEST).append(" |").append(nQuestions).
			append("| ").append(IMessages.QUESTION_ITEMS).append(" ");
		if(actionRes){				
			result.append(IMessages.MADE); 		
		}else{			
			result.append(IMessages.FAILED);
		}
		result.append("</p>");
		AutoInformationTextHTML(result.toString());		
		return path;// return too page after action
	}
	
	
	/**
	 * List of auto-metaCategory for page with auto generation
	 * 
	 */
	protected String maintenanceOtherResurses(String path) {
		clearStringBuffer();
		autoGeneratedHTMLFormText.append(buildAutoMetaCategoryList());
		return path;
	}	
	
	//// AJAX for upload picture for new question on creating
	@RequestMapping(value="/upload-file", method=RequestMethod.POST)
	public @ResponseBody JsonResponse uploadFile(HttpServletRequest request) {	
		JsonResponse res = new JsonResponse(); 
		String concatRes = " ";

		// TO DO Method !!!!
		res.setStatus("SUCCESS");
		res.setResult(concatRes);
		return res;
	}
	
	//// ajax meta category question creation onload page action 
	@RequestMapping(value="/categoryCreationAction", method=RequestMethod.POST)  
	public @ResponseBody JsonResponse handlerCode(HttpServletRequest request) {	
		JsonResponse res = new JsonResponse(); 
		String concatRes = " ";
		List<String> result = adminService.getPossibleMetaCaterories();
		for(String re:result){		
			concatRes += "<option value='" + re + "'>"+ re +"</option>";
		}
		res.setStatus("SUCCESS"); 
		res.setResult(concatRes);
		return res;
	}
	
	// --------------- CREATE QUESTIONS. MANUAL ------------------------------------------------------ //
	
	public String addingPage(String path) {
		clearStringBuffer();
		AutoInformationTextHTML(buildingUsersCategoryBoxTestHTML());
		return path;
	}
		
	public String AddProcessingPage(String questionText, String descriptionText, String codeText,
			String  category1, String metaCategory, String category2, String  compcategory, String levelOfDifficulty, 
			String fileLocationLink, String correctAnswer, String numberAnswersOnPicture, 
			String at1, String at2, String at3, String at4,  Model model, String path)
	{	
		boolean actionRes = false; // flag work action
		List<String> answers = new ArrayList<>();
		int countAnswersOptions = 0;
		String[] answerOptions = {at1, at2, at3, at4};
		String message = "";
		boolean isError = false;
		for(int i = 0; i < answerOptions.length; i++) {
			
			if(answerOptions[i]!=null && answerOptions[i].length() > 0) {
				countAnswersOptions++;
				answers.add(answerOptions[i]);
			}
		}
		
		if(countAnswersOptions==0) {
			answers = null;
			if(metaCategory==IPublicStrings.COMPANY_AMERICAN_TEST) { 
				message = "<p class='outTextInfo'> Error adding the question. You should fill in 2 or more answer options</p>";
				isError = true;
			}
			
		} else if (countAnswersOptions == 1) {
			message = "<p class='outTextInfo'> Error adding the question. Should be more than 1 answer options</p>";
			isError = true;
		}
		
		
		if(!isError) {
					
			int numberOfResponsesInThePicture;
			
			try {
				numberOfResponsesInThePicture = Integer.parseInt(numberAnswersOnPicture);
			} catch (Exception e) {
				numberOfResponsesInThePicture = 0;
			}
			
			if(category1.equals("Create company category")) {
				category1 = compcategory;
			}
			
			String repCategory = null;
			if(category2!=null) {
				repCategory = category2.replaceAll(",", "").replaceAll("none", "");
			}
			
			String repMetaCategory = null;
			if(metaCategory!=null)
				repMetaCategory = metaCategory.replaceAll(",", "").replaceAll("none", ""); 
			////

		try {
			int lvl = Integer.parseInt(levelOfDifficulty);
			actionRes = adminService.createNewQuestion(questionText, fileLocationLink, repMetaCategory, category1, lvl, answers, correctAnswer, 
					0, numberOfResponsesInThePicture, descriptionText, codeText, repCategory);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("maintenance addProcessingPage :method: Exception");//----------------------------------------------------sysout
		}
		
		// ==========================================
		if (actionRes) {
			message = "<p class='outTextInfoAdded'> Question successfully added</p>";			
			actionRes = false;
		} else {
			// write alternative flow !!!
			message = "<p class='outTextInfo'> Error adding the question, the question already exists. Try again</p>";// out
		}
		}
		System.out.println(message);
		model.addAttribute("result",message);
		addingPage(path);
		return message; // return too page after action
	}
	
	
	// ----------------------- METHODS FOR LISTS AND TEXTS----------------------------------------------- // 

	private String buildAutoMetaCategoryList() {		
		List<String> categoryList = adminService.getPossibleMetaCaterories();
		// TEXT OF MESSAGE
		// auto generation isn't available
		return getOptionsFromList(categoryList, IMessages.NO_AUTO_CATEGORIES);
	}
	
	protected String buildingUsersCategoryBoxTestHTML() {
		String result;
		List<String> categoryList;
		try {
			categoryList = adminService.getUsersCategories1FromDataBase();
			result = getOptionsFromList(categoryList, getStringInBold(IMessages.NO_CATEGORIES_IN_DB));			
		} catch (Exception e) {
			result = getStringInBold(IMessages.NO_DATA_BASE);		
			System.out.println("no data base found");//----------------------------------------------------sysout
		}
		
		return result;// return too page after action
		
	}
	
	protected String checkUsersCategoryBoxTestHTML(StringBuffer baseStr) {
		String result = null;
		List<String> categoryList = adminService.getUsersCategories1FromDataBase();
		List<String> results = new ArrayList<>();
		for (String str : categoryList) {
			if(baseStr.indexOf(str)==-1)
				results.add(str);				
		}
		if(results.size() > 0) {
			result = getOptionsFromList(results, null);
		}
		return result;
	}
	
	protected String buildingCategory2CheckBoxTextHTML() {		
		String result;
		List<String> categoryList;
		try {
			categoryList = adminService.getAllCategories2FromDataBase();
			result = getOptionsFromList(categoryList, getStringInBold(IMessages.NO_CATEGORIES_IN_DB));			
		} catch (Exception e) {
			result = getStringInBold(IMessages.NO_DATA_BASE);		
			System.out.println("no data base found");//----------------------------------------------------sysout
		}
		
		return result;// return too page after action
	}
	
	protected String buildingCategory1CheckBoxTextHTML() {		
		String result;
		List<String> categoryList;
		try {
			categoryList = adminService.getAllCategories1FromDataBase();
			result = getOptionsFromList(categoryList, getStringInBold(IMessages.NO_CATEGORIES_IN_DB));			
		} catch (Exception e) {
			result = getStringInBold(IMessages.NO_DATA_BASE);		
			System.out.println("no data base found");//----------------------------------------------------sysout
		}
		
		return result;// return too page after action
	}
	
	protected String buildingMetaCategory1CheckBoxTextHTML() {		
		String result;
		List<String> categoryList;
		try {
			categoryList = adminService.getAllMetaCategoriesFromDataBase();
			for(int i = 0; i < ICommonData.USER_CATEGORY.length; i++) {
				categoryList.add(ICommonData.USER_CATEGORY[i]);
			}
			result = getOptionsFromList(categoryList, getStringInBold(IMessages.NO_CATEGORIES_IN_DB));			
		} catch (Exception e) {
			result = getStringInBold(IMessages.NO_DATA_BASE);		
			System.out.println("no data base found");//----------------------------------------------------sysout
		}
		
		return result;// return too page after action
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// This methods work as getter for text to jsp page, in text HTML for sam page
	public static String AutoGeneratedInformationTextHTML(){	
		String outTextResult = "";
		if(autoGeneratedInformationTextHTML != null){
			outTextResult = autoGeneratedInformationTextHTML.toString();	
			autoGeneratedInformationTextHTML.delete(0, autoGeneratedInformationTextHTML.length());// clear stringbuffer
		}	
		System.out.println(outTextResult);
		return outTextResult;		
	}
	
	protected void AutoInformationTextHTML(String string) {
		autoGeneratedInformationTextHTML.append(string);
	}
	

	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// This methods work as getter for text to jsp page, in text HTML for sam page
	public static String autoGeneratedHTMLForm(){		
		String outTextResult = "";
		if(autoGeneratedHTMLFormText != null){
			outTextResult = autoGeneratedHTMLFormText.toString();
		}else{
			outTextResult = "<h3>404 Page Not Found </h3>";		
		}			
		return outTextResult;		
	}	
	
	// ---------------------- INNER METHODS ----------------------------------------------- //
	
	private String getStringInBold(String str) {
		return "<b>" + str + "</b>";
	}
	
	protected void clearStringBuffer() {
		if(autoGeneratedHTMLFormText!=null)
			autoGeneratedHTMLFormText.delete(0, autoGeneratedHTMLFormText.length());// clear stringbuffer		
	}
	
	private String getOptionsFromList(List<String> lst, String message) {
		StringBuilder result = new StringBuilder();
		if (lst != null) {			
			for (String tresR : lst) {	
				if(tresR!=null)
				result.append("<option value='" + tresR + "'> "+ tresR + "</option>");					
			}				
		} else {
			result.append(message);
		}
		return result.toString();
	}
	
	// ---------------------- INNER CLASS ------------------------------------------------- //
	
	protected class JsonResponse {
		private String status = null;
		private Object result = null;
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public Object getResult() {
			return result;
		}
		public void setResult(Object result) {
			this.result = result;
		}
	}
	
	// ------------------------- UPDATE PAGE -------------------------------------------------- //
		
	public String updatePage(String path, Model model) {
		clearStringBuffer();				
		AutoInformationTextHTML(buildingCategory1CheckBoxTextHTML());
		String res = adminService.getAllQuestionsList(true, null, null);
		
		model.addAttribute(RESULT, res);
		return path;
	}
	
	
	
}
