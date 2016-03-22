package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.Preparable;
import com.joker.dq.service.DqHuiManager;
import com.joker.dq.service.PartyGroupManager;
import com.joker.dq.dao.SearchException;
import com.joker.dq.model.DqHui;
import com.joker.dq.model.PartyGroup;
import com.joker.dq.webapp.action.BaseAction;

import java.util.Date;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class DqHuiAction extends BaseAction implements Preparable {
    private DqHuiManager dqHuiManager;
    private List dqHuies;
    private DqHui dqHui;
    private Long huiId;
    private String query;
    private PartyGroupManager partyGroupManager;

    public void setPartyGroupManager(PartyGroupManager partyGroupManager) {
		this.partyGroupManager = partyGroupManager;
	}

	public void setDqHuiManager(DqHuiManager dqHuiManager) {
        this.dqHuiManager = dqHuiManager;
    }

    public List getDqHuies() {
        return dqHuies;
    }

    /**
     * Grab the entity from the database before populating with request parameters
     */
    public void prepare() {
        if (getRequest().getMethod().equalsIgnoreCase("post")) {
            // prevent failures on new
            String dqHuiId = getRequest().getParameter("dqHui.huiId");
            if (dqHuiId != null && !dqHuiId.equals("")) {
                dqHui = dqHuiManager.get(new Long(dqHuiId));
            }
        }
    }

    public void setQ(String q) {
        this.query = q;
    }

    public String list() {
        try {
        	Map condition = new HashMap();
            dqHuies = dqHuiManager.search(condition, DqHui.class, getPage());
        } catch (SearchException se) {
            addActionError(se.getMessage());
            dqHuies = dqHuiManager.getAll(getPage());
        }
        if(query != null){
        	getRequest().setAttribute("showForm", "showData");
        }
        return SUCCESS;
    }

    public void setHuiId(Long huiId) {
        this.huiId = huiId;
    }

    public DqHui getDqHui() {
        return dqHui;
    }

    public void setDqHui(DqHui dqHui) {
        this.dqHui = dqHui;
    }

    public String delete() {
        dqHuiManager.remove(dqHui.getHuiId());
        saveMessage(getText("dqHui.deleted"));

        return SUCCESS;
    }

    public String edit() {
    	String huiTypeStr = "";
        if (huiId != null) {
            dqHui = dqHuiManager.get(huiId);
            huiTypeStr = getEnumerationSelector(7l, Long.valueOf(dqHui.getHuiType()));
        } else {
            dqHui = new DqHui();
            huiTypeStr = getEnumerationSelector(7l, null);
        }
        getRequest().setAttribute("huiTypeStr", huiTypeStr);
        return SUCCESS;
    }

    public String save() throws Exception {
        if (cancel != null) {
            super.setJsonResult("取消保存");
            return "jsonResult";
        }

        if (delete != null) {
            dqHuiManager.remove(dqHui.getHuiId());
        	super.setJsonResult("删除成功");
            return "jsonResult";
        }

        boolean isNew = (dqHui.getHuiId() == null);
        if(isNew){
        	dqHui.setCreatedByUser(getCurrentUser().getId());
        	dqHui.setCreatedTime(new Date());
        	//获取操作元的归属支部，没有直接归属支部就选择归属行政村的支部
        	//获取用户的党支部
        	//如用户没有归属的党支部，则查询用户直属partygroup拥有的支部信息
        	PartyGroup zhibu = partyGroupManager.getZhiBuByPersonId(super.getCurrentPerson().getPartyId());
        	if(zhibu==null){
        		List pgList = super.getRelationPartyGroup();
        		if(pgList!=null && pgList.size()>0){
        			PartyGroup pg = (PartyGroup)pgList.get(0);
        			zhibu = partyGroupManager.getZhiBuByCun(pg.getPartyId());
        		}
        	}
        	if(zhibu!=null){
        		dqHui.setZhibuPartyId(zhibu.getPartyId());
        	}else{
        		super.setJsonResult("支部不正确，无法添加三会一课信息！");
                return "jsonResult";
        	}
        	
        }else{
        	dqHui.setLastUpdatedByUser(getCurrentUser().getId());
        	dqHui.setLastUpdatedTime(new Date());
        }
        dqHui = dqHuiManager.save(dqHui);
        
        String key = (isNew) ? "dqHui.added" : "dqHui.updated";
        saveMessage(getText(key));

        super.setJsonResult("保存成功");
        return "jsonResult";
    }
}