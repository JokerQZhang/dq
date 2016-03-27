package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.Preparable;
import com.joker.dq.service.PetitionManager;
import com.joker.dq.dao.SearchException;
import com.joker.dq.model.Petition;
import com.joker.dq.webapp.action.BaseAction;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class PetitionAction extends BaseAction implements Preparable {
    private PetitionManager petitionManager;
    private List petitions;
    private Petition petition;
    private Long petitionId;
    private String query;

    public void setPetitionManager(PetitionManager petitionManager) {
        this.petitionManager = petitionManager;
    }

    public List getPetitions() {
        return petitions;
    }

    /**
     * Grab the entity from the database before populating with request parameters
     */
    public void prepare() {
        if (getRequest().getMethod().equalsIgnoreCase("post")) {
            // prevent failures on new
            String petitionId = getRequest().getParameter("petition.petitionId");
            if (petitionId != null && !petitionId.equals("")) {
                petition = petitionManager.get(new Long(petitionId));
            }
        }
    }

    public void setQ(String q) {
        this.query = q;
    }

    public String list() {
        try {
        	Map condition = new HashMap();
            petitions = petitionManager.search(condition, Petition.class, getPage());
        } catch (SearchException se) {
            addActionError(se.getMessage());
            petitions = petitionManager.getAll(getPage());
        }
        if(query != null){
        	getRequest().setAttribute("showForm", "showData");
        }
        return SUCCESS;
    }

    public void setPetitionId(Long petitionId) {
        this.petitionId = petitionId;
    }

    public Petition getPetition() {
        return petition;
    }

    public void setPetition(Petition petition) {
        this.petition = petition;
    }

    public String delete() {
        petitionManager.remove(petition.getPetitionId());
        saveMessage(getText("petition.deleted"));

        return SUCCESS;
    }

    public String edit() {
        if (petitionId != null) {
            petition = petitionManager.get(petitionId);
        } else {
            petition = new Petition();
        }

        return SUCCESS;
    }

    public String save() throws Exception {
        if (cancel != null) {
            super.setJsonResult("取消保存");
            return "jsonResult";
        }

        if (delete != null) {
            petitionManager.remove(petition.getPetitionId());
        	super.setJsonResult("删除成功");
            return "jsonResult";
        }

        boolean isNew = (petition.getPetitionId() == null);

        petition = petitionManager.save(petition);

        String key = (isNew) ? "petition.added" : "petition.updated";
        saveMessage(getText(key));

        super.setJsonResult("保存成功");
        return "jsonResult";
    }
}