package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.Preparable;
import com.joker.dq.service.TestPaperManager;
import com.joker.dq.dao.SearchException;
import com.joker.dq.model.TestPaper;
import com.joker.dq.webapp.action.BaseAction;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class TestPaperAction extends BaseAction implements Preparable {
    private TestPaperManager testPaperManager;
    private List testPapers;
    private TestPaper testPaper;
    private Long paperId;
    private String query;

    public void setTestPaperManager(TestPaperManager testPaperManager) {
        this.testPaperManager = testPaperManager;
    }

    public List getTestPapers() {
        return testPapers;
    }

    /**
     * Grab the entity from the database before populating with request parameters
     */
    public void prepare() {
        if (getRequest().getMethod().equalsIgnoreCase("post")) {
            // prevent failures on new
            String testPaperId = getRequest().getParameter("testPaper.paperId");
            if (testPaperId != null && !testPaperId.equals("")) {
                testPaper = testPaperManager.get(new Long(testPaperId));
            }
        }
    }

    public void setQ(String q) {
        this.query = q;
    }

    public String list() {
        try {
        	Map condition = new HashMap();
            testPapers = testPaperManager.search(condition, TestPaper.class, getPage());
        } catch (SearchException se) {
            addActionError(se.getMessage());
            testPapers = testPaperManager.getAll(getPage());
        }
        if(query != null){
        	getRequest().setAttribute("showForm", "showData");
        }
        return SUCCESS;
    }

    public void setPaperId(Long paperId) {
        this.paperId = paperId;
    }

    public TestPaper getTestPaper() {
        return testPaper;
    }

    public void setTestPaper(TestPaper testPaper) {
        this.testPaper = testPaper;
    }

    public String delete() {
        testPaperManager.remove(testPaper.getPaperId());
        saveMessage(getText("testPaper.deleted"));

        return SUCCESS;
    }

    public String edit() {
        if (paperId != null) {
            testPaper = testPaperManager.get(paperId);
        } else {
            testPaper = new TestPaper();
        }

        return SUCCESS;
    }

    public String save() throws Exception {
        if (cancel != null) {
            super.setJsonResult("取消保存");
            return "jsonResult";
        }

        if (delete != null) {
            testPaperManager.remove(testPaper.getPaperId());
        	super.setJsonResult("删除成功");
            return "jsonResult";
        }

        boolean isNew = (testPaper.getPaperId() == null);

        testPaper = testPaperManager.save(testPaper);

        String key = (isNew) ? "testPaper.added" : "testPaper.updated";
        saveMessage(getText(key));

        super.setJsonResult("保存成功");
        return "jsonResult";
    }
    public String examination(){
    	return SUCCESS;
    }
    public String examinationpaper(){
    	return SUCCESS;
    }
}