package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.joker.dq.service.TbCarePeopleManager;
import com.joker.dq.model.TbCarePeople;
import com.joker.dq.webapp.action.BaseActionTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class TbCarePeopleActionTest extends BaseActionTestCase {
    private TbCarePeopleAction action;

    @Autowired
    private TbCarePeopleManager tbCarePeopleManager;

    @Before
    public void onSetUp() {
        super.onSetUp();

        action = new TbCarePeopleAction();
        action.setTbCarePeopleManager(tbCarePeopleManager);

        // add a test tbCarePeople to the database
        TbCarePeople tbCarePeople = new TbCarePeople();

        // enter all required fields

        tbCarePeopleManager.save(tbCarePeople);
    }

    @Test
    public void testGetAllTbCarePeoples() throws Exception {
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertTrue(action.getTbCarePeoples().size() >= 1);
    }

    @Test
    public void testSearch() throws Exception {
        // regenerate indexes
        tbCarePeopleManager.reindex();

        action.setQ("*");
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertEquals(4, action.getTbCarePeoples().size());
    }

    @Test
    public void testEdit() throws Exception {
        log.debug("testing edit...");
        action.setPeopleId(-1L);
        assertNull(action.getTbCarePeople());
        assertEquals("success", action.edit());
        assertNotNull(action.getTbCarePeople());
        assertFalse(action.hasActionErrors());
    }

    @Test
    public void testSave() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setPeopleId(-1L);
        assertEquals("success", action.edit());
        assertNotNull(action.getTbCarePeople());

        TbCarePeople tbCarePeople = action.getTbCarePeople();
        // update required fields

        action.setTbCarePeople(tbCarePeople);

        assertEquals("input", action.save());
        assertFalse(action.hasActionErrors());
        assertFalse(action.hasFieldErrors());
        assertNotNull(request.getSession().getAttribute("messages"));
    }

    @Test
    public void testRemove() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setDelete("");
        TbCarePeople tbCarePeople = new TbCarePeople();
        tbCarePeople.setPeopleId(-2L);
        action.setTbCarePeople(tbCarePeople);
        assertEquals("success", action.delete());
        assertNotNull(request.getSession().getAttribute("messages"));
    }
}
